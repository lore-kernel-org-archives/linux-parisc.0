Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA18294
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 23:30:30 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 19 Aug 2000 05:30:15 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA02218;
	Sat, 19 Aug 2000 15:29:56 +1000
Date: Sat, 19 Aug 2000 15:29:56 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <87vgwyz5r0.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0008191523470.28329-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 18 Aug 2000, David Huggins-Daines wrote:

> David Huggins-Daines <dhd@linuxcare.com> writes:
> 
> > Alan Modra <alan@linuxcare.com.au> writes:
> > > A bit of head-scratching, a couple of added functions, and the linker now
> > > detects PIC functions and handles them appropriately.
> > 
> > Sorry to burst your bubble but this doesn't work in the real world,
> > where "real world" is defined as 'hppa-linux-gcc -o hello hello.c'

In some ways not having any hardware to run hppa-linux binaries on is
good, as it gives me some excuse.  :-)

Let me know how this one goes.

bfd/ChangeLog
2000-08-19  Alan Modra  <alan@linuxcare.com.au>

	* elf32-hppa.c (hppa_setup_plt_PIC_call): Move function into..
	(hppa_build_one_stub): ..here.
	(elf32_hppa_build_stubs): Don't call it.
	(elf32_hppa_create_dynamic_sections): Don't try to create the .plt
	and .got twice.
	(elf32_hppa_adjust_dynamic_symbol): Handle pic_call here.  Don't
	make symbol dynamic, and don't emit a reloc if pic_call.
	(hppa_handle_PIC_calls): Simplify as we..
	(elf32_hppa_size_dynamic_sections): ..only call hppa_handle_PIC_calls
	when not shared.  Don't create DT_PLTREL etc. entries unless we
	have a .rela.plt section.
	(elf32_hppa_finish_dynamic_symbol): Set up .plt entries with final
	relocated values when it's for a pic_call function we include in
	the link.  Don't create relocs for pic_call either.

2000-08-18  David Huggins-Daines  <dhd@linuxcare.com>

	* elf32-hppa.c (final_link_relocate): Look for an import stub in
	the case of statically linked PIC symbols.

-- 
Linuxcare.  Support for the Revolution.
