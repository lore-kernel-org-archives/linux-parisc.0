Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta04bw.bigpond.com (mta04bw.bigpond.com [144.135.24.150])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81BDE483E
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Oct 2003 05:47:30 -0600 (MDT)
Received: from Telstra ([144.135.24.72]) by mta04bw.email.bigpond.com
 (iPlanet Messaging Server 5.2 HotFix 1.14 (built Mar 18 2003))
 with SMTP id <0HM6006D2JEYD8@mta04bw.email.bigpond.com> for
 parisc-linux@lists.parisc-linux.org; Fri, 03 Oct 2003 21:47:22 +1000 (EST)
Date: Fri, 03 Oct 2003 21:52:21 +1000
From: Jeanette and John Graham <jajgraham@bigbond.com>
Subject: Re: [parisc-linux] HP HSC J3516A (2 port) ethernet card  (supported??)
To: Matthew Wilcox <willy@debian.org>,
	"Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Jeanette and John Graham <jajgraham@bigpond.com>
Message-id: <001601c389a4$ce300040$0500000a@Telstra>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
References: <1289146742B56546AE580DFC6B711A83134825@PKDWB07C.ad.sprint.com>
 <20031002154634.GD24824@parcelfarce.linux.theplanet.co.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I realise this probably isn't the answer you wanted to hear; but is there
> any chance you could try 2.6 on this machine?  We just got GSC Tulip
> cards working properly in 2.6 and it'd be really useful to know that it
> works on your box too.  After we know that, we can try backporting the
> changes to 2.4.

I have the 1 port ethernet card HP HSC J3515A in a D270
which gave similar errors under 2.4.20-pa35 and 2.4.22-pa7.
It works fine with the latest kernel vmlinux-2.6.0-test6-pa6-32.

Thanks for all the hard work,
John
