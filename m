Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA04524
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 16:53:00 -0700
Message-Id: <200011302348.SAA19055@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] HP 9000/735-125
To: adevries@linuxcare.com (Alex deVries)
Date: Thu, 30 Nov 2000 18:48:38 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@cup.hp.com, delyra@latt.if.usp.br,
        parisc-linux@thepuffingroup.com
In-Reply-To: <3A26E541.C6A24350@linuxcare.com> from "Alex deVries" at Nov 30, 2000 06:39:45 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > Ok. I'm not going to touch the archives.
> > I can update the link if someone provides the content.
> > Any volunteers to rewrite the NFS root howto and bring it up to date?
> 
> Yes!  I'm redoing the FAQ, and will make sure it all gets a review.

The configure and build for glibc needs updating.  The compiler to
use has to be set with the environment variable CC or by some other
means.  There are also some configure parameters like --PREFIX which
should be lower case.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
