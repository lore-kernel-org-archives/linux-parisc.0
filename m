Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D2AF482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 14:23:04 -0600 (MDT)
Message-Id: <200104232022.QAA22918@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc -print-file-name=cpp
To: matthew@wil.cx (Matthew Wilcox)
Date: Mon, 23 Apr 2001 16:22:46 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: matthew@wil.cx, parisc-linux@parisc-linux.org
In-Reply-To: <20010423210120.F18464@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Apr 23, 2001 09:01:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Mon, Apr 23, 2001 at 03:04:10PM -0400, John David Anglin wrote:
> > Is there a library file with the name `cpp' on your system?
> 
> There's /lib/cpp and /usr/bin/cpp which are both symlinks to
> /usr/bin/cpp-3.0.  There's also /usr/lib/gcc-lib/hppa-linux/3.0/tradcpp0
> and /usr/lib/gcc-lib/hppa-linux/3.0/cpp0, neither of which are links
> to anything.

Try `gcc -print-search-dirs' and see if for some strange reason /lib isn't
in the library search path.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
