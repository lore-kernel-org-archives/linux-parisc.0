Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA15728
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Feb 2000 12:20:25 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 634F5BC
	for <parisc-linux@thepuffingroup.com>; Wed, 23 Feb 2000 10:21:10 -0800 (PST)
Message-Id: <200002231822.KAA15029@milano.cup.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Tulip Driver Bug 
In-reply-to: Your message of "Wed, 23 Feb 2000 09:25:55 PST."
             <200002231625.JAA27870@udlkern.fc.hp.com>
Date: Wed, 23 Feb 2000 10:22:27 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:

> My understanding is that this code tries to defer work until later because
> too many incoming packets have been handled during the current interrupt.
> The problem is that there is no later.

John,
thanks for bringing it this far.

Can someone verify the IRQ line is remains asserted?

If the IRQ line is asserted, this sounds like a problem in iosapic code.
I've seen this behavior before when iosapic_isr() didn't write the
correct value to the EOI register. I'll review the iosapic code.
But if someone could give me confidence the IRQ is asserted, I'd
appreciate it.

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
