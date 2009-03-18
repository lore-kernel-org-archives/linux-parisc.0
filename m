From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: can't compile kernel for parisc
Date: Wed, 18 Mar 2009 14:55:13 +0300
Message-ID: <a4423d670903180455u20ead146k919426a1fb7276c6@mail.gmail.com>
References: <a4423d670903030457k20f2e975ya567e9d3b1a5a3ab@mail.gmail.com>
	 <20090303163348.422E34E9A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090303163348.422E34E9A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

ld now does not segfault

http://lists.gnu.org/archive/html/bug-binutils/2009-03/msg00105.html

but I still can not build kernel.

   ld    -r -o init/built-in.o init/main.o init/version.o
init/mounts.o init/noinitramfs.o init/calibrate.o
  ld  --build-id -o .tmp_vmlinux1 -T arch/parisc/kernel/vmlinux.lds
arch/parisc/kernel/head.o   init/built-in.o --start-group
usr/built-in.o  arch/parisc/mm/built-in.o
arch/parisc/kernel/built-in.o  arch/parisc/math-emu/built-in.o
arch/parisc/kernel/init_task.o  kernel/built-in.o  mm/built-in.o
fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o
block/built-in.o  lib/lib.a  arch/parisc/lib/lib.a `gcc
-print-libgcc-file-name`  lib/built-in.o  arch/parisc/lib/built-in.o
`gcc -print-libgcc-file-name`  drivers/built-in.o  sound/built-in.o
firmware/built-in.o  net/built-in.o --end-group
ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot reach
000000b2_b2:46+4068, recompile with -ffunction-sections
ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot handle
R_PARISC_PCREL12F for .text

I have recompiled kernel with -ffunction-sections, but still the same problem.

diff --git a/Makefile b/Makefile
index 2e2f4a4..61b09b2 100644
--- a/Makefile
+++ b/Makefile
@@ -346,7 +346,7 @@ KBUILD_CPPFLAGS := -D__KERNEL__

 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                   -fno-strict-aliasing -fno-common \
-                  -Werror-implicit-function-declaration
+                  -Werror-implicit-function-declaration -ffunction-sections
 KBUILD_AFLAGS   := -D__ASSEMBLY__

 # Read KERNELRELEASE from include/config/kernel.release (if it exists)


gcc version 4.3.3 (Gentoo 4.3.3-r1 p1.1, pie-10.1.5)
