Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7585A482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 14:48:00 -0600 (MDT)
Message-Id: <200104232047.QAA23482@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc -print-file-name=cpp
To: matthew@wil.cx (Matthew Wilcox)
Date: Mon, 23 Apr 2001 16:47:56 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: matthew@wil.cx, parisc-linux@parisc-linux.org
In-Reply-To: <20010423213726.H18464@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Apr 23, 2001 09:37:26 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Mon, Apr 23, 2001 at 04:22:46PM -0400, John David Anglin wrote:
> > Try `gcc -print-search-dirs' and see if for some strange reason /lib isn't
> > in the library search path.
> 
> /lib is indeed in the library search path, although not the programs.

Looks like it's time to fire up the debugger.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
