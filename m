Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 156554A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Mar 2001 14:58:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14gD5k-00038V-00; Thu, 22 Mar 2001 21:58:00 +0000
Date: Thu, 22 Mar 2001 21:58:00 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>,
	Giacomo Mulas <gmulas@ca.astro.it>,
	=?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>,
	William Carlsson <william.carlsson@teligent.se>
Subject: Re: [parisc-linux] The new FS of ESIEE Team is ready
Message-ID: <20010322215800.V5491@parcelfarce.linux.theplanet.co.uk>
References: <3AB7AA9F.985576AA@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AB7AA9F.985576AA@esiee.fr>; from marteaut@esiee.fr on Tue, Mar 20, 2001 at 08:08:15PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Mar 20, 2001 at 08:08:15PM +0100, Thomas Marteau wrote:
> Hi all,
> 
> 	The new FS is ready (~61MB). No "more" bugged with the good TERM parameter and
> no password :)
> It is a specially designed for 712 owners but it is a sane fs, we hope.
> 
> Please, go to our DL page: http://mkhppa1.esiee.fr/en/download.html

Another bug i found -- install-info doesn't work.  I suspect this is
perl's fault.  Anyway, to hack around it (because i really don't need
info pages being installed on my system, but i do need to install glibc),
i added an `exit 0;' near the beginning of the install-info script.

-- 
Revolutions do not require corporate support.
