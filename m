Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB158482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 Aug 2001 13:53:10 -0600 (MDT)
Date: Fri, 17 Aug 2001 15:53:40 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Cc: baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Users staying up to date.
Message-ID: <20010817155340.C8649@megatonmonkey.net>
References: <20010814154037.I25258@megatonmonkey.net> <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk> <20010814215030.A26703@megatonmonkey.net> <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Aug 15, 2001 at 04:16:10AM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> /usr/share/locale
> /usr/share/locale/cs
> /usr/share/locale/cs/LC_MESSAGES
> /usr/share/locale/cs/LC_MESSAGES/dpkg.mo
> 
> I seem to remember someone saying this was a bug in an old version
> of dpkg.  So one way around this may be to dpkg --remove texinfo, then
> install dpkg, then install texinfo again.
>

I tried removing texinfo. Sadly, what proceeds to occur is a 
relative chain of packages that continually depend on 
/usr/share/locale/cs, all the way down to 'tar.' At which point
I had lost most of my system functionality and was scp'ing 
binaries into /bin to keep it alive.

A fruitless effort, but interesting none the less. ;)

When I get home tonight I'll roll a new kernel and do more testing.

How does the installer get around this problem?
Since it too must start with a base system?
(Maybe it's just my misunderstanding of the complete inner workings
of hte installer).

Cheers,
Carlos.


 
