Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDDB4482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 15:52:01 -0600 (MDT)
Message-Id: <200105042151.RAA19009@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
To: matthew@wil.cx (Matthew Wilcox)
Date: Fri, 4 May 2001 17:51:59 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: matthew@wil.cx, parisc-linux@parisc-linux.org
In-Reply-To: <20010504223825.J32445@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at May 4, 2001 10:38:25 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Fri, May 04, 2001 at 05:31:30PM -0400, John David Anglin wrote:
> > Doesn't look like _setjmp comes back at all.  Put a break on ea18
> > and start stepping.  It might help to do a static link.
> 
> this code is in the dynamic linker :-))

Can you set a break on main, run to main, set the break in the
dynamic linker, then continue?

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
