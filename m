Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BE584983
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 23:46:26 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rYfY-0006jz-00
	for parisc-linux@parisc-linux.org; Thu, 11 Oct 2001 06:46:08 +0100
Date: Thu, 11 Oct 2001 06:46:08 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011011064608.A25868@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] EISA changes broke SuckyIO
List-ID: <linux-parisc.vger.kernel.org>

The recent changes (-pa46 or so) which I made to support EISA have
broken SuckyIO-based boxes -- everything from the B1000 to J7000.
This will get fixed tomorrow.

-- 
Revolutions do not require corporate support.
