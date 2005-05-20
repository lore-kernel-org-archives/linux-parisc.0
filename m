From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ccio-dma 64bit debug_init info
Date: Fri, 20 May 2005 12:42:05 +0200
Message-ID: <4282FEEE00003164@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="========/4282FEEE00003164/mail-6-bnl.tiscali.it"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--========/4282FEEE00003164/mail-6-bnl.tiscali.it
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello Grant,

Sorry for delay but I encountered some config pb with my isp imp config :=
-(

>
> On Tue, May 17, 2005 at 06:29:18PM +0200, Joel Soete wrote:
> > > > ccio-dma.c: failed to claim CCIO bus address space (ffffffff00000=
000,ffffffffffffffff)
> ...
> > > It would be interesting to know why it's asking for that range.
> > > Where are the values of that range coming from?
>
> > 32bit kernel:
> ...
> > ccio_init_resource(res=3D10712c68, name=3DGSC Bus [8/], ioaddr=3Dfff8=
8078)
> > ccio_init_resource() res->start f1000000
> > ccio_init_resource() res->end f17fffff
> > ccio_init_resource() res->end + 1  f1800000
> > ccio_init_resource() claimed CCIO bus address space (f1000000, f17fff=
ff)
> > ccio_init_resource(res=3D10712c84, name=3DGSC Bus [8/], ioaddr=3Dfff8=
8060)
> > ccio_init_resource() res->start fc000000
> > ccio_init_resource() res->end fff7ffff
> > ccio_init_resource() res->end + 1  fff80000
> > ccio_init_resource() claimed CCIO bus address space (fc000000, fff7ff=
ff)
> ...
>
> Ah...I forgot that U2/Uturn have two sets of range registers.
> One per GSC bus....
>
No pb ;-)

> BTW, PDC sets all of this address stuff up AFAIK.
>
Any idea where is the doc about this feature?

> ...
> > ccio_init_resource(res=3D1071245c, name=3DGSC Bus [10/], ioaddr=3Dfff=
8a078)
> > ccio_init_resource() res->start f1800000
> > ccio_init_resource() res->end f1ffffff
> > ccio_init_resource() res->end + 1  f2000000
> > ccio_init_resource() claimed CCIO bus address space (f1800000, f1ffff=
ff)
> > ccio_init_resource(res=3D10712478, name=3DGSC Bus [10/], ioaddr=3Dfff=
8a060)
> > ccio_init_resource() res->start 00000000
> > ccio_init_resource() res->end ffffffff
> > ccio_init_resource() res->end + 1  00000000
> > Lasi version 0 at 0xffd00000 found.
> > ...
>
> This last one seems to be disabled.
Ah ok (any idea why? hw failure?)

> That's what this code in ccio_init_resource() is testing for:
> 	if (res->end + 1 =3D=3D res->start)
>                 return;
>
> /me puts on his fortune teller hat and looks in his crystal ball:
> 	"Joel will be submitting a patch shortly...You must add a comment
> 	explaining WTF this test is doing..."
>
Ok ;-)

>
> > 64bit kernel:
> ...
> > ccio_init_resource(res=3D00000000109e3858, name=3DGSC Bus [8/], ioadd=
r=3Dfffffffffff88078)
> > ccio_init_resource() res->start fffffffff1000000
> > ccio_init_resource() res->end fffffffff17fffff
> > ccio_init_resource() res->end + 1  fffffffff1800000
> > ccio_init_resource() claimed CCIO bus address space (fffffffff1000000=
,
> fffffffff17fffff)
> > ccio_init_resource(res=3D00000000109e3890, name=3DGSC Bus [8/], ioadd=
r=3Dfffffffffff88060)
> > ccio_init_resource() res->start fffffffffc000000
> > ccio_init_resource() res->end fffffffffff7ffff
> > ccio_init_resource() res->end + 1  fffffffffff80000
> > ccio_init_resource() claimed CCIO bus address space (fffffffffc000000=
,
> fffffffffff7ffff)
>
> No problem with the first one.
>
(as far as i understand, yes )

> ...
> > ccio_init_resource(res=3D00000000109e5858, name=3DGSC Bus [10/], ioad=
dr=3Dfffffffffff8a078)
> > ccio_init_resource() res->start fffffffff1800000
> > ccio_init_resource() res->end fffffffff1ffffff
> > ccio_init_resource() res->end + 1  fffffffff2000000
> > ccio_init_resource() claimed CCIO bus address space (fffffffff1800000=
,
> fffffffff1ffffff)
> > ccio_init_resource(res=3D00000000109e5890, name=3DGSC Bus [10/], ioad=
dr=3Dfffffffffff8a060)
> > ccio_init_resource() res->start ffffffff00000000
> > ccio_init_resource() res->end ffffffffffffffff
> > ccio_init_resource() res->end + 1  0000000000000000
>
> This fails because io_io_low/high registers in reality are only 16 bits=
.
> The upper 16 bits are hardcoded to 1's.
> The conversion of res->start to 64-bit is wrong for this one case:
> 	res->start =3D (unsigned long)(signed) __raw_readl(ioaddr) << 16;
>
> __raw_readl(ioaddr) returns 0xffff0000.
> 0xffff0000 << 16 should be 0 but it's not since this is 64-bit.
> That line should read something like:
> 	res->start =3D (unsigned long) ((signed) __raw_readl(ioaddr) << 16);
>
cool ;-)

> And please add a comment here too that parenthesis *do* matter.
> Then it should fail the same test that I point out above....
>
> > ccio_init_resource() failed to claim CCIO bus address space (ffffffff=
00000000,
> > ffffffffffffffff)
>
> ...and we wouldn't even try to acquire this range.
>
> > ccio_init_resource() claimed CCIO bus address space (ffffffff00000000=
,
> ffffffffffffffff)
> > Lasi version 0 at 0xffffffffffd00000 found.
> >
> > even thought I have no doc to now what would means:
> >         res->start =3D (unsigned long)(signed) READ_U32(ioaddr) << 16=
;
(=3D=3D
> > 0x0 in 32bits)
> >         res->end =3D (unsigned long)(signed) (READ_U32(ioaddr + 4) <<=
 16)
> -
> > 1; (=3D=3D 0xffffffff in 32bits too)
> >
> > but seems that test:
> >         if (res->end + 1 =3D=3D res->start)
> > is a stuff which not love 64bit :-(
>
> You almost got it right.
>
so here is a first patch:
--- drivers/parisc/ccio-dma.c.orig      2005-05-20 08:47:17.000000000 +02=
00
+++ drivers/parisc/ccio-dma.c.orig1     2005-05-20 12:15:35.000000000 +02=
00
@@ -1328,13 +1328,12 @@
        ioc->pdir_base =3D (u64 *)__get_free_pages(GFP_KERNEL,
                                                 get_order(ioc->pdir_size=
));
        if(NULL =3D=3D ioc->pdir_base) {
-               panic("%s:%s() could not allocate I/O Page Table\n", __FI=
LE__,
-                     __FUNCTION__);
+               panic("%s() could not allocate I/O Page Table\n", __FUNCT=
ION__);
        }
        memset(ioc->pdir_base, 0, ioc->pdir_size);

        BUG_ON((((unsigned long)ioc->pdir_base) & PAGE_MASK) !=3D (unsign=
ed
long)ioc->pdir_base);
-       DBG_INIT(" base %p", ioc->pdir_base);
+       DBG_INIT(" base %p\n", ioc->pdir_base);

        /* resource map size dictated by pdir_size */
        ioc->res_size =3D (ioc->pdir_size / sizeof(u64)) >> 3;
@@ -1343,8 +1342,7 @@
        ioc->res_map =3D (u8 *)__get_free_pages(GFP_KERNEL,
                                              get_order(ioc->res_size));
        if(NULL =3D=3D ioc->res_map) {
-               panic("%s:%s() could not allocate resource map\n", __FILE=
__,
-                     __FUNCTION__);
+               panic("%s() could not allocate resource map\n", __FUNCTIO=
N__);
        }
        memset(ioc->res_map, 0, ioc->res_size);

@@ -1394,15 +1392,21 @@

        res->parent =3D NULL;
        res->flags =3D IORESOURCE_MEM;
-       res->start =3D (unsigned long)(signed) __raw_readl(ioaddr) << 16;=

-       res->end =3D (unsigned long)(signed) (__raw_readl(ioaddr + 4) << =
16)
- 1;
+       /*
+        * bracing ((signed) ...) are required for 64bit kernel
+        */
+       res->start =3D (unsigned long)((signed) READ_U32(ioaddr) << 16);
+       res->end =3D (unsigned long)((signed) (READ_U32(ioaddr + 4) << 16=
)
- 1);
        res->name =3D name;
+       /*
+        * Check if the set of range registers is disable
+        */
        if (res->end + 1 =3D=3D res->start)
                return;
        result =3D request_resource(&iomem_resource, res);
        if (result < 0) {
-               printk(KERN_ERR "%s: failed to claim CCIO bus address spa=
ce
(%08lx,%08lx)\n",
-                      __FILE__, res->start, res->end);
+               printk(KERN_ERR "%s() failed to claim CCIO bus address sp=
ace
(%08lx,%08lx)\n",
+                       __FUNCTION__, res->start, res->end);
        }
 }
=3D=3D=3D=3D<>=3D=3D=3D=3D

Some additional stuff:
--- drivers/parisc/ccio-dma.c.orig      2005-05-20 08:47:17.000000000 +02=
00
+++ drivers/parisc/ccio-dma.c.orig1     2005-05-20 12:15:35.000000000 +02=
00
@@ -1328,13 +1328,12 @@
        ioc->pdir_base =3D (u64 *)__get_free_pages(GFP_KERNEL,
                                                 get_order(ioc->pdir_size=
));
        if(NULL =3D=3D ioc->pdir_base) {
-               panic("%s:%s() could not allocate I/O Page Table\n", __FI=
LE__,
-                     __FUNCTION__);
+               panic("%s() could not allocate I/O Page Table\n", __FUNCT=
ION__);
        }
        memset(ioc->pdir_base, 0, ioc->pdir_size);

        BUG_ON((((unsigned long)ioc->pdir_base) & PAGE_MASK) !=3D (unsign=
ed
long)i
oc->pdir_base);
-       DBG_INIT(" base %p", ioc->pdir_base);
+       DBG_INIT(" base %p\n", ioc->pdir_base);

        /* resource map size dictated by pdir_size */
        ioc->res_size =3D (ioc->pdir_size / sizeof(u64)) >> 3;
@@ -1343,8 +1342,7 @@
        ioc->res_map =3D (u8 *)__get_free_pages(GFP_KERNEL,
                                              get_order(ioc->res_size));
        if(NULL =3D=3D ioc->res_map) {
-               panic("%s:%s() could not allocate resource map\n", __FILE=
__,
-                     __FUNCTION__);
+               panic("%s() could not allocate resource map\n", __FUNCTIO=
N__);
        }
        memset(ioc->res_map, 0, ioc->res_size);

@@ -1394,15 +1392,21 @@

        res->parent =3D NULL;
        res->flags =3D IORESOURCE_MEM;
-       res->start =3D (unsigned long)(signed) __raw_readl(ioaddr) << 16;=

-       res->end =3D (unsigned long)(signed) (__raw_readl(ioaddr + 4) << =
16)
- 1;
+       /*
+        * bracing ((signed) ...) are required for 64bit kernel
+        */
+       res->start =3D (unsigned long)((signed) READ_U32(ioaddr) << 16);
+       res->end =3D (unsigned long)((signed) (READ_U32(ioaddr + 4) << 16=
)
- 1);
        res->name =3D name;
+       /*
+        * Check if the set of range registers is disable
+        */
        if (res->end + 1 =3D=3D res->start)
                return;
        result =3D request_resource(&iomem_resource, res);
        if (result < 0) {
-               printk(KERN_ERR "%s: failed to claim CCIO bus address spa=
ce
(%08
lx,%08lx)\n",
-                      __FILE__, res->start, res->end);
+               printk(KERN_ERR "%s() failed to claim CCIO bus address sp=
ace
(%0
8lx,%08lx)\n",
+                       __FUNCTION__, res->start, res->end);
        }
 }

jso@iatst001:~/work$ more ccio-dma.c.diff
--- drivers/parisc/ccio-dma.c.orig      2005-05-20 08:47:17.000000000 +02=
00
+++ drivers/parisc/ccio-dma.c.orig1     2005-05-20 12:15:35.000000000 +02=
00
@@ -1328,13 +1328,12 @@
        ioc->pdir_base =3D (u64 *)__get_free_pages(GFP_KERNEL,
                                                 get_order(ioc->pdir_size=
));
        if(NULL =3D=3D ioc->pdir_base) {
-               panic("%s:%s() could not allocate I/O Page Table\n", __FI=
LE__,
-                     __FUNCTION__);
+               panic("%s() could not allocate I/O Page Table\n", __FUNCT=
ION__);
        }
        memset(ioc->pdir_base, 0, ioc->pdir_size);

        BUG_ON((((unsigned long)ioc->pdir_base) & PAGE_MASK) !=3D (unsign=
ed
long)ioc->pdir_base);
-       DBG_INIT(" base %p", ioc->pdir_base);
+       DBG_INIT(" base %p\n", ioc->pdir_base);

        /* resource map size dictated by pdir_size */
        ioc->res_size =3D (ioc->pdir_size / sizeof(u64)) >> 3;
@@ -1343,8 +1342,7 @@
        ioc->res_map =3D (u8 *)__get_free_pages(GFP_KERNEL,
                                              get_order(ioc->res_size));
        if(NULL =3D=3D ioc->res_map) {
-               panic("%s:%s() could not allocate resource map\n", __FILE=
__,
-                     __FUNCTION__);
+               panic("%s() could not allocate resource map\n", __FUNCTIO=
N__);
        }
        memset(ioc->res_map, 0, ioc->res_size);

@@ -1394,15 +1392,21 @@

        res->parent =3D NULL;
        res->flags =3D IORESOURCE_MEM;
-       res->start =3D (unsigned long)(signed) __raw_readl(ioaddr) << 16;=

-       res->end =3D (unsigned long)(signed) (__raw_readl(ioaddr + 4) << =
16)
- 1;
+       /*
+        * bracing ((signed) ...) are required for 64bit kernel
+        */
+       res->start =3D (unsigned long)((signed) READ_U32(ioaddr) << 16);
+       res->end =3D (unsigned long)((signed) (READ_U32(ioaddr + 4) << 16=
)
- 1);
        res->name =3D name;
+       /*
+        * Check if the set of range registers is disable
+        */
        if (res->end + 1 =3D=3D res->start)
                return;
        result =3D request_resource(&iomem_resource, res);
        if (result < 0) {
-               printk(KERN_ERR "%s: failed to claim CCIO bus address spa=
ce
(%08lx,%08lx)\n",
-                      __FILE__, res->start, res->end);
+               printk(KERN_ERR "%s() failed to claim CCIO bus address sp=
ace
(%08lx,%08lx)\n",
+                       __FUNCTION__, res->start, res->end);
        }
 }

jso@iatst001:~/work$ vi ccio-dma.c.diff
jso@iatst001:~/work$ more ccio-dma.c.diff1
--- drivers/parisc/ccio-dma.c.orig1     2005-05-20 12:15:35.000000000 +02=
00
+++ drivers/parisc/ccio-dma.c   2005-05-20 12:14:50.000000000 +0200
@@ -387,8 +387,7 @@
                       __FILE__,  __FUNCTION__, pages_needed);
        }

-       panic("%s: %s() I/O MMU is out of mapping resources.\n", __FILE__=
,
-             __FUNCTION__);
+       panic("%s() I/O MMU is out of mapping resources.\n", __FUNCTION__=
);

 resource_found:

@@ -578,7 +577,7 @@
        ** WORD 0 - high order word
        */

-#ifdef __LP64__
+#ifdef CONFIG_64BIT
        /*
        ** get bits 12:15 of physical address
        ** shift bits 16:31 of physical address
@@ -589,7 +588,7 @@
        asm volatile ("depd  %1,35,4,%0" : "+r" (pa) : "r" (ci));
 #else
        pa =3D 0;
-#endif
+#endif /* CONFIG_64BIT */
        /*
        ** get CPU coherency index bits
        ** Grab virtual index [0:11]
@@ -1288,10 +1287,10 @@

        if (iova_space_size < (1 << (20 - PAGE_SHIFT))) {
                iova_space_size =3D  1 << (20 - PAGE_SHIFT);
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
        } else if (iova_space_size > (1 << (30 - PAGE_SHIFT))) {
                iova_space_size =3D  1 << (30 - PAGE_SHIFT);
-#endif
+#endif /* CONFIG_64BIT */
        }

        /*
@@ -1487,15 +1486,15 @@
                return 0;

        if (!expand_ioc_area(parent, size, min, max, align)) {
-               __raw_writel(((parent->start)>>16) | 0xffff0000,
+               WRITE_U32(((parent->start)>>16) | 0xffff0000,
                             &ioc->ioc_regs->io_io_low);
-               __raw_writel(((parent->end)>>16) | 0xffff0000,
+               WRITE_U32(((parent->end)>>16) | 0xffff0000,
                             &ioc->ioc_regs->io_io_high);
        } else if (!expand_ioc_area(parent + 1, size, min, max, align)) {=

                parent++;
-               __raw_writel(((parent->start)>>16) | 0xffff0000,
+               WRITE_U32(((parent->start)>>16) | 0xffff0000,
                             &ioc->ioc_regs->io_io_low_hv);
-               __raw_writel(((parent->end)>>16) | 0xffff0000,
+               WRITE_U32(((parent->end)>>16) | 0xffff0000,
                             &ioc->ioc_regs->io_io_high_hv);
        } else {
                return -EBUSY;
=3D=3D=3D=3D<>=3D=3D=3D=3D

and btw some stuff which could interesting sba:
--- drivers/parisc/sba_iommu.c.orig     2005-05-20 09:07:26.000000000 +02=
00
+++ drivers/parisc/sba_iommu.c  2005-05-20 09:33:23.000000000 +0200
@@ -91,7 +91,7 @@
 #define DBG_RES(x...)
 #endif

-#if defined(__LP64__) && !defined(CONFIG_PDC_NARROW)
+#if defined(CONFIG_64BIT) && !defined(CONFIG_PDC_NARROW)
 /* "low end" PA8800 machines use ZX1 chipset */
 #define ZX1_SUPPORT
 #endif
@@ -231,7 +231,7 @@
        spinlock_t      res_lock;
        unsigned int    res_bitshift;   /* from the LEFT! */
        unsigned int    res_size;       /* size of resource map in bytes
*/
-#if SBA_HINT_SUPPORT
+#ifdef SBA_HINT_SUPPORT
 /* FIXME : DMA HINTs not used */
        unsigned long   hint_mask_pdir; /* bits used for DMA hints */
        unsigned int    hint_shift_pdir;
@@ -294,7 +294,7 @@
 /* Looks nice and keeps the compiler happy */
 #define SBA_DEV(d) ((struct sba_device *) (d))

-#if SBA_AGP_SUPPORT
+#ifdef SBA_AGP_SUPPORT
 static int reserve_sba_gart =3D 1;
 #endif

@@ -314,7 +314,7 @@
 #define WRITE_REG32(val, addr) __raw_writel(cpu_to_le32(val), addr)
 #define WRITE_REG64(val, addr) __raw_writeq(cpu_to_le64(val), addr)

-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 #define READ_REG(addr)         READ_REG64(addr)
 #define WRITE_REG(value, addr) WRITE_REG64(value, addr)
 #else
@@ -324,7 +324,7 @@

 #ifdef DEBUG_SBA_INIT

-/* NOTE: When __LP64__ isn't defined, READ_REG64() is two 32-bit reads *=
/
+/* NOTE: When CONFIG_64BIT isn't defined, READ_REG64() is two 32-bit rea=
ds
*/

 /**
  * sba_dump_ranges - debugging only - print ranges assigned to this IOA
@@ -364,7 +364,7 @@
 #else
 #define sba_dump_ranges(x)
 #define sba_dump_tlb(x)
-#endif
+#endif /* DEBUG_SBA_INIT */


 #ifdef ASSERT_PDIR_SANITY
@@ -674,7 +674,7 @@
 *
 ***************************************************************/

-#if SBA_HINT_SUPPORT
+#ifdef SBA_HINT_SUPPORT
 #define SBA_DMA_HINT(ioc, val) ((val) << (ioc)->hint_shift_pdir)
 #endif

@@ -1245,8 +1245,10 @@
        unsigned long pdir_order =3D get_order(pdir_size);

        pdir_base =3D __get_free_pages(GFP_KERNEL, pdir_order);
-       if (NULL =3D=3D (void *) pdir_base)
-               panic("sba_ioc_init() could not allocate I/O Page Table\n=
");
+       if (NULL =3D=3D (void *) pdir_base) {
+               panic("%s() could not allocate I/O Page Table\n",
+                       __FUNCTION__);
+       }

        /* If this is not PA8700 (PCX-W2)
        **      OR newer than ver 2.2
@@ -1354,7 +1356,7 @@
        u32 iova_space_mask;
        u32 iova_space_size;
        int iov_order, tcnfg;
-#if SBA_AGP_SUPPORT
+#ifdef SBA_AGP_SUPPORT
        int agp_found =3D 0;
 #endif
        /*
@@ -1391,7 +1393,7 @@
        DBG_INIT("%s() pdir %p size %x\n",
                        __FUNCTION__, ioc->pdir_base, ioc->pdir_size);

-#if SBA_HINT_SUPPORT
+#ifdef SBA_HINT_SUPPORT
        ioc->hint_shift_pdir =3D iov_order + PAGE_SHIFT;
        ioc->hint_mask_pdir =3D ~(0x3 << (iov_order + PAGE_SHIFT));

@@ -1415,7 +1417,7 @@

        WRITE_REG(ioc->imask, ioc->ioc_hpa + IOC_IMASK);

-#ifdef __LP64__
+#ifdef CONFIG_64BIT
        /*
        ** Setting the upper bits makes checking for bypass addresses
        ** a little faster later on.
@@ -1448,7 +1450,7 @@
        */
        WRITE_REG(ioc->ibase | 31, ioc->ioc_hpa + IOC_PCOM);

-#if SBA_AGP_SUPPORT
+#ifdef SBA_AGP_SUPPORT
        /*
        ** If an AGP device is present, only use half of the IOV space
        ** for PCI DMA.  Unfortunately we can't know ahead of time
@@ -1528,7 +1530,7 @@
        DBG_INIT("%s() pdir %p size %x\n",
                        __FUNCTION__, ioc->pdir_base, pdir_size);

-#if SBA_HINT_SUPPORT
+#ifdef SBA_HINT_SUPPORT
        /* FIXME : DMA HINTs not used */
        ioc->hint_shift_pdir =3D iov_order + PAGE_SHIFT;
        ioc->hint_mask_pdir =3D ~(0x3 << (iov_order + PAGE_SHIFT));
=3D=3D=3D=3D<>=3D=3D=3D=3D
(Just get rid if you dislike)

Thanks,
    Joel




--========/4282FEEE00003164/mail-6-bnl.tiscali.it
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="ccio-dma.c.diff.gz"

H4sICEe+jUIAA2NjaW8tZG1hLmMuZGlmZgCtVGtv2kgU/Qy/4mykVDbYYBuSUPJQUkoj1BQiGr5V
Gg324I5ibDpjuo+q/33vGPMItKi76sgM9njuufecOdeu6yJS8qtQurngSuqwGYYyc6M5b4SNTMm4
EnjemUtX4MHrdNsXXf+i4a0H6h69r9br9Z/D7CL4Qdc/67bODhBub+H6raDj+C3UVzcBbm+rqMgs
dG8WkVRsyrXANazleRs1m7FY5GymhGALHgtt3b97ZO/742H/wQHFFQNmT6Yioawtjpb/CNu+NNgz
azh5eMD1NV6msfGt6lYqC57K0Do51d1TbdkIs2USIc1y8CTJQp4LDJojPFJ6PPFpIj6lJw4Yezd4
6DPmGAQUg5Ymw97TYDRkjBLXd5D/C+wuBirf6TcXcy1y62XxDjwHe3QpgLa/mdyz0dCisUy1jFMR
IcnS2N4n/wqPd/d99uHu43sbfxjJj22/JKJv39yzwXDwZJ2gOKbTxYmzr6khfrivIHew01TbrEEJ
nS1VKDDnCxgiiGSYk0IRpn9jQw+1ZhWlVShktUZlvxQBzQIimxkH2TZubtC6LJ3XbjkdY7x24Fzs
+M6AmdRGgs4vmm515HvGW1f1Y9+VaX7Zdbuy/DbP/Qj0uOPKsrd+27A0B7gS9nXb8c+Msq8DJ/AL
aQmFNtLBcCXSnLQ1WlyuV2cJjzUtDkbj/sfRZNwjH/Y/GI8Vr3XOVY4DS1qrB5uKVvxPpgSPEiqS
R5GycXUF/3yDINLoSLx1CIA62iWIDRe+EbNZowk1TBUPZRrD2gA0Gg0bxIz0/LKUihLMMoXz9lTm
eBYqFUkR2aT5KKEN4Lh/95ZNWsFLOsWRHuGzJbQXv8/G3iif8rnpGvO3S7H3WYTPkDPknwXo7JHN
oHgaG4ax1Dl99CE1NaY236qSnPE4rE19dfjG7FvCtmkWJfKlSsv8y8SoYEQTOmdrM1qvZEaW2zw7
BqPsoQLfhF3BW7eOkmn+bJmOZP3xGKaJMOMyIV3yDGHC5Ry93mCE6VLDyCG0hl5wsr116nWSv5xi
tosG2DbTtsF2OJT3xK/sr8Pk1Gn/PzspWansNuFPkxetSVf1XxH1TCvQBwAA


--========/4282FEEE00003164/mail-6-bnl.tiscali.it
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="ccio-dma.c.diff1.gz"

H4sICJC5jUIAA2NjaW8tZG1hLmMuZGlmZjEAzVRrb9owFP0cfsUdFRNpEkiAAAsdYu1oh9SWqgVV
0zZZbmLAEiSRHR5d1/++66TQx0rXfplmRfFNfB/nnGvbsiwIBF8wIcsxFVz6Zd/nkRXMaMkvRYKP
Ha1i266FT8UGp+I5rld1S/Z6gGHjes4wjO15nmaoea79R4ZOB6xqs2E2wVBTAzqdHGgaZIOQw95x
lxAzNYenB4Ne/1R9xnTMJAkZC1igtzDiNgc5S4tpyP1iviA9KMiiDr1yH05OhsAlRPMEohHMaBzz
cAyCyWgufCZL38O8eV8Ik2xKb+phBeM+9xvzPswCWm7jQUbRPAw89U+J4DaayN5wGxsRdnfhsn/+
GWywYMLHE4hEwAQscVKrZcV4h48CNsIyx2f1GiE54+7HQf/0sHdE6rX93gCdy7tZvjFL4IonMuuo
wh1PriX36RRoECAymfnJCR+tPete1XnWM0Xd/JCibjbXqKmcwSKa0oRPGRTzAYsDgIJjVl2zZhbs
PHiQN0QeijHVla1Mn+tKnB02lQxTxBQ+gt1CdiwM+AhJpTOyeMQLlASPqB2cDcGPJkyw0L8GHgZs
lZLIPI4EvYIFF8kcSWSL32zPcX6kTJwKcnBwW6LRUIZig4F8BEUeLSiRMcWmSf6TwR4UHdjDd0X1
5uzTUZdcfOkdDnRdhxu1fZ8GfAR4PqD16hbeglIHnoPTXsOpvhXO04BXan6bKoPKp8LVlF4uCldr
1pWRnWDBkrkIVRvXKr5jKzxDAeGRT6hgFHcANioxQWEyYcZDfNGVCXTKx2GK3dI0QgRdkqXgCZsW
i3cxVlsmVCR6u+3UdfgF9mqEQ10rJp5U7fK8N+iSYbXyqgAEm53594jMait4go2lshArmUZLpctW
JKjTW3Bsc/8LCnUBZBfd/T7YIigY4LwkKlbKHA3jJV7/VGEyWfwnImdINjrfPNjLVnd/ePG1lfsN
wGgv6D4HAAA=


--========/4282FEEE00003164/mail-6-bnl.tiscali.it
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="sba_iommu.c.diff.gz"

H4sICJC5jUIAA3NiYV9pb21tdS5jLmRpZmYAvVb7UxpJEP55/Ss6ppJbnsLy0OiZEhXNVhQowJi7
uqqpYXeAKZfdvd3Bx73+9uuegRXQXMzl6ijLgenpnv6+6VepVAI/kbciSXdinsjU20lHnMloNpuX
vXKUyInlVCqNEv45Fai826/s7jvNcmX5gUIF5VuFQuEf7GyYqNX2ndoTE0dHUHpXLe5CQf8/OtqC
174Yy1DA6fE567cH9n25XM7htgh9Od6CrdJrOQZzxrcZu+g164zl4O1beLXcPel2ztxz1js9YZ1W
v9+9zm0VVrUW8mb92B1+VRN28rAdRHeADmxDr7W3h97PuDdFhRTmqYCfP1cBf8apUJDfeUSA+2xw
1et1+8PMfwLs1DRisxBkK41lGETeDVNWIlJGXw9wex6mcoJugQyNYCRVOpVjdWChU+MkmoGaCrho
nw1f6ZufaqTyN6FP0xeIxoCb0TzxBEKI8RSMHhTCQGXN6+C4xT64nWHmN/GGcJ4KiJYz9/NlG/bh
9LIFJEwhjBRR4m94E0ThxELCFJvx9IbFvky0U4THnB9HiTZDh9JnsGhljd1oGyLf1TWReiEi0eRF
FN2gHxIR8tCHGyHiVLPkRbNYBiKBKY/jh7WHInCn7U+2nwPbTlUy9xRQJPviluzkcdvP5ZaxR6db
571nKVrdh1RxJT1yn1gXya1gZHXCEwWHUD1YCWpCU6tqNGZZzYTrvjtsYy6c1xz7lgdF4L6f5ICx
hN+xu0QqEdhePGcqYoEwZ3KLQ88Yada/YOTXRyPmzKMRDZwwLvMtA72aSo+X9dutU7rL1vqWtfyN
dr/kFl04F4sbrQ1vMwFRFqTC8OUYvpwlXyg0Tp22j6/OGb2H2yG3tkoYGJ3usL0P11MRZihApuEP
alkWirDiZg5loO4iqDkljFJ8QO7ruCysm1rF/2/MAQVtfgsgbyJuPovxRcIJ5iQWaTGaTyYynEAU
Bg+4ESc6mIycp4v8UBEGONp3uy1DTNMQ08wCSXOWcb5xkX2fe0amghEJSosQLZiVknad3QWIjPvW
YNDuD7GCun02aOGBn7RPzV3tk1nIJ8Sc/77PzmpCvrBorWX8pZHaMvKKQPGO2a+XH38E2syV3m+U
ndxGyladeqO4BwW9ViummK9VPSA1FiU+Fp5DmAhlvtt6m2py7oDIs/TvEcducojhSefGiRAs5vRA
52c99rHd77Qviiv2ULNkIXy7c3VxAYeHYN9G0qdqlRnD97OsmGM1tLdNa/aYDKXCePSieeDres0D
7DdcCXB3utDDC2HIR4H4JdzGGwpfu8H6Hc8s73iTvtBykZQsxs6uOidDt9vBDk53/am5wBhzxyak
pWkp2HV3sevavZPPpWsHX8HK561uH0Jxh7yqKQ8BpxBwyo55llpDRxuuzWWLndcckNEtZ2nMPaH7
0MHTbd0ucZvSDLcN0UVQXjieHHxj+ddG+CRm42iOnegQKisVH0EuXDXjD661pas0+VBqLfgkruFN
bDr4m3vNHmywV0RvvdL77FlWf2dR9q3JYmkbGymAODJioIAvc95mgw/u2fBgTSHr83j+L7tyX1sk
1XOaOe2dZqNebWg26tXdrKg/NgNb25dkewGQAnoaczTndk+Ye9kafMygvqBf0StQLMFAKEV1lgaF
eRyjg3o0mfEbLLTeVHg3JKUhZfQQY+HV3UikqUiNPodAKhUIGPNUoXbA6X8Ulhew6nsGVqOyfGQ9
4mwi0wXgD8DB8Dl4vZPu5fpDviwOlyAxqTBRUAaLwQazK6bJJFRF02Fomp3yYEyDIlHhdj+BTgxj
gPD3Tlwa1MoAVyH+VvMQoaLqHU5YnNrfTYizMp9ig9NW5Mx062rDMRw0apX/NNC/M8ZfMMb+j2nw
NyMhVKybDQAA

--========/4282FEEE00003164/mail-6-bnl.tiscali.it
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--========/4282FEEE00003164/mail-6-bnl.tiscali.it--
