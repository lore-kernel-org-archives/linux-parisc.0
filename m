From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Just a question about a sba_iommu.c warning with gcc
	64bit (but not 32bit)?
Date: Wed, 10 May 2006 14:08:39 +0200
Message-ID: <IZ1TQF$AB963885A7ABF163B254A190F47F10B6@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

Hello all,

Compiling kernel 2.6.17-rc3-pa3 with gcc-4.1 64bits, I read in log:

hppa64-linux-gnu-gcc-4.1 -Wp,-MD,drivers/parisc/.sba_iommu.o.d  -nostdinc=

-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.1/include -D_
_KERNEL__ -Iinclude -Iinclude2 -I/usr/src/linux-2.6.17-rc3-pa3/include
-include include/linux/autoconf.h -I/usr/src/linux-2.6.17-rc3
-pa3/drivers/parisc -Idrivers/parisc -Wall -Wundef -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit-fr
ame-pointer -pipe -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
-ffunction-sections -march=3D2.0 -mschedule=3D8000 -Wdeclaratio
n-after-statement -Wno-pointer-sign  -D"KBUILD_STR(s)=3D#s"
-D"KBUILD_BASENAME=3DKBUILD_STR(sba_iommu)"  -D"KBUILD_MODNAME=3DKBUILD_S=
TR(sb
a_iommu)" -c -o drivers/parisc/sba_iommu.o
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c: In function
'sba_unmap_single':
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1000: warning: v=
alue
computed is not used
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c: In function
'sba_hw_init':
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1767: warning:
initialization makes integer from pointer without a cast
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1782: warning:
passing argument 1 of '__raw_readq' makes pointer from integ
er without a cast
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1782: warning:
passing argument 1 of '__raw_readq' makes pointer from integ
er without a cast
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1782: warning:
passing argument 1 of '__raw_readq' makes pointer from integ
er without a cast
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1784: warning:
passing argument 2 of '__raw_writeq' makes pointer from inte
ger without a cast
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1790: warning:
passing argument 2 of '__raw_writeq' makes pointer from inte
ger without a cast
/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1794: warning: v=
alue
computed is not used 

The most interesting to me being "warning: value computed is not used";

looking into code this warning seems to make sense:
[snip]
        if (++(ioc->saved_cnt) >=3D DELAYED_RESOURCE_CNT) {
                int cnt =3D ioc->saved_cnt;
                while (cnt--) {
                        sba_free_range(ioc, d->iova, d->size);
                        d--;
                }
                ioc->saved_cnt =3D 0;

/* l 1000 */    READ_REG(ioc->ioc_hpa+IOC_PCOM);        /* flush purges *=
/
        }
[snip]
                        /*
                        ** Make sure the box crashes on rope errors.
                        */
                        WRITE_REG(HF_ENABLE, ioc_hpa + ROPE0_CTL + j);
                }

                /* flush out the last writes */
/* l 1794 */    READ_REG(sba_dev->ioc[i].ioc_hpa + ROPE7_CTL);

                DBG_INIT("      ioc[%d] ROPE_CFG 0x%Lx  ROPE_DBG 0x%Lx\n"=
,
[snip]

The precompile showing finaly for the line 1000:
(__builtin_constant_p((__u64)((__u64)(__le64)(__raw_readq(ioc->ioc_hpa+0x=
310))))
? \
    ({ 
      __u64 __x =3D ((( __u64)(__le64)(__raw_readq(ioc->ioc_hpa+0x310))))=
;
      ((__u64)( (__u64)(((__u64)(__x) & (__u64)0x00000000000000ffULL) << =
56) |
       (__u64)(((__u64)(__x) & (__u64)0x000000000000ff00ULL) << 40) | 
       (__u64)(((__u64)(__x) & (__u64)0x0000000000ff0000ULL) << 24) | 
       (__u64)(((__u64)(__x) & (__u64)0x00000000ff000000ULL) << 8) | 
       (__u64)(((__u64)(__x) & (__u64)0x000000ff00000000ULL) >> 8) | 
       (__u64)(((__u64)(__x) & (__u64)0x0000ff0000000000ULL) >> 24) | 
       (__u64)(((__u64)(__x) & (__u64)0x00ff000000000000ULL) >> 40) | 
       (__u64)(((__u64)(__x) & (__u64)0xff00000000000000ULL) >> 56) ));
     }) :
     __fswab64((( __u64)(__le64)(__raw_readq(ioc->ioc_hpa+0x310)))));

so may be is it not a reading only because of:
# 51 "include2/asm/byteorder.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__=
))
__u64 ___arch__swab64(__u64 x) {
 __u64 temp;
 __asm__("permh,3210 %0, %0\n\t"
  "hshl %0, 8, %1\n\t"
  "hshr,u %0, 8, %0\n\t"
  "or %1, %0, %0"
  : "=3Dr" (x), "=3D&r" (temp)
  : "0" (x));
 return x;
}

(which imho clobber x i.e. 'ioc->ioc_hpa+0x310'?)

Dave, is there any reason why even compilation options are the same:
  hppa64-linux-gnu-gcc-4.1 --save-temps \
        -Wp,-MD,drivers/parisc/.sba_iommu.o.d  \
        -nostdinc \
        -isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.1/include \
        -D__KERNEL__ \
        -Iinclude \
        -Iinclude2 \
        -I/usr/src/linux-2.6.17-rc3-pa3/include \
        -include include/linux/autoconf.h \
        -I/usr/src/linux-2.6.17-rc3-pa3/drivers/parisc \
        -Idrivers/parisc \
        -Wall \
        -Wundef \
        -Wstrict-prototypes \
        -Wno-trigraphs \
        -fno-strict-aliasing \
        -fno-common \
        -O2 \
        -fomit-frame-pointer \
        -pipe \
        -mno-space-regs \
        -mfast-indirect-calls \
        -mdisable-fpregs \
        -ffunction-sections \  
        -march=3D2.0 \
        -mschedule=3D8000 \
        -Wdeclaration-after-statement \
        -Wno-pointer-sign  \
        -D"KBUILD_STR(s)=3D#s" \
        -D"KBUILD_BASENAME=3DKBUILD_STR(sba_iommu)"  \
        -D"KBUILD_MODNAME=3DKBUILD_STR(sba_iommu)" \
        -c \
        -o drivers/parisc/sba_iommu.o \
        /usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c

  gcc-4.1 --save-temps \
        -Wp,-MD,drivers/parisc/.sba_iommu.o.d  \
        -nostdinc \
        -isystem /usr/lib/gcc/hppa-linux-gnu/4.1.1/include \
        -D__KERNEL__ \
        -Iinclude \
        -Iinclude2 \
        -I/CAD/linux-2.6.17-rc3-pa3/include \
        -include include/linux/autoconf.h \
        -I/CAD/linux-2.6.17-rc3-pa3/drivers/parisc \
        -Idrivers/parisc \
        -Wall \
        -Wundef \
        -Wstrict-prototypes \
        -Wno-trigraphs \
        -fno-strict-aliasing \
        -fno-common \
        -O2 \
        -fomit-frame-pointer \
        -pipe \
        -mno-space-regs \
        -mfast-indirect-calls \
        -mdisable-fpregs \
        -ffunction-sections \
        -march=3D2.0 \
        -mschedule=3D8000 \
        -Wdeclaration-after-statement \
        -Wno-pointer-sign  \
        -D"KBUILD_STR(s)=3D#s" \
        -D"KBUILD_BASENAME=3DKBUILD_STR(sba_iommu)"  \
        -D"KBUILD_MODNAME=3DKBUILD_STR(sba_iommu)" \
        -c \
        -o drivers/parisc/.tmp_sba_iommu.o \
        /CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c

this warning is not the same for 32bit kernel:
  gcc-4.1 -Wp,-MD,drivers/parisc/.sba_iommu.o.d  -nostdinc -isystem
/usr/lib/gcc/hppa-linux-gnu/4.1.1/include -D__KERNEL__ -Iinclude
 -Iinclude2 -I/CAD/linux-2.6.17-rc3-pa3/include -include
include/linux/autoconf.h -I/CAD/linux-2.6.17-rc3-pa3/drivers/parisc -Idri=
ve
rs/parisc -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -O2 -fomit-frame-pointer -pipe -mno-spac=

e-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=3D=
2.0
-mschedule=3D8000 -Wdeclaration-after-statement -Wno-poin
ter-sign  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(sba_iomm=
u)" 
-D"KBUILD_MODNAME=3DKBUILD_STR(sba_iommu)" -c -o drivers/par
isc/.tmp_sba_iommu.o /CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c=

/CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c: In function
\xe2\x80\x98sba_hw_init\xe2\x80\x99:
/CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1767: warning:
initialization makes integer from pointer without a cast
/CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1782: warning: passi=
ng
argument 1 of \xe2\x80\x98__raw_readl\xe2\x80\x99 makes 
pointer from integer without a cast
/CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1782: warning: passi=
ng
argument 1 of \xe2\x80\x98__raw_readl\xe2\x80\x99 makes 
pointer from integer without a cast
/CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1782: warning: passi=
ng
argument 1 of \xe2\x80\x98__raw_readl\xe2\x80\x99 makes 
pointer from integer without a cast
/CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1784: warning: passi=
ng
argument 2 of \xe2\x80\x98__raw_writel\xe2\x80\x99 makes
 pointer from integer without a cast
/CAD/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1790: warning: passi=
ng
argument 2 of \xe2\x80\x98__raw_writel\xe2\x80\x99 makes
 pointer from integer without a cast

while compiler release are the same:
on n4k:
ii  gcc-4.1-hppa64              4.1.0-2                     The GNU C com=
piler
(cross compiler for hppa64)

on b2k:
ii  gcc-4.1                     4.1.0-2                     The GNU C com=
piler

as well as the kernel sources.

Thanks for advise,
    Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous de=
venez aujourd'hui Scarlet One grace a un client existant de Scarlet, vous=
 recevez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite su=
r http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
