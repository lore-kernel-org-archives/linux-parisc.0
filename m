Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA11871
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 22:39:49 -0700
Date: Wed, 17 Nov 1999 05:54:31 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Ulrich Strelow <ulrich_strelow@YAHOO.COM>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] problems with HPMC code in interruption.S
Message-Id: <19991117055431.F750@mathe.stud.uni-erlangen.de>
References: <19991116104321.17833.rocketmail@web504.yahoomail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991116104321.17833.rocketmail@web504.yahoomail.com>
List-ID: <linux-parisc.vger.kernel.org>

> I have had the same problem yesterday (unresolved
> symbol os_hpmc). The simple solution is to include
> hpmc.o in arch/parisc/kernel/Makefile.

Not only is it simple, it's the right one, too.

> Although this works, I must admit that I don't
> understand the reason for this problem. I think that
> the reference in realmode_setup.c is commented out by
> if SETUP_HPMC which is set to 0...
> 
> Maybe someone else has an explantion for this.

It's referenced from interruption.S.

	Philipp Rumpf
