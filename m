Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E693482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jul 2001 10:02:19 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id busmgaaa for parisc-linux@lists.parisc-linux.org; Tue, 3 Jul 2001 08:58:38 -0700
Date: Tue, 3 Jul 2001 09:01:36 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Peter Weilbacher <weilbach@uni-sw.gwdg.de>,
	jfs-discussion@oss.software.ibm.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] JFS on PA-RISC-Linux
Message-ID: <20010703090136.D31475@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20010702180851.A19547@nickel.kgarner.com> <Pine.LNX.4.33.0107031224210.15161-100000@leo.uni-sw.gwdg.de> <20010703161509.A6103@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010703161509.A6103@parcelfarce.linux.theplanet.co.uk>
Sender: Randolph Chung <randolph@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>

> It's the fault of both, really.  The userspace program is attempting to do
> an unaligned access.  say, loading an int from a non-word-aligned address.
> Most CPUs can't handle this and take a fault.  We haven't yet implemented
> a trap handler for that fault.
> 
> Or rather, tausq has implemented one, but hasn't activated it yet,
> I believe.... tausq?

The trap handler is activated but doesn't handle this particular load
instruction yet. I'll fix this tomorrow.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
