Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id E29BB4844
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Sep 2003 10:20:00 -0600 (MDT)
Date: Wed, 17 Sep 2003 12:18:01 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Message-ID: <20030917161800.GB30176@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 64-bit kernel builds with gcc-3.4 experimental cross.
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

jda,

Any thoughts? This ld was from a multi-arch binutils that had
enable-targets with hppa64-linux.

---
hppa64-linux-ld  -r -o kernel.o sched.o dma.o fork.o exec_domain.o
panic.o printk.o module.o exit.o itimer.o info.o time.o softirq.o
resource.o sysctl.o acct.o capability.o ptrace.o timer.o user.o signal.o
sys.o kmod.o context.o
hppa64-linux-ld: Relocatable linking with relocations from format
elf32-hppa-linux (sched.o) to format elf32-hppa-linux (kernel.o) is not
supported
make[2]: *** [kernel.o] Error 1
make[2]: Leaving directory `/mnt/flaire/src/linux-2.4/kernel'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/mnt/flaire/src/linux-2.4/kernel'
make: *** [_dir_kernel] Error 2
carlos@firin:/mnt/flaire/src/linux-2.4$
---
GNU ld version 2.14.90 20030917

Reading specs from
/mnt/flaire/hppa-toolchain/install/lib/gcc/hppa64-linux/3.4/specs
Configured with: '../gcc-cvs/configure' '--host=hppa-linux
'--prefix=/mnt/flaire/hppa-toolchain/install '--target=hppa64-linux
'--build=hppa-linux
'--with-gnu-ld=/mnt/flaire/hppa-toolchain/install/bin/ld
'--with-gnu-as=/mnt/flaire/hppa-toolchain/install/bin/as
'--enable-languages=c
Thread model: posix
gcc version 3.4 20030916 (experimental)

c.
