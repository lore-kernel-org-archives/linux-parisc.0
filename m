Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA02842
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 08:44:20 -0700
Date: Tue, 23 Nov 1999 16:47:23 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Cannot load IPL, error detected
Message-Id: <19991123164723.F1009@mathe.stud.uni-erlangen.de>
References: <199911230004.QAA03909@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911230004.QAA03909@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Can I assume bootp found the right entry since it knew the IP addresses?

It looks to me like it might be hardware/network and I've seen similar
things happening here (where I suspect the flakey component is the network
card in my bootp server).

> What's changed?
> I don't know if something my local copy of CVS is wrong or if something
> in the CVS tree changed.

I still doubt it, you should at least see the boot loader print some
messages.

Sure the bootp server is actually running ?

	Philipp Rumpf
