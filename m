Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA09253
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Sep 2000 08:45:52 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Sep 2000 14:46:33 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id BAA30589;
	Wed, 27 Sep 2000 01:45:51 +1100
Date: Wed, 27 Sep 2000 01:45:51 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: Lazy linking issues
In-Reply-To: <87em27kz4y.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0009270130040.10967-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 26 Sep 2000, David Huggins-Daines wrote:

> Okay.  I suppose I will take the same approach as the Alpha code does,
> and look for a particular instruction at the end of the GOT in
> elf_machine_runtime_setup() as an indication of whether lazy linking
> can be done or not.

Yep.  I'll check in my mods to dl-machine.h in a few minutes after I fix
this silly plt stub.

The plt stub looks like

1:	ldw	0(%r20),%r22
	bv	%r0(%r22)
	ldw	4(%r20),%r21
2:	b,l	1b,%r20
	depi	0,31,2,%r20
9:	.word 0xc0ffee
	.word 0xdeadbeef

with entry at label 2.  The idea here being that the linker can change the
plt stub without magic numbers in the dynamic linker needing to be
changed.  So we jump into the trampoline with r19 = reloc offset,
r20 = got-8, r21 = fixup ltp.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
