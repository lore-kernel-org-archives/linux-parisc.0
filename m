Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA29537
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 19:30:36 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 15 Jul 2000 01:32:11 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA24468;
	Sat, 15 Jul 2000 11:31:58 +1000
Date: Sat, 15 Jul 2000 11:31:58 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Jeffrey A Law <law@cygnus.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
In-Reply-To: <87aefkzgpo.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0007151118490.23959-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 14 Jul 2000, David Huggins-Daines wrote:

> Alan: any thoughts on this?

My first thoughts when I read Jeff's email about my proposed removal of
the gcc hack for the hpux linker were along the lines of "two wrongs don't
make a right, so it's not surprising that ld -r is tripped up".  That was
late last night just before I went to bed, and I'm glad I didn't reply
then, as Jeff is quite correct.  The way those LR and RR field selectors
work means that a reloc addend cannot be modified under any circumstances.
Even if the gcc hack was removed, the linker would still do the wrong
thing with certain cases of one instruction with LR selector combined with
multiple instructions using RR selectors.  Gross.

I'm not sure why the assembler is specifying the relocs against a sections
symbols - it's something I've noticed on x86 for a long time, and never
bothered to figure out why, as it didn't cause any problem.  I'll have a
look.

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
