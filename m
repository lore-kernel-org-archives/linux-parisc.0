Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13246
	for <parisc-linux@puffin.external.hp.com>; Mon, 17 Jan 2000 12:02:05 -0700
Message-Id: <200001171802.KAA18011@milano.cup.hp.com>
To: Matthew Wilcox <willy@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PDC calls on the C3000 
In-reply-to: Your message of "Mon, 17 Jan 2000 10:57:34 PST."
             <20000117105734.L11300@thepuffingroup.com>
Date: Mon, 17 Jan 2000 10:02:59 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Matthew,
The hair on the back of my neck stood up when I read the second part...

Matthew Wilcox wrote:
...
> So the CPU was helpfully sign-extending the address of real_stack
...
> The tophys macro was clearing the `c' to leave us with
...
> which would work if PDC recognised we were being called from narrow mode
> (presumably PDC does on C360 hardware, or we wouldn't've had it working
> on that machine).

I'm thinking the inconsistency is possibly a firmware "bug" where either
the C360 or C3000 isn't behaving "right". Can anyone comment on what
the expected behavior is?


> I changed the tophys macro to:
> 
> 	zdep gr, 31, 30, gr
> 
> which takes the rightmost 30 bits from the register, zeroes the whole
> register and then stores them back into it:
> 	0xffff'ffff'c0xx'xxxx
> becomes
> 	0x0000'0000'00xx'xxxx
> and now PDC is happy, and so am I.

This is where the hair on the back of my neck went up.
The problem is on L-class and N-class machine we have
I/O and memory addresses which are > 4GB. And PDC will really
be confused on those platforms.

I wonder if the right answer is for the ldil instruction to NOT sign extend.
I don't know how to acheive that and I don't see us getting to L-class
without addressing that issue. I'm also hoping fixing this behavior will
make the firmware behavior differences (c360 vs C3000) irrelevant.

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
