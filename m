Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DD48482A
	for <parisc-linux@parisc-linux.org>; Fri, 18 May 2001 10:02:04 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 150mgy-0003EI-00
	for parisc-linux@parisc-linux.org; Fri, 18 May 2001 17:01:28 +0100
Date: Fri, 18 May 2001 17:01:28 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010518170128.K13481@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Samba autobuild
List-ID: <linux-parisc.vger.kernel.org>

FYI, I've set up a samba autobuilder on a 712/80 here; you can monitor its
progress on http://build.samba.org/.  after a couple of teething problems
(i forgot to install libpam-dev), we're up and running with the rest.
we have fewer warnings than most, which makes me happy.

-- 
Revolutions do not require corporate support.
