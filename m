Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB370482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:38:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ZzNP-0008Gl-00; Thu, 23 Aug 2001 19:38:47 +0100
Date: Thu, 23 Aug 2001 19:38:47 +0100
From: Matthew Wilcox <willy@debian.org>
To: nick@snowman.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
Message-ID: <20010823193847.B27374@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.21.0108231256390.16296-100000@ns>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0108231256390.16296-100000@ns>; from nick@snowman.net on Thu, Aug 23, 2001 at 12:58:34PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 23, 2001 at 12:58:34PM -0400, nick@snowman.net wrote:
> Hi, I'm trying to get a C180 booting entirely off the network.  I can load
> a lifimage over bootp, however then I'm stuck.  There is a vmlinux
> attached to the lifimage, but I can't figure out how to tell the loader to
> boot that and use an NFSroot.  I have found a few suggestions (vmlinux
> HOME=/ TERM=linux root=/dev/nfs nfsroot=mynfs:/dir) and that dosen't seem
> to work.  Do I need a special lifimage?

Well, I do this all the time, so it does work :-)  All I need to do is
change the NFSROOT in palo's Makefile to my server's IP address.  I'm
still crosscompiling; my string looks like this:
0/vmlinux64 HOME=/ TERM=linux root=/dev/nfs nfsroot=15.1.50.190 ip=bootp

-- 
Revolutions do not require corporate support.
