Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA01710
	for <parisc-linux@puffin.external.hp.com>; Sun, 11 Jun 2000 21:28:17 -0600
Message-Id: <200006120327.XAA08654@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] hpux11 build problems.
To: steve@silug.org (Steven Pritchard)
Date: Sun, 11 Jun 2000 23:27:07 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, JSO@EUROPAY.COM, parisc-linux@thepuffingroup.com
In-Reply-To: <200006110329.WAA05054@osiris.silug.org> from "Steven Pritchard" at Jun 10, 2000 10:29:35 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I guess I really need to get the CVS gcc packaged up for everyone...
> Is it in a reasonably stable state at the moment?

There have been a lot of changes over the recent months.  Although I sense
that there is now a move to get it back to a stable state, it certainly
hasn't reached a stable state.  The new version also still has to go
through a shake out period before the next release.  The C compiler
is in better shape than C++.

The mainline CVS version is the only one that supports hpux 11.  However,
for a cross to build the linux kernel, it probably would be better to use
the release version 2.95.2 or the 2.95 CVS branch.  These are much more
reliable in my opinion.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
