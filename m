Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 212B4482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Jul 2001 10:33:45 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id fjttgaaa for parisc-linux@parisc-linux.org; Mon, 23 Jul 2001 09:30:12 -0700
Date: Mon, 23 Jul 2001 09:32:47 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.7
Message-ID: <20010723093247.X3441@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20010723172016.D9408@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010723172016.D9408@parcelfarce.linux.theplanet.co.uk>
Sender: Randolph Chung <randolph@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>

> how do people feel about merging 2.4.7 into our HEAD?  it seems to have
> some interesting bugs fixed, and it might make merging with Alan easier.
> 
> Or shall we let some more of the dust settle from the 2.4.6 merge before
> doing this?  AIUI, J200 (and similar class) machines are currently not
> working, and there are issues with keyboards.  Anything else?

I've seen some weird failures after upgrading to 2.4.6:

1. ssh'ing into the box fails randomly with SIGPIPE. scp almost always
fails

2. ldd on any dynamically linked binary gives ld.so assertion errors

I haven't investigated this a whole lot, and it certainly doesn't seem
to affect everyone... 

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
