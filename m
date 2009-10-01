From: Frans Pop <elendil@planet.nl>
Subject: vmlinux.lds:319: undefined symbol `THREAD_SIZE'
Date: Thu, 1 Oct 2009 03:39:51 +0200
Message-ID: <200910010339.52904.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

v2.6.32-rc1-134-g84d88d5 fails to compile on my hppa box:
[...]
  LD      vmlinux.o
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
arch/parisc/kernel/vmlinux.lds:319: undefined symbol `THREAD_SIZE' 
referenced in expression
make[5]: *** [.tmp_vmlinux1] Error 1

Failure above was with default config, but I've also seen it with my own 
config.

System is running Debian unstable.

Cheers,
FJP
