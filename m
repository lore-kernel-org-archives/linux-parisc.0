Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA07386
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 14:22:50 -0600
Message-Id: <200010112021.QAA27610@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] __hp9000s700 predefined
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 11 Oct 2000 16:21:22 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200010112021.NAA07074@milano.cup.hp.com> from "Grant Grundler" at Oct 11, 2000 01:21:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > There appears to be some model dependence
> > in the floating point implementations from one pa machine to another.  If
> > this can't all be hidden in the kernel, some further specification of the
> > hardware might be needed for floating point.  For example, __i686__ is
> > defined on the Pentium Pro and is used in bits/mathinline.h.
> 
> HPUX hides it all in the kernel somehow...and __hp9000s[7-8]00 won't
> help with this problem anyway.

Agreed.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
