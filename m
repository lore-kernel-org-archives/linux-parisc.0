Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA20775
	for <parisc-linux@puffin.external.hp.com>; Sat, 5 Feb 2000 19:37:30 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (Postfix) with ESMTP id 6465A1261E
	for <parisc-linux@thepuffingroup.com>; Sat,  5 Feb 2000 20:35:09 -0500 (EST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id RAA09710 for <parisc-linux@thepuffingroup.com>; Sat, 5 Feb 2000 17:35:59 -0800 (PST)
Message-Id: <200002060135.RAA09710@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] State Of The Port 
In-reply-to: Your message of "Fri, 04 Feb 2000 23:17:33 PST."
             <Pine.BSF.4.10.10002042255350.8742-100000@cuzea.pair.com>
Date: Sat, 05 Feb 2000 17:35:55 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Michael Ang wrote:
> 
> Here are Grant's notes from today's meeting with a few annotations:

Mike,
thanks for touching up the notes...apologies to Thomas for mangling
his name. My error.

> 
> Interrupts on C3000
> Grant Still working on it.

I think it's working now. It still needs more work but folks could
start using it at least. I expect the code to work on j5k but
don't know if either processor has "0xfffa0000" HPA. If one does,
it should work too. All I/O interrupts will be directed to that
processor for now.

Feel free to remove the:
	do_irq_mask 00200000 c02d1324 c01f6500
	iosapic_interrupt: irq 266 line 1 eoi fed32840

messages if they get in your way.

I tested using eepro100.c driver (CONFIG_EEXPRESS_PRO100=y)
and added "#define USE_IO" near the top. I can't say the interface
is totally functional (I haven't the setup to test ping) but the hub
seems happy.


> Fleed is still having/had trouble with card-mode dino.
>     dino.c.ilr data page faulted. Grant will look at this
>     after spending some more time on C3k problems.

I'm going to look at this next before working more on iosapic.c.
Thomas is going to send me console output and I'll see what I
can make out of that.

> Short term goals (roughly in order)
> - serial console input and output
> - networking
> - nfs root filesystem
> - scsi support

More important than any of these, IMHO, is FDB. And I forgot to
mention it at the meeting. Future progress would be substantialy
faster if we had a debugger. I don't feel competent to work on
that. Anyone interested in (or already) pursuing this?

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
