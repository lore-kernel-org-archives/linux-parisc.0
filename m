From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Possible fix? [was: RE: [parisc-linux] linux and gcc 3.x question?]
Date: Mon, 7 Jun 2004 19:39:03 +0200
Message-ID: <40BD9F0500003688@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: parisc-linux@parisc-linux.org
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

May be a better patch:
--- compiler-gcc3.h.orig	2004-06-03 17:01:16.000000000 +0200
+++ compiler-gcc3.h	2004-06-07 18:04:08.144851584 +0200
@@ -4,9 +4,9 @@
 #include <linux/compiler-gcc.h>

 #if __GNUC_MINOR__ >=3D 1  && __GNUC_MINOR__ < 4
-# define inline		__inline__ __attribute__((always_inline))
+# define inline		__inline__
+# define __inline	__inline__
 # define __inline__	__inline__ __attribute__((always_inline))
-# define __inline	__inline__ __attribute__((always_inline))
 #endif

 #if __GNUC_MINOR__ > 0
=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D

Any opinion?

Thanks,
    Joel

> -- Original Message --
> Date: Thu, 3 Jun 2004 17:17:01 +0200
> From: "Joel Soete" <soete.joel@tiscali.be>
> To: parisc-linux@parisc-linux.org
> Cc:
> Subject: [parisc-linux] linux and gcc 3.x question?
>
>
> Hello all,
>
> I just noticed that when I pre-compile some ncr53c8xx.c with gcc-3.3.4
on
> my p-l box as follow:
> "gcc -Wp,-MD,drivers/scsi/.zalon53c720.o.d -nostdinc -iwithprefix inclu=
de
> -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing
> -fno-common -pipe -mno-space-regs -mfast-indirect-calls -mdisable-fpreg=
s
> -ffunction-sections -O2
> -DCONFIG_NCR53C8XX_PREFETCH -DSCSI_NCR_BIG_ENDIAN -DCONFIG_SCSI_NCR53C8=
XX_NO_WORD_TRANSFERS
>   -DKBUILD_BASENAME=3Dncr53c8xx -DKBUILD_MODNAME=3Dzalon7xx -E -o drive=
rs/scsi/ncr53c8xx.o
> drivers/scsi/ncr53c8xx.c"
>
> I got:
> [...]
> static __inline__ __attribute__((always_inline)) __attribute__((always_=
inline))
> int __attribute__((deprecated)) check_region(unsigned long s, unsigned
long
> n)
> [...]
>
> (2 time __attribute__((always_inline))?)
> It comes from:
>
> include/linux/compiler-gcc3.h
> [...]
>
> #if __GNUC_MINOR__ >=3D 1  && __GNUC_MINOR__ < 4
> # define inline         __inline__ __attribute__((always_inline))
> # define __inline__     __inline__ __attribute__((always_inline))
> # define __inline       __inline__ __attribute__((always_inline))
> #endif
> [...]
>
> because when I comment the second "define", I got better:
> [...]
> static __inline__ __attribute__((always_inline)) int __attribute__((dep=
recated))
> check_region(unsigned long s, unsigned long n)
> [...]
>
> I very doubt that's the right thing to do so if somebody as any idea?
>
> TIA,
>     Joel
>
>
> -----------------------------------------------------------------------=
-----------------
> Tiscali ADSL, 27,50 ?/mois...pendant 6 mois.
> La meilleure offre du march=E9 !
> http://reg.tiscali.be/default.asp?lg=3Dfr
>
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------=
---------------
Tiscali ADSL, 27,50 =80/mois...pendant 6 mois. 
La meilleure offre du march=E9 !
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
