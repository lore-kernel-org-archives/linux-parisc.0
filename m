Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B147482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 12:00:19 -0600 (MDT)
Date: Sat, 20 Oct 2001 14:01:53 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Alan Modra <amodra@bigpond.net.au>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011020140153.A17475@megatonmonkey.net>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011020170907.G1037@bubble.sa.bigpond.net.au>; from amodra@bigpond.net.au on Sat, Oct 20, 2001 at 05:09:07PM +0930
List-ID: <linux-parisc.vger.kernel.org>

> Newer binutils don't initialise .got entries for global syms, so the
> scheme used by sysdeps/hppa/dl-machine.h:elf_machine_dynamic to find
> the address of .dynamic no longer works.
> 
> ChangeLog
> 	* sysdeps/hppa/dl-machine.h (elf_machine_dynamic):  Make it a
> 	const function.  Do not use &_DYNAMIC as .got entries for global
> 	syms are no longer initialised.  Instead they rely on the reloc,
> 	which hasn't yet been applied.
> 	(elf_machine_load_address): Make it const.  Call
> 	elf_machine_dynamic as that function is called fropm rtld anyway.
>

I was beggining to wonder...

  /* Figure out the run-time load address of the dynamic linker itself.  */
  bootstrap_map.l_addr = elf_machine_load_address ();

  /* Read our own dynamic section and fill in the info array.  */
  bootstrap_map.l_ld = (void *) bootstrap_map.l_addr + elf_machine_dynamic ();
  elf_get_dynamic_info (&bootstrap_map);

_dl_start (0x41002b74).... 
_dl_start+312 (Assertion failure with wrong address for initialized data) 

Why aren't .got entries being initialised?

So you are saying we need to make all of our global symbols constant
so that we can access them during the bootstrap? (No more _DYNMAIC?)

And that elf_machine_load_address is trying to access symbols that aren't
setup yet, because ELF_DYNAMIC_RELOCATE() hasn't been run yet?
And thus hasn't setup any of our offsets... where has my pic code gone ;(

c.
