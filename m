Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 562FC482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 17:42:20 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15tdqk-0002nM-00
	for parisc-linux@parisc-linux.org; Wed, 17 Oct 2001 00:42:18 +0100
Date: Wed, 17 Oct 2001 00:42:18 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011017004218.K15532@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] new glibc dpatch
List-ID: <linux-parisc.vger.kernel.org>

due to a few people hassling me, i've created a new hppa patch for glibc.
it incorporates a couple of changes Carlos posted to the list and adds a
couple of diffs of my own.  i've sent it to BenC for the 2.2.4-4 release
of glibc, which he assures me is imminent.

You can find it at
ftp://puffin.external.hp.com/pub/parisc/src/glibc22-hppa.dpatch

have fun.  it's still building on paer.d.o, but i would expect it to
fail to build in the same place as before.

-- 
Revolutions do not require corporate support.
