Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pokey.513erich.iwaynet.net (d85.as1.clmb.oh.voyager.net [216.127.12.85])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62B9A4A19
	for <parisc-linux@parisc-linux.org>; Sat,  3 Feb 2001 18:46:03 -0700 (MST)
Date: Sat, 3 Feb 2001 20:50:25 -0500 (EST)
From: herrold <herrold@owlriver.com>
Sender: <herrold@513erich.iwaynet.net>
To: <penfold@customware.com.au>
Cc: Matthew Wilcox <matthew@wil.cx>, <parisc-linux@parisc-linux.org>,
	Jim Wildman <jim@rossberry.com>
Subject: Re: [parisc-linux] Source of this version of rbootd-2.0-2
In-Reply-To: <200102040130.MAA30086@customware.com.au>
Message-ID: <Pine.LNX.4.30.0102032042200.9141-100000@pokey.513erich.iwaynet.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 4 Feb 2001 penfold@customware.com.au wrote:

> just quick check to make sure I didnt have something which I had manually
> done, it seems the .rpm itself differs.

<snip>

> I also chaeck a RH 6.2 /libpcap-0.4-19.alpha and it is the same as my 6.1.
>
> standards are great... there are so many to choose from!

... Jeff Johnson at Red Hat is the current maintainer of tpcdump,
which emits libpcap ... He is pretty conscientious, but constrained
by the need to make sure certain version usability goals are met
there to support their paying customers;  Dug Song of the OpenBSD
side has also made disparaging remarks on some former releases of
tcpdump et al by Red Hat.

Try grabbing the tcpdump _SRPM_ from the RH Rawhide (their current
devel build tree), for a later version (All SRPMS contain pristine
tarballs ...), and pull the tarball, and build from that.

I was working with the rbootd sources in the OpenBSD tree yesterday,
as well;  Has the OpenBSD PARISC port -- seemingly inactive for over
a year -- anything to offer this Linux effort?

-- Russ Herrold

(PS: JAW - you'll soon know why ...)
