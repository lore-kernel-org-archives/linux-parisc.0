From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] A sti 2.6.16-rc5-pa2 build failure?
Date: Mon, 20 Mar 2006 20:42:40 +0100
Message-ID: <200603202042.40760.deller@gmx.de>
References: <IWFBHA$6574DD99581BECB275DA2287BF1C9843@scarlet.be>
	<200603201947.08045.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200603201947.08045.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Joel,

it builds for me...

Helge

On Monday 20 March 2006 19:47, Helge Deller wrote:
> Hi Joel,
> 
> did you tried a "make distclean", and "make oldconfig" ?
> And, are all your files up-to-date (cvs -z3 -q up) ?
> I'm wondering, since this header file does not do any IO...
> 
> Helge
> 
> On Monday 20 March 2006 12:19, Joel Soete wrote:
> > Hello Helge,
> > 
> > > 
> > > Just a short report build failure of my custom kernel for my d380 (32bit up):
> > >    ld   -o .tmp_vmlinux1 -T arch/parisc/kernel/vmlinux.lds
> > > arch/parisc/kernel/head.o   init/built-in.o --start-group  usr/built-in.o 
> > > arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o 
> > > arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o 
> > > kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o 
> > > security/built-in.o  crypto/built-in.o  block/built-in.o  lib/lib.a 
> > > arch/parisc/lib/lib.a `gcc -print-libgcc-file-name`  lib/built-in.o 
> > > arch/parisc/lib/built-in.o `gcc -print-libgcc-file-name`  drivers/built-in.o 
> > > sound/built-in.o  net/built-in.o --end-group 
> > > drivers/built-in.o: In function `sti_rom_copy': undefined reference to
> > `gsc_readl'
> > > drivers/built-in.o: In function `sti_rom_copy': undefined reference to
> > `gsc_readl'
> > > drivers/built-in.o: In function `sti_rom_copy': undefined reference to
> > `gsc_readb'
> > > drivers/built-in.o: In function `sti_bmode_rom_copy': undefined reference to
> > > `gsc_readl'
> > > drivers/built-in.o: In function `sti_get_wmode_rom': undefined reference to
> > > `gsc_readl'
> > > drivers/built-in.o: In function `sti_try_rom_generic': undefined reference to
> > > `gsc_readl'
> > > drivers/built-in.o: In function `sti_try_rom_generic': undefined reference to
> > > `gsc_readl'
> > > drivers/built-in.o: In function `sti_try_rom_generic': undefined reference to
> > > `gsc_readl'
> > > drivers/built-in.o: more undefined references to `gsc_readl' follow
> > > drivers/built-in.o: In function `sti_try_rom_generic': undefined reference to
> > > `ioremap'
> > > drivers/built-in.o: In function `sti_try_rom_generic': undefined reference to
> > > `ioremap_nocache'
> > > make[1]: *** [.tmp_vmlinux1] Error 1
> > > make: *** [vmlinux] Error 2
> > > 
> > it seems that this reverting hunk:
> > --- drivers/video/sticore.h.Orig        2006-03-20 11:50:46.000000000 +0100
> > +++ drivers/video/sticore.h     2006-03-20 11:51:47.000000000 +0100
> > @@ -36,7 +36,7 @@
> >   
> >  #define STI_WAIT 1
> >  
> > -#include <linux/config.h> /* for CONFIG_HPPA_IOREMAP */
> > +#include <asm/io.h> /* for CONFIG_HPPA_IOREMAP */
> >  
> >  #ifdef CONFIG_HPPA_IOREMAP
> >  
> > ====<>====
> > 
> > help (at least to rebuild this kernel).
> > 
> > If you agre, could you check in (I don't have cvs access)?
> > 
> > TIA,
> >     Joel
> > 
> > ---------------------------------------------------------------
> > A free anti-spam and anti-virus filter on all Scarlet mailboxes
> > More info on http://www.scarlet.be/
> > 
> > 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
