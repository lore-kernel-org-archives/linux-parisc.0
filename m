Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65A04482D
	for <parisc-linux@parisc-linux.org>; Fri,  1 Aug 2003 11:09:41 -0600 (MDT)
Date: Fri, 1 Aug 2003 19:09:37 +0200
Message-ID: <3F29178A000004FF@ocpmta7.freegates.net>
In-Reply-To: <1059753543.2092.30.camel@mulgrave>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] backport bitops.h stuff
To: "James Bottomley" <James.Bottomley@steeleye.com>
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Actually, this patch looks decidedly non-optimal.

> See include/linux/bitops.h:generic_ffs for how it should be done on
> architectures that don't have any machine instruction help.  That's only
> four if statements and no loop.

Yes it was like this (just a lake of #include <linux/bitops.h>) into 2.4

Why was it is changed in 2.5?

> I see we already have the loop thing in 2.5, but should we consider
> simply using the generic operations there as well?

> even for __ffs, which is just a slight optimisation over ffs, using
> generic_ffs would probably be faster

If I have time next week I can test your idea.

Thanks,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
