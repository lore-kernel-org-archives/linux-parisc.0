From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Mon, 21 Mar 2005 21:25:13 -0500 (EST)
Message-ID: <200503220225.j2M2PD6E010193@hiauly1.hia.nrc.ca>
References: <20050314132842.GE28289@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050314132842.GE28289@tausq.org> from "Randolph Chung" at Mar
	14, 2005 05:28:42 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> For now I've commited a combination of:
> 1) Change the FIONREAD handling code to explicitly return a 4-byte value
> 2) Change the put_user code to cast the result to the expected type

I got a bit paranoid about __put_user after the above bug.  Looking at
it, I believe that the LP64 version is broken for *(ptr) types of long,
unsigned long, and pointer types.  I believe that the current code
puts a 64-bit value instead of the 32-bit value that the 32-bit runtime
expects for these types.  This is fixed by adding a layer over the
old __put_user macro to do various type checking.

The above change also introduced some new warnings when building a
32-bit kernel.  These occur when the *(ptr) type is a pointer (e.g.,
void *).  The u64 cast in the size = 8 code is undefined, although
the code is actually used.  The current code is also questionable
when x is a pointer type and *(ptr) is a 64-bit type.  This is probably
an unlikely combination.  I believe that these issues are fixed by
the __put_user_cast macro.

The rest of the changes are just warning fixes that I noticed during
testing.  I don't believe that they have a functional effect.

I tested this with 32 and 64-bit builds of 2.6.12-rc1-pa1 with the
default c3000 and 64 configs.  I am running the 32-bit build and a
slighter earlier version survived a gcc build.  I haven't run the
64-bit changes.  I now don't see any cast related errors in the builds
except one in a call to atomic_read.  That's an unrelated problem.

Install if you like.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

? include/asm-parisc/uaccess.h.save
Index: drivers/net/lasi_82596.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/net/lasi_82596.c,v
retrieving revision 1.15
diff -u -p -u -3 -p -r1.15 lasi_82596.c
--- drivers/net/lasi_82596.c	29 Nov 2004 19:56:12 -0000	1.15
+++ drivers/net/lasi_82596.c	22 Mar 2005 01:55:27 -0000
@@ -640,7 +640,7 @@ static int init_i596_mem(struct net_devi
 		       (void*)(dev->base_addr + PA_I82596_RESET),
 		       dev->irq));
 	
-	gsc_writel(0, (void*)(dev->base_addr + PA_I82596_RESET)); /* Hard Reset */
+	gsc_writel(0, (unsigned long)(dev->base_addr + PA_I82596_RESET)); /* Hard Reset */
 	udelay(100);			/* Wait 100us - seems to help */
 
 	/* change the scp address */
Index: drivers/parisc/ccio-dma.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/ccio-dma.c,v
retrieving revision 1.18
diff -u -p -u -3 -p -r1.18 ccio-dma.c
--- drivers/parisc/ccio-dma.c	6 Mar 2005 23:48:39 -0000	1.18
+++ drivers/parisc/ccio-dma.c	22 Mar 2005 01:55:27 -0000
@@ -101,7 +101,7 @@
 #endif
 
 #define CCIO_INLINE	/* inline */
-#define WRITE_U32(value, addr) gsc_writel(value, (u32 *)(addr))
+#define WRITE_U32(value, addr) gsc_writel(value, (unsigned long)(addr))
 #define READ_U32(addr) gsc_readl((u32 *)(addr))
 
 #define U2_IOA_RUNWAY 0x580
@@ -1391,12 +1391,13 @@ ccio_ioc_init(struct ioc *ioc)
 static void
 ccio_init_resource(struct resource *res, char *name, unsigned long ioaddr)
 {
+	void *addr = (void *) ioaddr;
 	int result;
 
 	res->parent = NULL;
 	res->flags = IORESOURCE_MEM;
-	res->start = (unsigned long)(signed) __raw_readl(ioaddr) << 16;
-	res->end = (unsigned long)(signed) (__raw_readl(ioaddr + 4) << 16) - 1;
+	res->start = (unsigned long)(signed) __raw_readl(addr) << 16;
+	res->end = (unsigned long)(signed) (__raw_readl(addr + 4) << 16) - 1;
 	res->name = name;
 	if (res->end + 1 == res->start)
 		return;
@@ -1486,15 +1487,15 @@ int ccio_allocate_resource(const struct 
 
 	if (!expand_ioc_area(parent, size, min, max, align)) {
 		__raw_writel(((parent->start)>>16) | 0xffff0000,
-			     (unsigned long)&(ioc->ioc_hpa->io_io_low));
+			     (void *)&(ioc->ioc_hpa->io_io_low));
 		__raw_writel(((parent->end)>>16) | 0xffff0000,
-			     (unsigned long)&(ioc->ioc_hpa->io_io_high));
+			     (void *)&(ioc->ioc_hpa->io_io_high));
 	} else if (!expand_ioc_area(parent + 1, size, min, max, align)) {
 		parent++;
 		__raw_writel(((parent->start)>>16) | 0xffff0000,
-			     (unsigned long)&(ioc->ioc_hpa->io_io_low_hv));
+			     (void *)&(ioc->ioc_hpa->io_io_low_hv));
 		__raw_writel(((parent->end)>>16) | 0xffff0000,
-			     (unsigned long)&(ioc->ioc_hpa->io_io_high_hv));
+			     (void *)&(ioc->ioc_hpa->io_io_high_hv));
 	} else {
 		return -EBUSY;
 	}
Index: drivers/parisc/hppb.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/hppb.c,v
retrieving revision 1.5
diff -u -p -u -3 -p -r1.5 hppb.c
--- drivers/parisc/hppb.c	2 Mar 2005 06:47:37 -0000	1.5
+++ drivers/parisc/hppb.c	22 Mar 2005 01:55:27 -0000
@@ -74,8 +74,8 @@ static int hppb_probe(struct parisc_devi
 	card->mmio_region.name = "HP-PB Bus";
 	card->mmio_region.flags = IORESOURCE_MEM;
 
-	card->mmio_region.start = __raw_readl(dev->hpa + IO_IO_LOW);
-	card->mmio_region.end = __raw_readl(dev->hpa + IO_IO_HIGH) - 1;
+	card->mmio_region.start = __raw_readl((void *)(dev->hpa + IO_IO_LOW));
+	card->mmio_region.end = __raw_readl((void *)(dev->hpa + IO_IO_HIGH)) - 1;
 
 	status = ccio_request_resource(dev, &card->mmio_region);
 	if(status < 0) {
Index: drivers/scsi/lasi700.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/scsi/lasi700.c,v
retrieving revision 1.12
diff -u -p -u -3 -p -r1.12 lasi700.c
--- drivers/scsi/lasi700.c	15 Mar 2005 12:40:22 -0000	1.12
+++ drivers/scsi/lasi700.c	22 Mar 2005 01:55:27 -0000
@@ -112,7 +112,7 @@ lasi700_probe(struct parisc_device *dev)
 
 	hostdata->dev = &dev->dev;
 	dma_set_mask(&dev->dev, DMA_32BIT_MASK);
-	hostdata->base = ioremap(base, 0x100);
+	hostdata->base = (unsigned long) ioremap(base, 0x100);
 	hostdata->differential = 0;
 
 	if (dev->id.sversion == LASI_700_SVERSION) {
@@ -138,7 +138,7 @@ lasi700_probe(struct parisc_device *dev)
 	return 0;
 
  out_kfree:
-	iounmap(hostdata->base);
+	iounmap((void *)hostdata->base);
 	kfree(hostdata);
 	return -ENODEV;
 }
@@ -153,7 +153,7 @@ lasi700_driver_remove(struct parisc_devi
 	scsi_remove_host(host);
 	NCR_700_release(host);
 	free_irq(host->irq, host);
-	iounmap(hostdata->base);
+	iounmap((void *)hostdata->base);
 	kfree(hostdata);
 
 	return 0;
Index: drivers/video/stifb.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/video/stifb.c,v
retrieving revision 1.15
diff -u -p -u -3 -p -r1.15 stifb.c
--- drivers/video/stifb.c	29 Nov 2004 20:42:47 -0000	1.15
+++ drivers/video/stifb.c	22 Mar 2005 01:55:27 -0000
@@ -517,7 +517,7 @@ rattlerSetupPlanes(struct stifb_info *fb
 	SETUP_HW(fb);
 	WRITE_BYTE(1, fb, REG_16b1);
 
-	fb_memset(fb->info.fix.smem_start, 0xff,
+	fb_memset((void *)fb->info.fix.smem_start, 0xff,
 		fb->info.var.yres*fb->info.fix.line_length);
     
 	CRX24_SET_OVLY_MASK(fb);
@@ -977,7 +977,7 @@ stifb_write(struct file *file, const cha
 	    err = -EFAULT;
 	    if (copy_from_user(&tmpbuf, buf, len))
 		    break;
-	    memcpy_toio(p, &tmpbuf, len);
+	    memcpy_toio((void *)p, &tmpbuf, len);
 	    c -= len;
 	    p += len;
 	    buf += len;
Index: include/asm-parisc/uaccess.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/uaccess.h,v
retrieving revision 1.20
diff -u -p -u -3 -p -r1.20 uaccess.h
--- include/asm-parisc/uaccess.h	18 Mar 2005 13:17:43 -0000	1.20
+++ include/asm-parisc/uaccess.h	22 Mar 2005 01:55:28 -0000
@@ -80,7 +80,20 @@ struct exception_data {
 	unsigned long fault_addr;
 };
 
-#define __get_user(x,ptr)                               \
+#ifdef __LP64__
+#define __get_user(x,ptr)						\
+  __builtin_choose_expr(						\
+    sizeof(__typeof__(*(ptr))) < 8					\
+    || __builtin_types_compatible_p(s64, __typeof__(*(ptr)))		\
+    || __builtin_types_compatible_p(u64, __typeof__(*(ptr)))		\
+    || __builtin_types_compatible_p(double, __typeof__(*(ptr))),	\
+    __get_user_compat(x, ptr),						\
+    __get_user_compat(x, (u32 *)(unsigned long)(ptr)))
+#else
+#define __get_user __get_user_compat
+#endif
+
+#define __get_user_compat(x,ptr)                        \
 ({                                                      \
 	register long __gu_err __asm__ ("r8") = 0;      \
 	register long __gu_val __asm__ ("r9") = 0;      \
@@ -104,7 +117,7 @@ struct exception_data {
 	    }                                           \
 	}                                               \
 							\
-	(x) = (__typeof__(*(ptr))) __gu_val;            \
+	(x) = (__typeof__(x))__gu_val;			\
 	__gu_err;                                       \
 })
 
@@ -146,26 +159,66 @@ struct exception_data {
 		: "r1");
 #endif /* !__LP64__ */
 
-#define __put_user(x,ptr)                                       \
+#ifdef __LP64__
+#define __put_user(x,ptr)						\
+  __builtin_choose_expr(						\
+    sizeof(__typeof__(*(ptr))) != 8					\
+    || __builtin_types_compatible_p(s64, __typeof__(*(ptr)))		\
+    || __builtin_types_compatible_p(u64, __typeof__(*(ptr)))		\
+    || __builtin_types_compatible_p(double, __typeof__(*(ptr))),	\
+    __put_user_compat((u64)(x), ptr),					\
+    __put_user_compat((u64)(x), (u32 *)(unsigned long)(ptr)))
+#else
+/* It is necessary to cast X to a suitable type for __put_user_compat.
+   64-bit values need truncation when PTR points to a smaller object.
+   It is also difficult to handle pointer types without generating
+   warnings from the u64 cast in the code for size 8.  The (void)0
+   choice generates a compile error if an unhandled type combination
+   is encountered.  */
+#define __put_user_cast(x,ptr)						\
+  __builtin_choose_expr(						\
+    (sizeof(__typeof__(x)) == 1						\
+     || sizeof(__typeof__(x)) == 2					\
+     || sizeof(__typeof__(x)) == 4					\
+     || sizeof(__typeof__(x)) == 8)					\
+    && (sizeof(__typeof__(*(ptr))) == 1					\
+	|| sizeof(__typeof__(*(ptr))) == 2				\
+	|| sizeof(__typeof__(*(ptr))) == 4),				\
+    (u32)(x),								\
+    __builtin_choose_expr(						\
+      (sizeof(__typeof__(x)) == 1					\
+       || sizeof(__typeof__(x)) == 2					\
+       || sizeof(__typeof__(x)) == 4)					\
+      && sizeof(__typeof__(*(ptr))) == 8,				\
+      (u64)(u32)(x),							\
+      __builtin_choose_expr(						\
+	sizeof(__typeof__(x)) == 8					\
+	&& sizeof(__typeof__(*(ptr))) == 8,				\
+	(x),								\
+	(void)0)))
+
+#define __put_user(x,ptr) __put_user_compat(__put_user_cast(x, ptr), ptr)
+#endif
+
+#define __put_user_compat(x,ptr)                                \
 ({								\
 	register long __pu_err __asm__ ("r8") = 0;      	\
-        __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);	\
 								\
 	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
 	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_kernel_asm("stb",__x,ptr); break;     \
-	    case 2: __put_kernel_asm("sth",__x,ptr); break;     \
-	    case 4: __put_kernel_asm("stw",__x,ptr); break;     \
-	    case 8: STD_KERNEL(__x,ptr); break;			\
+	    case 1: __put_kernel_asm("stb",x,ptr); break;       \
+	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
+	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
+	    case 8: STD_KERNEL(x,ptr); break;			\
 	    default: __put_kernel_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
 	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_user_asm("stb",__x,ptr); break;       \
-	    case 2: __put_user_asm("sth",__x,ptr); break;       \
-	    case 4: __put_user_asm("stw",__x,ptr); break;       \
-	    case 8: STD_USER(__x,ptr); break;			\
+	    case 1: __put_user_asm("stb",x,ptr); break;         \
+	    case 2: __put_user_asm("sth",x,ptr); break;         \
+	    case 4: __put_user_asm("stw",x,ptr); break;         \
+	    case 8: STD_USER(x,ptr); break;			\
 	    default: __put_user_bad(); break;			\
 	    }                                                   \
 	}                                                       \
@@ -219,10 +272,10 @@ struct exception_data {
 		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
 		: "r1")
 
-#define __put_kernel_asm64(__val,ptr) do {		    	    \
-	u64 __val64 = (u64)(__val);				    \
-	u32 hi = (__val64) >> 32;					    \
-	u32 lo = (__val64) & 0xffffffff;				    \
+#define __put_kernel_asm64(__val,ptr) do {	    	    \
+	u64 __val64 = (u64)__val;			    \
+	u32 hi = (__val64) >> 32;			    \
+	u32 lo = (__val64) & 0xffffffff;		    \
 	__asm__ __volatile__ (				    \
 		"\n1:\tstw %2,0(%1)\n"			    \
 		"\n2:\tstw %3,4(%1)\n"			    \
@@ -235,10 +288,10 @@ struct exception_data {
 		: "r1");				    \
 } while (0)
 
-#define __put_user_asm64(__val,ptr) do {		    	    \
-	u64 __val64 = (u64)__val;				    \
-	u32 hi = (__val64) >> 32;					    \
-	u32 lo = (__val64) & 0xffffffff;				    \
+#define __put_user_asm64(__val,ptr) do {	    	    \
+	u64 __val64 = (u64)__val;			    \
+	u32 hi = (__val64) >> 32;			    \
+	u32 lo = (__val64) & 0xffffffff;		    \
 	__asm__ __volatile__ (				    \
 		"\n1:\tstw %2,0(%%sr3,%1)\n"		    \
 		"\n2:\tstw %3,4(%%sr3,%1)\n"		    \
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
