Return-Path: <esproul@ntelos.net>
Received: from mailrtr03.ntelos.net (mailrtr03.ntelos.net [216.12.0.103])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1BD84996
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 08:31:22 -0700 (MST)
Received: from thunderbolt.oss.ntelos.net (thunderbolt.oss.ntelos.net
	[216.12.8.195])
	by mailrtr03.ntelos.net (8.11.7/8.11.7) with ESMTP id i2OFVLS30932
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 10:31:22 -0500
From: Eric Sproul <esproul@ntelos.net>
To: PA-RISC Linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Message-Id: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
Mime-Version: 1.0
Date: Wed, 24 Mar 2004 10:31:20 -0500
Subject: [parisc-linux] gdth driver on L2000
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,
Forgive me if this is a FAQ.  I read the website FAQ and did a little
searching, but didn't turn up anything.  I am not a kernel hacker--
that's why I'm posting here.

I am running Debian sid on a 2-way L2000-44 (rp5450).  I have
successfully built a 64-bit, SMP 2.4.25 kernel using Debian's source
(I'd be happy to share my config if anyone is interested) and the
kernel-patch-2.4.25-hppa patch.

I want to use an Intel SRCU RAID controller in this machine, so I
modified my config to build the gdth driver into the kernel.  It fails
with an error about DMA_MODE_CASCADE being undeclared.  Looking further,
I note that this is normally declared in include/asm-$ARCH/dma.h, but it
doesn't appear in include/asm-parisc/dma.h.  Is it undeclared because it
doesn't work or because no one has needed it before?  Below is the build
output.

Would I be better off with a 2.6 kernel?  I have not yet attempted to
build any 2.6 kernels on this machine.  I took the lack of stock 2.6
kernels for hppa in sid to mean that there was a problem, but I'd love
to be wrong about that.  ;)

Thanks,
Eric

$ uname -a
Linux parisc 2.4.25-64-smp #1 SMP Mon Mar 22 10:09:38 EST 2004 parisc64
GNU/Linux

gcc-3.3-hppa64 3.3.3-2
binutils-hppa64 2.14.90.0.7-5


hppa64-linux-gcc -D__KERNEL__ -I/usr/src/kernel-source-2.4.25/include
-Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing
-fno-common -O2 -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=2.0
-mschedule=8000   -nostdinc -I
/usr/lib/gcc-lib/hppa64-linux/3.3.3/include -DKBUILD_BASENAME=gdth  -c
-o gdth.o gdth.c
gdth.c: In function `gdth_init_isa':
gdth.c:1135: warning: passing arg 1 of `memset_io' makes integer from pointer without a cast
gdth.c: In function `gdth_init_pci':
gdth.c:1292: warning: passing arg 1 of `memset_io' makes integer from pointer without a cast
gdth.c:1405: warning: passing arg 1 of `memset_io' makes integer from pointer without a cast
gdth.c:1560: warning: passing arg 1 of `memset_io' makes integer from pointer without a cast
gdth.c: In function `gdth_copy_command':
gdth.c:1792: warning: passing arg 1 of `memcpy_toio' makes integer from pointer without a cast
gdth.c:1799: warning: passing arg 1 of `memcpy_toio' makes integer from pointer without a cast
gdth.c:1806: warning: passing arg 1 of `memcpy_toio' makes integer from pointer without a cast
gdth.c:1813: warning: passing arg 1 of `memcpy_toio' makes integer from pointer without a cast
gdth.c: In function `gdth_detect':
gdth.c:4066: error: `DMA_MODE_CASCADE' undeclared (first use in this function)
gdth.c:4066: error: (Each undeclared identifier is reported only once
gdth.c:4066: error: for each function it appears in.)
make[4]: *** [gdth.o] Error 1
make[4]: Leaving directory `/usr/src/kernel-source-2.4.25/drivers/scsi'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory `/usr/src/kernel-source-2.4.25/drivers/scsi'
make[2]: *** [_subdir_scsi] Error 2
make[2]: Leaving directory `/usr/src/kernel-source-2.4.25/drivers'
make[1]: *** [_dir_drivers] Error 2
make[1]: Leaving directory `/usr/src/kernel-source-2.4.25'
make: *** [stamp-build] Error 2
