Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA11930
	for <parisc-linux@puffin.external.hp.com>; Mon, 17 Jan 2000 09:56:56 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id KAA03194
	for parisc-linux@thepuffingroup.com; Mon, 17 Jan 2000 10:57:34 -0500
Date: Mon, 17 Jan 2000 10:57:34 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000117105734.L11300@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PDC calls on the C3000
List-ID: <linux-parisc.vger.kernel.org>


I've been asked to explain what was going wrong with the PDC calls on
the C3000.  Here's what was going on:

        ldil            L%real_stack, 29        ; our stack pointer
        ldo             R%real_stack(29),29
        tophys          29

tophys is a macro which was doing:

	depi 0,1,2,gr

So the CPU was helpfully sign-extending the address of real_stack and
before the tophys macro was called we had the value
	0xffff'ffff'c0xx'xxxx
in r29.  The tophys macro was clearing the `c' to leave us with
	0xffff'ffff'00xx'xxxx
which would work if PDC recognised we were being called from narrow mode
(presumably PDC does on C360 hardware, or we wouldn't've had it working
on that machine).

I changed the tophys macro to:

	zdep gr, 31, 30, gr

which takes the rightmost 30 bits from the register, zeroes the whole
register and then stores them back into it:
	0xffff'ffff'c0xx'xxxx
becomes
	0x0000'0000'00xx'xxxx
and now PDC is happy, and so am I.
