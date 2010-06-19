From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [RFC] fix the relative jump problem on large modules
Date: Sat, 19 Jun 2010 17:57:46 -0500
Message-ID: <1276988266.4416.222.camel@mulgrave.site>
References: <1276873407.2850.35.camel@mulgrave.site> <4C1BD9B9.200@gmx.de>
	 <4C1D42D6.9050606@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4C1D42D6.9050606@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2010-06-20 at 00:21 +0200, Helge Deller wrote:
> On 06/18/2010 10:40 PM, Helge Deller wrote:
> > On 06/18/2010 05:03 PM, James Bottomley wrote:
> >> Part of this arguing with ksplice about their plan for
> >> -ffunction-sections and -fdata-sections got me thinking about how we do
> >> modules.  Right at the moment we have one section for every function in
> >> a module, which leads to a massive amount of relocation overhead in the
> >> in-kernel module loader.  Plus for some modules (ipv6, I believe), we
> >> lack the relative jumps to get out of the function because we only put
> >> the stubs after all the text sections.
> >>
> >> The way to fix all of this, I think, is to make the real linker do more
> >> work.  It should be beneficial to us because the linker *should* be able
> >> to rearrange the sections to get the maximum number of jumps satisfiable
> >> relatively.
> >>
> >> I've tested that this works on pa8800 systems, but I'd really like
> >> someone to try a failing module on a 32 bit platform (since 64 bits has
> >> 22 bit relative jumps, all the modules actually work).
> > 
> > Hi James,
> > 
> > I think there is no failing module on 32bit right now.
> > The biggest modules were ipv6.ko and xfs.ko, which do work now
> > since the latest module changes.
> > 
> > But if your patch saves relocations it's a win nevertheless.
> > I can't test your patch right now, but will try tomorrow evening....
> 
> Hi James,
> 
> I just tested your patch on a 32bit kernel.
> 
> The wins wrt module size is good:
> ipv6.ko:	415K -> 357K
> xfs.ko:		902K -> 747K

Actually, that's not really necessarily a win ... it's probably mostly
container code and relocations.

> (btw, what is the command you ran to count the sections and relocs?).

objdump (-r or --section-headers)

> But your patch doesn't work on 32bit.
> root@c3000:~# modprobe xfs
> FATAL: Error inserting xfs (/lib/modules/2.6.35-rc3-32bit+/kernel/fs/xfs/xfs.ko): Invalid module format
> 
> dmesg says:
> module xfs relocation of symbol memcpy is out of range (0x3ffeffaa in 17 bits)
> 
> That's exactly the problem, and this reminded me on what my latest patch to
> the linux kernel module loader on hppa did.
> 
> Just look at the weak function arch_mod_section_prepend() in arch/parisc/kernel/module.c,
> and at the top of that file:
> 
>  *    Notes:
>  *    - PLT stub handling
>  *      On 32bit (and sometimes 64bit) and with big kernel modules like xfs or
>  *      ipv6 the relocation types R_PARISC_PCREL17F and R_PARISC_PCREL22F may
>  *      fail to reach their PLT stub if we only create one big stub array for
>  *      all sections at the beginning of the core or init section.
>  *      Instead we now insert individual PLT stub entries directly in front of
>  *      of the code sections where the stubs are actually called.
>  *      This reduces the distance between the PCREL location and the stub entry
>  *      so that the relocations can be fulfilled.
>  *      While calculating the final layout of the kernel module in memory, the
>  *      kernel module loader calls arch_mod_section_prepend() to request the
>  *      to be reserved amount of memory in front of each individual section.
> 
> So, your patch merges all text sections, which then let the new kernel
> module loader fail on 32bit since it's only one big section with too long distances...

The theory was that the linker should do the right thing and not emit a
relocation that can't reach the boundary of the text segment (i.e. it
should embed a stub between the sections as it combines them).  I'll
have to fire up a 32 bit compile and see exactly what it thinks it's
doing ... I've got a nasty feeling it expects us to be able to stub
either at the beginning or the end, which the in-kernel loader doesn't.

Thanks for testing the preliminary patch, anyway.

James


