From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] parisc: Switch to generic COMPAT_BINFMT_ELF
Date: Fri, 13 Apr 2018 13:12:15 -0700
Message-ID: <20180413201215.GA16813@roeck-us.net>
References: <20180413182904.GA1722@roeck-us.net>
 <20180413195437.GA13605@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180413195437.GA13605@p100.box>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 13, 2018 at 09:54:37PM +0200, Helge Deller wrote:
> * Guenter Roeck <linux@roeck-us.net>:
> > On Wed, Apr 11, 2018 at 09:09:53AM +0200, Helge Deller wrote:
> > > Drop our own compat binfmt implementation in
> > > arch/parisc/kernel/binfmt_elf32.c in favour of the generic
> > > implementation with CONFIG_COMPAT_BINFMT_ELF.
> > > 
> > > While cleaning up the dependencies, I noticed that ELF_PLATFORM was strangely
> > > defined: On a 32-bit kernel, it was defined to "PARISC", while when running in
> > > compat mode on a 64-bit kernel it was defined to "PARISC32". Since it doesn't
> > > seem to be used in glibc yet, it's now defined in both cases to "PARISC". In
> > > any case, it can be distinguished because it's either a 32-bit or a 64-bit ELF
> > > file.
> > > 
> > > Signed-off-by: Helge Deller <deller@gmx.de>
> > 
> > This patch results in:
> > 
> > Building parisc:a500_defconfig ... failed
> > --------------
> > Error log:
> > make[2]: *** No rule to make target 'arch/parisc/kernel/binfmt_elf32.o', needed
> > by 'arch/parisc/kernel/built-in.a'.  Stop.
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [arch/parisc/kernel] Error 2
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [sub-make] Error 2
> > --------------
> > Building parisc:generic-64bit_defconfig ... failed
> > --------------
> > Error log:
> > make[2]: *** No rule to make target 'arch/parisc/kernel/binfmt_elf32.o', needed
> > by 'arch/parisc/kernel/built-in.a'.  Stop.
> > 
> > Indeed, arch/parisc/kernel/binfmt_elf32.o is still listed in Makefile
> > for 64-bit builds.
> > 
> > $ git grep binfmt_elf32.o arch/parisc/
> > arch/parisc/kernel/Makefile:obj-$(CONFIG_64BIT) += binfmt_elf32.o sys_parisc32.o signal32.o
> 
> You are right.
> I got fooled because I still had the binfmt_elf32.o object in my build
> directory and so I didn't faced this build error. And even 0-day builds
> didn't complained...  
> 
> Thanks for testing!
> 
> Patch below fixes it.
> 
> Helge
> ---
> 
> [PATCH] parisc: Fix missing binfmt_elf32.o build error
> 
> Commit 71d577db01a5 ("parisc: Switch to generic COMPAT_BINFMT_ELF")
> removed the binfmt_elf32.c source file, but missed to drop the object
> file from list of object files the Makefile too, which then results in a
> build error.
> 
> Fixes: 71d577db01a5 ("parisc: Switch to generic COMPAT_BINFMT_ELF")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Helge Deller <deller@gmx.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> 
> 
> diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
> index eafd06a..e5de34d 100644
> --- a/arch/parisc/kernel/Makefile
> +++ b/arch/parisc/kernel/Makefile
> @@ -23,7 +23,7 @@ obj-$(CONFIG_SMP)	+= smp.o
>  obj-$(CONFIG_PA11)	+= pci-dma.o
>  obj-$(CONFIG_PCI)	+= pci.o
>  obj-$(CONFIG_MODULES)	+= module.o
> -obj-$(CONFIG_64BIT)	+= binfmt_elf32.o sys_parisc32.o signal32.o
> +obj-$(CONFIG_64BIT)	+= sys_parisc32.o signal32.o
>  obj-$(CONFIG_STACKTRACE)+= stacktrace.o
>  obj-$(CONFIG_AUDIT)	+= audit.o
>  obj64-$(CONFIG_AUDIT)	+= compat_audit.o
