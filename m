Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 746AC4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 12:19:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14PrAa-0003Eg-00
	for parisc-linux@lists.parisc-linux.org; Mon, 05 Feb 2001 19:19:24 +0000
Date: Mon, 5 Feb 2001 19:19:24 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010205191924.C5520@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] lasi_82596
List-ID: <linux-parisc.vger.kernel.org>

alan's not merging some of the 82596 network driver stuff because it's
using the old Space.c method of registration.  anyone want to fix it to
use __setup?

-- 
Revolutions do not require corporate support.
