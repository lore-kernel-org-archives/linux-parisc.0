Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA13498
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 17:03:10 -0600
Date: Wed, 25 Aug 1999 01:04:46 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting 715/100
Message-ID: <19990825010446.H19314@suse.de>
References: <19990824234440.H31994@mencheca.ch.genedata.com> <199908242255.PAA09913@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199908242255.PAA09913@milano.cup.hp.com>; from Grant Grundler on Tue, Aug 24, 1999 at 03:55:40PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> > Sorry I can't be of any help on the actual problem though...
> 
> This already helped...I'll assume CONFIG_PA7100 means PA7100LC.
> 
> BTW, I went through the linux/.config file and found conflicting
> options enabled (eg. 712 was enabled). So, I'm rebuilding...and
> we'll see what happens.

Right now CONFIG_PA7100 and CONFIG_PA7300LC don't do anything, so you
don't need to be worried about that.
