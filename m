Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3893482A
	for <parisc-linux@parisc-linux.org>; Tue, 14 Aug 2001 18:57:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Wp0L-00023T-00; Wed, 15 Aug 2001 01:57:53 +0100
Date: Wed, 15 Aug 2001 01:57:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: Paul Bame <bame@riverrock.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Linux/HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Kernel 2.4.8
Message-ID: <20010815015753.L22144@parcelfarce.linux.theplanet.co.uk>
References: <20010811145450.O22097@neep.com.au> <20010814173801.D22144@parcelfarce.linux.theplanet.co.uk> <m15WkQY-000OUsC@bame.riverrock.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m15WkQY-000OUsC@bame.riverrock.org>; from bame@riverrock.org on Tue, Aug 14, 2001 at 02:04:38PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 14, 2001 at 02:04:38PM -0600, Paul Bame wrote:
> > I think we should plan to merge in 2.4.8 this week.  Paul, can you do the
> > CVS magic sometime soon?
> 
> Possibly tomorrow (Wed) AM

Sounds good to me -- there is one already applied patch (pci.txt), and
two failures -- Makefile (trivial) and include/linux/netdevice.h which
got fixed a different way upstream.

Other than that, there are no textual conflicts.  I guess we'll find out
tomorrow what architecture changes are needed (Alan tells me he suspects
none are needed).

-- 
Revolutions do not require corporate support.
