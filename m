From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] parisc: Switch to generic COMPAT_BINFMT_ELF
Date: Fri, 13 Apr 2018 11:29:04 -0700
Message-ID: <20180413182904.GA1722@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 11, 2018 at 09:09:53AM +0200, Helge Deller wrote:
> Drop our own compat binfmt implementation in
> arch/parisc/kernel/binfmt_elf32.c in favour of the generic
> implementation with CONFIG_COMPAT_BINFMT_ELF.
> 
> While cleaning up the dependencies, I noticed that ELF_PLATFORM was strangely
> defined: On a 32-bit kernel, it was defined to "PARISC", while when running in
> compat mode on a 64-bit kernel it was defined to "PARISC32". Since it doesn't
> seem to be used in glibc yet, it's now defined in both cases to "PARISC". In
> any case, it can be distinguished because it's either a 32-bit or a 64-bit ELF
> file.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

This patch results in:

Building parisc:a500_defconfig ... failed
--------------
Error log:
make[2]: *** No rule to make target 'arch/parisc/kernel/binfmt_elf32.o', needed
by 'arch/parisc/kernel/built-in.a'.  Stop.
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [arch/parisc/kernel] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [sub-make] Error 2
--------------
Building parisc:generic-64bit_defconfig ... failed
--------------
Error log:
make[2]: *** No rule to make target 'arch/parisc/kernel/binfmt_elf32.o', needed
by 'arch/parisc/kernel/built-in.a'.  Stop.

Indeed, arch/parisc/kernel/binfmt_elf32.o is still listed in Makefile
for 64-bit builds.

$ git grep binfmt_elf32.o arch/parisc/
arch/parisc/kernel/Makefile:obj-$(CONFIG_64BIT) += binfmt_elf32.o sys_parisc32.o signal32.o

Guenter
