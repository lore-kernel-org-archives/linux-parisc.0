Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86137482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 10:13:32 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Kj5m-0007UU-00; Thu, 12 Jul 2001 17:13:30 +0100
Date: Thu, 12 Jul 2001 17:13:30 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: rpengelly <rpengelly@ati.stlawrencec.on.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problems with checksums
Message-ID: <20010712171330.M3048@parcelfarce.linux.theplanet.co.uk>
References: <001201c10ad2$3beb97b0$0f809b8e@ati.stlawrencec.on.ca> <20010712140756.C18375@linuxcare.com> <001e01c10ad6$588cb4e0$0f809b8e@ati.stlawrencec.on.ca> <20010712145615.E18375@linuxcare.com> <000701c10ae4$186cf6a0$0f809b8e@ati.stlawrencec.on.ca> <20010712082908.K531@tausq.org> <20010712085531.L531@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010712085531.L531@tausq.org>; from randolph@tausq.org on Thu, Jul 12, 2001 at 08:55:31AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 12, 2001 at 08:55:31AM -0700, Randolph Chung wrote:
> > Be careful, Debian uses BSD md5sum instead of GNU md5, some other Linux
> > systems use GNU md5sum. They produce different output for the same
> > input!
> 
> ..... or maybe i'm just smoking something. ISTR them being different in
> some cases, but when i tried just now they produce the same output.
> Argh...

You're confused with normal sum, I believe.  Although GNU sum defaults to
BSD-style, so I'm not sure exactly which drugs you're taking :-)

-- 
Revolutions do not require corporate support.
