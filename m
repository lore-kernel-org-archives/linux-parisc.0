Return-Path: <esproul@ntelos.net>
Received: from mailrtr02.ntelos.net (mailrtr02.ntelos.net [216.12.0.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22652483C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 14:21:17 -0700 (MST)
Received: from thunderbolt.oss.ntelos.net (thunderbolt.oss.ntelos.net
	[216.12.8.195])
	by mailrtr02.ntelos.net (8.11.7/8.11.7) with ESMTP id i2OLLGP19618
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 16:21:16 -0500
Subject: Re: [parisc-linux] gdth driver on L2000
From: Eric Sproul <esproul@ntelos.net>
To: PA-RISC Linux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <1080158208.23069.6.camel@thunderbolt.oss.ntelos.net>
References: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
	<20040324173117.GA32052@colo.lackof.org>
	<1080158208.23069.6.camel@thunderbolt.oss.ntelos.net>
Content-Type: text/plain
Message-Id: <1080163275.23069.42.camel@thunderbolt.oss.ntelos.net>
Mime-Version: 1.0
Date: Wed, 24 Mar 2004 16:21:16 -0500
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 2004-03-24 at 14:56, Eric Sproul wrote:
> All,
> Does anyone else who is running Debian have a working config I could use
> to start from?  I've started with the stock Debian config (with changes
> applied from the parisc Kconfig) but I'm having ugly build problems and
> I know I've probably screwed up somewhere.

Bad form replying to my own post, but I continue to have this problem
and could use some extra eyes/brain cells.  ;)

I put together what I thought was a sensible config for my L2000. 
However, I get a funky error where it claims the UTS Release is
mismatched, but the stated values are identical.  That may or may not be
connected to the make error where cpu_present_map appears undefined but
does appear in include/asm-parisc/smp.h.  Maybe even though CONFIG_SMP=Y
it is not including smp.h?

Could someone point me in the right direction to correct this error?

Thanks,
Eric

I am appending an extraversion of "-64-smp" because I am specifying the
following config options:

CONFIG_PA8X00=y
CONFIG_PA20=y
CONFIG_PARISC64=y
CONFIG_64BIT=y
CONFIG_SMP=y

(configure step completes normally, then...)

/usr/bin/make EXTRAVERSION=-64-smp   \
                                ARCH=parisc prepare
make[1]: Entering directory `/usr/src/kernel-source-2.6.4'
  HOSTCC  scripts/split-include
  HOSTCC  scripts/conmakehash
  HOSTCC  scripts/docproc
  HOSTCC  scripts/kallsyms
  CC      scripts/empty.o
  HOSTCC  scripts/mk_elfconfig
  MKELF   scripts/elfconfig.h
  HOSTCC  scripts/file2alias.o
  HOSTCC  scripts/modpost.o
  HOSTCC  scripts/sumversion.o
  HOSTLD  scripts/modpost
  HOSTCC  scripts/pnmtologo
  HOSTCC  scripts/bin2c
  SYMLINK include/asm -> include/asm-parisc
  CHK     include/linux/version.h
  UPD     include/linux/version.h
  SPLIT   include/linux/autoconf.h -> include/config/*
  CC      arch/parisc/kernel/asm-offsets.s
  CHK     include/asm-parisc/offsets.h
  UPD     include/asm-parisc/offsets.h
make[1]: Leaving directory `/usr/src/kernel-source-2.6.4'
echo done >  stamp-kernel-configure
echo done >  stamp-configure
The UTS Release version in include/linux/version.h
     "2.6.4-64-smp"
does not match current version
     "2.6.4-64-smp"
Reconfiguring.
touch Makefile
test -f stamp-configure || /usr/bin/make -f
/usr/share/kernel-package/rules configure
/usr/bin/make  EXTRAVERSION=-64-smp  ARCH=parisc \
                     vmlinux
make[1]: Entering directory `/usr/src/kernel-source-2.6.4'
  CHK     include/linux/version.h
make[2]: `arch/parisc/kernel/asm-offsets.s' is up to date.
  CC      init/main.o
In file included from init/main.c:35:
include/linux/kernel_stat.h: In function `kstat_irqs':
include/linux/kernel_stat.h:47: error: `cpu_present_map' undeclared
(first use in this function)
include/linux/kernel_stat.h:47: error: (Each undeclared identifier is
reported only once
include/linux/kernel_stat.h:47: error: for each function it appears in.)
init/main.c: In function `smp_init':
init/main.c:362: error: `cpu_present_map' undeclared (first use in this
function)
make[2]: *** [init/main.o] Error 1
make[1]: *** [init] Error 2
make[1]: Leaving directory `/usr/src/kernel-source-2.6.4'
make: *** [stamp-build] Error 2
