Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA05295
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Feb 2000 12:34:53 -0700
Date: Fri, 11 Feb 2000 19:21:55 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: John Curry <jcurry@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Some PA-RISC 2.0 Gotchas
Message-ID: <20000211192155.A4843@abacus.local>
References: <00ec01bf74b2$f4c6c050$1c80100f@jc356611.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <00ec01bf74b2$f4c6c050$1c80100f@jc356611.cup.hp.com>; from jcurry@cup.hp.com on Fri, Feb 11, 2000 at 09:10:54AM -0800
List-ID: <linux-parisc.vger.kernel.org>

> But, in the free_area_struc type, the map variable is declared as an integer
> ptr. Depending on the size of
> the bitmap, this will cause the parisc_set_bit  to operate incorrectly. We
> solved this problem by making
> the map variable a unsigned long pointer.

it's very unlikely map isn't a multiple of 8 bytes, but I agree this type
should be changed.

> Hope these are of some use.

Thanks, I'm sure they will.

	Philipp
