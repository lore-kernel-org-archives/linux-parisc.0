Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA22018
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 19:01:39 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Aug 2000 01:01:35 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA13336;
	Sat, 26 Aug 2000 10:59:25 +1000
Date: Sat, 26 Aug 2000 10:59:25 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@noam.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 64-bit cross compiler broken 
In-Reply-To: <E13SSjR-00050l-00@noam.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0008261033140.12171-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 25 Aug 2000, Paul Bame wrote:

> = 
> = The current 64-bit cross compiler dies on drivers/block/rd.c
> = 
> 
> Another 64-bit gotcha: in arch/parisc64/kernel/entry.S:start_parisc_asm
> the 'b start_parisc' is branching through a stub and failing miserably.
> Linker problem?

Could be.  The 64-bit binutils port hasn't yet been modified to use
multiple stub sections.  That means a sufficiently large executable may
have branches that can't even reach the stubs, and I don't see any error
checking for this case.

Hmm, "sufficiently large" is 4*2**(22-1) for 22 bit branch offsets,
ie. 8M, so you're hardly likely to have hit that limit.  OK, can you tell
me the reloc type (from objdump -dr entry.o) for the branch?  Also, what
does the stub look like, and most importantly, what values does the stub
load out of the .plt.  I reckon you've probably got a bad .plt value as
the code in bfd/elf64-hppa.c:elf64_hppa_finish_dynamic_symbol for setting
the plt entry looks wrong to me.

Alan
-- 
Linuxcare.  Support for the Revolution.
