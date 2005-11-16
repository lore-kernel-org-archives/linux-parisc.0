From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] fix warnings when using _syscall# macros from
	unistd.h to declare void functions
Date: Wed, 16 Nov 2005 16:55:14 +0000
Message-ID: <20051116165514.GF27571@toucan.gentoo.org>
References: <20051113115342.GA32170@toucan.gentoo.org>
	<20051116163048.GA31729@parisc-linux.org>
	<20051116163847.GE27571@toucan.gentoo.org>
	<20051116164238.GB31729@parisc-linux.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="opJtzjQTFsWo+cga"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051116164238.GB31729@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 16, 2005 at 09:42:38AM -0700, Matthew Wilcox wrote:
> On Wed, Nov 16, 2005 at 04:38:47PM +0000, Mike Frysinger wrote:
> > On Wed, Nov 16, 2005 at 09:30:48AM -0700, Matthew Wilcox wrote:
> > > On Sun, Nov 13, 2005 at 11:53:42AM +0000, Mike Frysinger wrote:
> > > > if you try to declare a void function using the _syscall macros 
> > > > provided by asm-parisc/unistd.h, you'll get warnings about trying to
> > > > return from a non-void function ... i386 fixes this by typecasting

> > i noticed though when trying to do mmap:
> > mmap.c:16: warning: return makes pointer from integer without a cast
> 
> If you'd posted that example, I don't think I would have blinked ;-)
> Send a patch please ;-)

yeah sorry, i saw a warning and didnt really read it ... when i glanced
in the file i picked out the issue pretty quickly and hadnt tried to
reproduce again ... /me smacks self
-mike

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="parisc-cast-unistd-syscalls.patch"

--- /usr/src/linux-2.6.git/include/asm-parisc/unistd.h
+++ uClibc/libc/sysdeps/linux/hppa/bits/syscalls.h
@@ -875,38 +875,38 @@
 #define _syscall0(type,name)						\
 type name(void)								\
 {									\
-    return K_INLINE_SYSCALL(name, 0);	                                \
+    return (type) K_INLINE_SYSCALL(name, 0);	                                \
 }
 
 #define _syscall1(type,name,type1,arg1)					\
 type name(type1 arg1)							\
 {									\
-    return K_INLINE_SYSCALL(name, 1, arg1);	                        \
+    return (type) K_INLINE_SYSCALL(name, 1, arg1);	                        \
 }
 
 #define _syscall2(type,name,type1,arg1,type2,arg2)			\
 type name(type1 arg1, type2 arg2)					\
 {									\
-    return K_INLINE_SYSCALL(name, 2, arg1, arg2);	                \
+    return (type) K_INLINE_SYSCALL(name, 2, arg1, arg2);	                \
 }
 
 #define _syscall3(type,name,type1,arg1,type2,arg2,type3,arg3)		\
 type name(type1 arg1, type2 arg2, type3 arg3)				\
 {									\
-    return K_INLINE_SYSCALL(name, 3, arg1, arg2, arg3);	                \
+    return (type) K_INLINE_SYSCALL(name, 3, arg1, arg2, arg3);	                \
 }
 
 #define _syscall4(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
 type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4)		\
 {									\
-    return K_INLINE_SYSCALL(name, 4, arg1, arg2, arg3, arg4);	        \
+    return (type) K_INLINE_SYSCALL(name, 4, arg1, arg2, arg3, arg4);	        \
 }
 
 /* select takes 5 arguments */
 #define _syscall5(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5) \
 type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5)	\
 {									\
-    return K_INLINE_SYSCALL(name, 5, arg1, arg2, arg3, arg4, arg5);	\
+    return (type) K_INLINE_SYSCALL(name, 5, arg1, arg2, arg3, arg4, arg5);	\
 }
 
 #ifdef __KERNEL__
@@ -937,7 +937,7 @@
 #define _syscall6(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5,type6,arg6) \
 type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5, type6 arg6) \
 {									        \
-    return K_INLINE_SYSCALL(name, 6, arg1, arg2, arg3, arg4, arg5, arg6);	\
+    return (type) K_INLINE_SYSCALL(name, 6, arg1, arg2, arg3, arg4, arg5, arg6);	\
 }
 
 #ifdef __KERNEL_SYSCALLS__

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--opJtzjQTFsWo+cga--
