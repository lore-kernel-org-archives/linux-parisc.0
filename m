Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2229C482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 13:04:19 -0600 (MDT)
Message-Id: <200104231904.PAA20313@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc -print-file-name=cpp
To: matthew@wil.cx (Matthew Wilcox)
Date: Mon, 23 Apr 2001 15:04:10 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20010423195239.D18464@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Apr 23, 2001 07:52:39 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Our gcc prints `cpp' when invoked as gcc -print-file-name=cpp.  Every
> other gcc in the world seems to output something along the lines of
> /usr/lib/gcc-lib/i386-linux/2.95.2/cpp.  This includes other gcc 3.0
> and 3.1 versions.  Would someone care to track this down?  This bug
> currently requires a patch to glibc in order to get glibc to build,
> and Ulrich rightly refuses to apply this patch to glibc CVS.

Is there a library file with the name `cpp' on your system?  In gcc 3.0,
the preprocessor is builtin, although there is a standalone processor
cpp0.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
