Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA03472
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Sep 2000 02:08:11 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Sep 2000 08:08:46 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA23051;
	Tue, 26 Sep 2000 19:08:20 +1100
Date: Tue, 26 Sep 2000 19:08:20 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: Lazy linking issues
In-Reply-To: <Pine.LNX.4.21.0009261356570.10967-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0009261648260.10967-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

OK, here's what I've come up with.

First four entries of the .got are
 0x0 - pointer to dynamic section (as before)
 0x4 - pointer to this object's struct link_map (as before)
 0x8 - address of the fixup function (normal or profile)
 0xc - the LTP value for the fixup function

Code at the start of the .plt looks like:
	b,l	1f,%r26
	depi	0,31,2,%r26
1:	addil	LD'_GLOBAL_OFFSET_TABLE_ + 8 - ($PIC_pcrel$0 - 8),%r26
	ldwm	RD'_GLOBAL_OFFSET_TABLE_ + 8 - ($PIC_pcrel$0 - 12)(%r1),%r26
	copy	%r19,%r25
	ldw	4(%r1),%r19
	bv	%r0(%r26)
	ldw	-4(%r1),%r26

which puts struct link_map * in %r26, reloc offset in %r25, fixup LTP in
%r19, &got[2] in %r1, and branches to the address in got[2].  Funny
enough, this code exposed the fact that gas currently doesn't handle
relocs using the LD and RD field selectors.

A non-pic version saving 2 instructions, but meaning the dynamic linker
needs to relocate some insns:
	ldil	LD'_GLOBAL_OFFSET_TABLE_ + 8,%r1
	ldwm	RD'_GLOBAL_OFFSET_TABLE_ + 8(%r1),%r26
	copy	%r19,%r25
	ldw	4(%r1),%r19
	bv	%r0(%r26)
	ldw	-4(%r1),%r26

We still need some means for elf_machine_runtime_setup to figure out
where the .got starts.  One way is to make PLTGOT do this for us, which is
my preferred solution.  Alternatives would be a) read the elf section
headers, or b) look at the first iplt reloc to find an entry in the .plt,
read the function pointer which give us the above code, extract the .got
pointer from the addil/ldil and ldwm insns.  Was that retching I heard?

Hmm, one variation on this theme that occurs to me, is to put the above
code at the _end_ of the plt - the advantage is that the .got is right
next-door, so we don't need the addil, and case b) above becomes a little
simpler.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
