From: rubisher <rubisher@scarlet.be>
Subject: ccio-dma/iommu-helper in 2.6.24-rc4
Date: Sat, 05 Jan 2008 18:35:48 +0000
Message-ID: <477FCE04.2070505@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Kyle,

While building new 2.6.24-rc4 (from your parisc-2.6.git tree) I encount=
ered the following issue:

   gcc -Wp,-MD,drivers/parisc/.ccio-dma.o.d  -nostdinc -isystem /usr/li=
b/gcc/hppa-linux-gnu/4.2.3/include -D__KERNEL__=20
-Iinclude -Iinclude2 -I/CAD/linux-2.6.24-rc4-pa-git-20071206-trace/incl=
ude -include include/linux/autoconf.h=20
-I/CAD/linux-2.6.24-rc4-pa-git-20071206-trace/drivers/parisc -Idrivers/=
parisc -Wall -Wundef -Wstrict-prototypes=20
-Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-functi=
on-declaration -O2 -pipe -mno-space-regs=20
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=3D1.1=
 -mschedule=3D7200 -fomit-frame-pointer=20
-fno-stack-protector -Wdeclaration-after-statement -Wno-pointer-sign  -=
D"KBUILD_STR(s)=3D#s"=20
-D"KBUILD_BASENAME=3DKBUILD_STR(ccio_dma)"  -D"KBUILD_MODNAME=3DKBUILD_=
STR(ccio_dma)" -c -o drivers/parisc/ccio-dma.o=20
/CAD/linux-2.6.24-rc4-pa-git-20071206-trace/drivers/parisc/ccio-dma.c
/CAD/linux-2.6.24-rc4-pa-git-20071206-trace/drivers/parisc/ccio-dma.c: =
In function 'ccio_alloc_range':
/CAD/linux-2.6.24-rc4-pa-git-20071206-trace/drivers/parisc/ccio-dma.c:4=
28: warning: unused variable 'res_idx'
In file included from /CAD/linux-2.6.24-rc4-pa-git-20071206-trace/drive=
rs/parisc/ccio-dma.c:982:
/CAD/linux-2.6.24-rc4-pa-git-20071206-trace/drivers/parisc/iommu-helper=
s.h: In function 'iommu_fill_pdir':
/CAD/linux-2.6.24-rc4-pa-git-20071206-trace/drivers/parisc/iommu-helper=
s.h:67: error: implicit declaration of function 'sg_virt'

After a short search, I find a similar pb in <http://www.kernel.org/pub=
/linux/kernel/v2.6/snapshots/patch-2.6.24-rc1-git1.log>:
[snip]
commit 18ccc4194389c6edc78ede76ada3bf753525b11c
Author: Haavard Skinnemoen <hskinnemoen@atmel.com>
Date:   Wed Oct 24 10:16:02 2007 +0200

     AVR32: Fix sg_page breakage

     The latest sg changes introduce the following build errors on AVR3=
2:

     include/asm/dma-mapping.h: In function =91dma_map_sg=92:
     include/asm/dma-mapping.h:220: error: implicit declaration of func=
tion =91sg_page=92
     include/asm/dma-mapping.h:220: error: invalid operands to binary -
     include/asm/dma-mapping.h:221: error: implicit declaration of func=
tion =91sg_virt=92
     include/asm/dma-mapping.h:221: warning: assignment makes pointer f=
rom integer without a cast
     include/asm/dma-mapping.h: In function =91dma_sync_sg_for_device=92=
:
     include/asm/dma-mapping.h:330: warning: passing argument 2 of =91d=
ma_cache_sync=92 makes pointer from integer without a cast

     Fix it by including the correct header file, i.e. linux/scatterlis=
t.h
     instead of asm/scatterlist.h.

     Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
[snip]

and so tied the same fix:
Signed-off-by: Joel Soete <soete dot joel at scarlet dot be>
Index: linux-trace-pa/include/asm-parisc/dma-mapping.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-trace-pa.orig/include/asm-parisc/dma-mapping.h	2008-01-05 15:=
26:28.000000000 +0000
+++ linux-trace-pa/include/asm-parisc/dma-mapping.h	2008-01-05 15:26:56=
=2E000000000 +0000
@@ -2,8 +2,8 @@
  #define _PARISC_DMA_MAPPING_H

  #include <linux/mm.h>
+#include <linux/scatterlist.h>
  #include <asm/cacheflush.h>
-#include <asm/scatterlist.h>

  /* See Documentation/DMA-mapping.txt */
  struct hppa_dma_ops {
=3D=3D=3D <> =3D=3D=3D

What do you think about?

Tia,
	r.
-
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
