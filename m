Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEB23602A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 13:09:02 -0700 (MST)
Message-Id: <200103162007.PAA18059@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: new debs built, c++ is broken
To: matthew@wil.cx (Matthew Wilcox)
Date: Fri, 16 Mar 2001 15:07:36 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan_meyer@hp.com, alan@linuxcare.com.au,
	taggart@carmen.fc.hp.com, randolph@tausq.org, bdale@gag.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010316195903.A21079@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Mar 16, 2001 07:59:03 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I was of the impression that we weren't allowed to put in any patches to
> the 3.0 branch that were not specifically aimed at getting 3.0 released
> on the target architectures (and hppa-linux is not one of these).
> 
> I'd love to see support for us in 3.0.

You might have to make a case but I note the following recent patch:

2001-03-15  Steve Ellcey  <sje@cup.hp.com>

        * config.gcc (ia64*-*-hpux*): New case.
	* config/ia64/hpux.h: New file for HP-UX support.
	* config/ia64/t-hpux: New file for HP-UX support.

The guidelines for 3.0 patches are here:
<http://gcc.gnu.org/ml/gcc/2001-02/msg00403.html>.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
