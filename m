Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA11311
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 08:29:37 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 14:29:21 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA14054;
	Sat, 19 Aug 2000 00:29:01 +1000
Date: Sat, 19 Aug 2000 00:29:01 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <Pine.LNX.4.21.0008180950370.24871-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0008190020150.9244-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 18 Aug 2000, Alan Modra wrote:

> One way to keep out current ABI is to generate a .plt and import stubs
> when statically linking PIC code.  That should be relatively easy to do in
> the linker.

A bit of head-scratching, a couple of added functions, and the linker now
detects PIC functions and handles them appropriately.

bfd/ChangeLog
	* elf32-hppa.c (elf32_hppa_link_hash_entry): Add pic_call.
	(hppa_link_hash_newfunc): Init it.
	(elf32_hppa_link_hash_table): Add pic_call_detected.
	(elf32_hppa_link_hash_table_create): Init it.  multi_subspace too.
	(hppa_type_of_stub): Use an import stub if pic_call.
	(elf32_hppa_check_relocs): Set SEC_HAS_GOT_REF appropriately.
	Don't just create the .got on GOT references, create a .plt too.
	(hppa_handle_PIC_calls): New function.
	(elf32_hppa_size_dynamic_sections): Call it.
	(hppa_setup_plt_PIC_call): New function.
	(elf32_hppa_build_stubs): Call it.
	* section.c (SEC_HAS_GOT_REF): Define new flag for asection.
	* bfd_in2.: Regenerate.


The linker detects PIC functions by noting DLTIND relocations within a
section.  If there aren't any, it's either not PIC, or it's PIC that
doesn't use the .got  Without .got references, we won't need to set
up r19.  Ta DA!

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
