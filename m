Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA24597
	for <parisc-linux@puffin.external.hp.com>; Sat, 21 Oct 2000 17:14:54 -0600
Date: Sat, 21 Oct 2000 16:16:12 -0700
From: Randolph Chung <randolph@tausq.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: parisc asm questions
Message-ID: <20001021161612.A29036@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200010212232.QAA05513@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200010212232.QAA05513@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Sat, Oct 21, 2000 at 04:32:06PM -0600
List-ID: <linux-parisc.vger.kernel.org>

> The add instruction doesn't use the carry bit as input, but it does
> produce a carry bit.  The addc instruction both uses and produces a carry
[...]

Thanks for the explanation. With some help from Grant on IRC I managed
to figure this out as well.

Another question though -- it looks like I cannot use r4 as a scratch
register as it messes with the stack. From looking at the documentation
(linux/Documentation/parisc/registers) it just says that the GRs are
used "as specified by ABI". Is this ABI documented some place? I did
look at the PDC documentation which lists some of the registers, but I
don't see anything about GR4.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
