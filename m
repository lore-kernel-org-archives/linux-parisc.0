From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Sat, 16 Dec 2006 22:55:02 +0100
Message-ID: <200612162255.02615.deller__49108.3649955273$1416624234$gmane$org@gmx.de>
References: <200612162110.kBGLAiiX013928@hiauly1.hia.nrc.ca>
	<200612162217.33074.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612162217.33074.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 16 December 2006 22:17, Helge Deller wrote:
> On Saturday 16 December 2006 22:10, John David Anglin wrote:
> > > > If not, maybe you could try my (ugly & temporary) kernel patch from http://lists.parisc-linux.org/pipermail/parisc-linux/2006-December/030967.html ?
> > > 
> > > I'll give it a try.
> > 
> > I get a bunch of messages like:
> > WARNING: "show_stack" [net/ipv6/ipv6.ko] undefined!
> 
> disable ipv6 for now... The problem is show_stack() in access_ok().
> I don't use modules atm.

this is an updated patch, where only the absolute necessary pieces were changed.
It applies to current git tree...

Helge

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 5575e41..72a873d 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -56,6 +56,7 @@
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <asm/uaccess.h>
+#include <asm/io.h>
 #define s_space "%%sr1"
 #define d_space "%%sr2"
 #else
@@ -488,23 +489,37 @@ handle_store_error:
 #ifdef __KERNEL__
 unsigned long copy_to_user(void __user *dst, const void *src, unsigned long len)
 {
-	mtsp(get_kernel_space(), 1);
-	mtsp(get_user_space(), 2);
-	return pa_memcpy((void __force *)dst, src, len);
+	BUG_ON((long) len < 0);
+	if (access_ok(VERIFY_WRITE, dst, len)) {
+		mtsp(get_kernel_space(), 1);
+		mtsp(get_user_space(), 2);
+		len = pa_memcpy((void __force *)dst, src, len);
+	};
+	return len;
 }
 
 unsigned long copy_from_user(void *dst, const void __user *src, unsigned long len)
 {
-	mtsp(get_user_space(), 1);
-	mtsp(get_kernel_space(), 2);
-	return pa_memcpy(dst, (void __force *)src, len);
+	BUG_ON((long) len < 0);
+	if (access_ok(VERIFY_READ, src, len)) {
+		mtsp(get_user_space(), 1);
+		mtsp(get_kernel_space(), 2);
+		len = pa_memcpy(dst, (void __force *)src, len);
+	} else
+		memset(dst, 0, len);
+	return len;
 }
 
 unsigned long copy_in_user(void __user *dst, const void __user *src, unsigned long len)
 {
-	mtsp(get_user_space(), 1);
-	mtsp(get_user_space(), 2);
-	return pa_memcpy((void __force *)dst, (void __force *)src, len);
+	BUG_ON((long) len < 0);
+        if (likely(access_ok(VERIFY_READ, src, len) &&
+            access_ok(VERIFY_WRITE, dst, len))) {
+		mtsp(get_user_space(), 1);
+		mtsp(get_user_space(), 2);
+		len = pa_memcpy((void __force *)dst, (void __force *)src, len);
+	}
+	return len;
 }
 
 
@@ -516,6 +531,24 @@ void * memcpy(void * dst,const void *src
 	return dst;
 }
 
+long access_ok(int type, const void __user * addr, unsigned long size)
+{
+	unsigned long a = (unsigned long __force) addr;
+	long ok;
+
+	if (segment_eq(get_fs(),KERNEL_DS))
+		ok = 1;
+	else
+		ok = (a < F_EXTEND(0xfff00000));
+	if (unlikely(!ok)) {
+		printk(KERN_ERR "function %s() FAILED for addr=%p len=%lx\n", __FUNCTION__, addr, size);
+		show_stack(NULL,NULL);
+	}
+	return (ok);
+}
+EXPORT_SYMBOL(access_ok);
+
+
 EXPORT_SYMBOL(copy_to_user);
 EXPORT_SYMBOL(copy_from_user);
 EXPORT_SYMBOL(copy_in_user);
diff --git a/include/asm-parisc/uaccess.h b/include/asm-parisc/uaccess.h
index 2e87e82..3dbac23 100644
--- a/include/asm-parisc/uaccess.h
+++ b/include/asm-parisc/uaccess.h
@@ -33,14 +33,7 @@ extern int __get_user_bad(void);
 extern int __put_kernel_bad(void);
 extern int __put_user_bad(void);
 
-static inline long access_ok(int type, const void __user * addr,
-		unsigned long size)
-{
-	return 1;
-}
-
-#define put_user __put_user
-#define get_user __get_user
+long access_ok(int type, const void __user * addr, unsigned long size);
 
 #if BITS_PER_LONG == 32
 #define LDD_KERNEL(ptr)		__get_kernel_bad();
@@ -254,6 +247,21 @@ struct exception_data {
 #endif /* !__LP64__ */
 
 
+/* Uh, these should become the main single-value transfer routines..
+ * They automatically use the right size if we just have the right
+ * pointer type..
+ */
+#define put_user(x,ptr) ({				\
+	__chk_user_ptr(ptr);				\
+	likely(access_ok(0,ptr,sizeof(*(ptr)))) ?	\
+	 __put_user(x,ptr) : -EFAULT; })
+
+#define get_user(x,ptr) ({				\
+	__chk_user_ptr(ptr);				\
+	likely(access_ok(0,ptr,sizeof(*(ptr)))) ?	\
+	__get_user(x,ptr) : ({ x=0; -EFAULT;});  })
+
+
 /*
  * Complex access routines -- external declarations
  */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
