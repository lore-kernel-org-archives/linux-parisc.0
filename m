Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 468CD482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:43:26 -0600 (MDT)
Date: Thu, 23 Aug 2001 14:42:49 -0400 (EDT)
From: <nick@snowman.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
In-Reply-To: <20010823193847.B27374@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0108231442370.16296-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Could you email or point me to the lifimage you use?
	Thanks
		Nick

On Thu, 23 Aug 2001, Matthew Wilcox wrote:

> On Thu, Aug 23, 2001 at 12:58:34PM -0400, nick@snowman.net wrote:
> > Hi, I'm trying to get a C180 booting entirely off the network.  I can load
> > a lifimage over bootp, however then I'm stuck.  There is a vmlinux
> > attached to the lifimage, but I can't figure out how to tell the loader to
> > boot that and use an NFSroot.  I have found a few suggestions (vmlinux
> > HOME=/ TERM=linux root=/dev/nfs nfsroot=mynfs:/dir) and that dosen't seem
> > to work.  Do I need a special lifimage?
> 
> Well, I do this all the time, so it does work :-)  All I need to do is
> change the NFSROOT in palo's Makefile to my server's IP address.  I'm
> still crosscompiling; my string looks like this:
> 0/vmlinux64 HOME=/ TERM=linux root=/dev/nfs nfsroot=15.1.50.190 ip=bootp
> 
> -- 
> Revolutions do not require corporate support.
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
