Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75B0C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 17:06:12 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A4B3DB00C; Tue, 28 Aug 2001 00:07:48 +0100 (BST)
Date: Tue, 28 Aug 2001 00:07:48 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Users staying up to date.
Message-ID: <20010828000748.G7064@linuxcare.com>
References: <20010814154037.I25258@megatonmonkey.net> <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk> <20010814215030.A26703@megatonmonkey.net> <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk> <20010817155340.C8649@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010817155340.C8649@megatonmonkey.net>; from carlos@megatonmonkey.net on Fri, Aug 17, 2001 at 03:53:40PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 17, 2001 at 03:53:40PM -0400, Carlos O'Donell Jr. wrote:
> > 
> > /usr/share/locale
> > /usr/share/locale/cs
> > /usr/share/locale/cs/LC_MESSAGES
> > /usr/share/locale/cs/LC_MESSAGES/dpkg.mo
> > 
> > I seem to remember someone saying this was a bug in an old version
> > of dpkg.  So one way around this may be to dpkg --remove texinfo, then
> > install dpkg, then install texinfo again.
> >
> 
> I tried removing texinfo. Sadly, what proceeds to occur is a 
> relative chain of packages that continually depend on 
> /usr/share/locale/cs, all the way down to 'tar.' At which point
> I had lost most of my system functionality and was scp'ing 
> binaries into /bin to keep it alive.
> 
> A fruitless effort, but interesting none the less. ;)
> 
> When I get home tonight I'll roll a new kernel and do more testing.
> 
> How does the installer get around this problem?
> Since it too must start with a base system?
> (Maybe it's just my misunderstanding of the complete inner workings
> of hte installer).

The installer starts with a bunch of .debs which are sufficiently new
that they don't have the apt-segv problem.  That is the case for the
0.9.2 ISO, anyway.

You might me able to do a fresh install from the 0.9.2 ISO to get a
more stable system.  If you don't want to do that, you could try using
dpkg -i to install .debs from that ISO.  Possibly a dpkg -i *.deb in
the binary-hppa/base dir might just work.  You should probably be running
a new(ish) kernel before you do that.

Richard
