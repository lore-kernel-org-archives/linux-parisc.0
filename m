Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4DE9482B
	for <parisc-linux@parisc-linux.org>; Sat, 12 May 2001 19:23:55 -0600 (MDT)
Message-Id: <200105130123.VAA25847@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] broken toolchain?
To: matthew@wil.cx (Matthew Wilcox)
Date: Sat, 12 May 2001 21:23:47 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20010513021522.B28266@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at May 13, 2001 02:15:22 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> as some of you know, i'm busy up here in canada building packages.
> it seems to me that i'm getting a lot more unaligned data references from
> things that I build than I was last week.  Also I'm getting unaligned
> data references from glibc 2.2.3 that i'm building on gsyprf11 which i
> never had on jagu.  I did an apt-get update on gsyprf11 and I remember
> binutils getting updated, so I'm tempted to blame that.  can anyone else
> confirm/deny problems?

There still issues re the management of the PIC register.  These might
cause the unaligned data accesses that you are seeing.  I know the
mainline gcc was broken by a patch that Alan Modra added to add
dwarf2 profiling support.  On the branch, things are better but I just
discovered a new issue involving inline functions.  Don't know where
things stand with the parisc-linux gcc source.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
