Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B105F4931
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 00:24:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rCnJ-0001Ly-00
	for parisc-linux@parisc-linux.org; Wed, 10 Oct 2001 07:24:41 +0100
Date: Wed, 10 Oct 2001 07:24:41 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] EISA support
List-ID: <linux-parisc.vger.kernel.org>

Anyone want to review a patch that makes EISA work?  I've only
tested it on a 715/75 with a Mongoose chip; but Wax is
supposed to be programmatically identical.  The patch is
18k, so rather than post it to the list, it's available from
ftp://puffin.external.hp.com/pub/parisc/src/eisa.diff
