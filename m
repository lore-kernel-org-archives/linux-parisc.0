Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA27620
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 09:21:12 -0700
Message-Id: <200011151623.LAA21991@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Semi OT] SOM Linker
To: dhazeghi@pacbell.net
Date: Wed, 15 Nov 2000 11:23:05 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3A121DDD.992ECBC8@pacbell.net> from "dhazeghi@pacbell.net" at Nov 14, 2000 09:23:41 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> This is not precisely what I mean. What I should have said is that I want to create
> a cross compiler --host=i686-linux --target=hppa-hpux. I asked this list, because
> you folks did some work on the SOM linker, which is at the moment the missing piece
> for a cross toolchain which targets hpux.

This also may be possible.  The first step would be to copy the hpux headers
to a i686-linux system and see if you can build the HP linker.  The next
step would be to try to build the cross binutils tools.  I know this
requires the hpux headers and likely some hacking would be required to
get it to build.

The linker is probably the hard part.  There may be byte ordering issues
and bugs in what HP contributed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
