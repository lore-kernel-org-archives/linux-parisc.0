Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F0014A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 06:10:06 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id B2B7BB46
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 08:10:05 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id GAA24428 for parisc-linux@lists.parisc-linux.org; Thu, 8 Feb 2001 06:10:05 -0700 (MST)
Date: Thu, 8 Feb 2001 06:10:05 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200102081310.GAA24428@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Set Associative cache flushing bug
List-ID: <linux-parisc.vger.kernel.org>

I just checked in a fix for a bug we had when flushing the entire cache
on processors with set associative caches (PCXL2, PCXW, PCXW+). The
bug probably rarely occured on PCXL2, but happens fairly often on most
PCXW(+) machines. With this checkin we've been able to natively build
a kernel multiple times on a C3K and A500 (both with the 64 bit kernel).

So, top of branch is once again in fairly stable condition, and possibly
better than ever for PCXW/PCXW+ based machines.

John
