Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC3F6482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 00:16:41 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id B8D751F74F
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 02:16:39 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id AAA07559
	for parisc-linux@lists.parisc-linux.org; Sun, 2 Sep 2001 00:16:39 -0600 (MDT)
Date: Sun, 2 Sep 2001 00:16:39 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200109020616.AAA07559@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: Delaying the device inventory detection time
List-ID: <linux-parisc.vger.kernel.org>

Ryan,

Why isn't alloc_bootmem or alloc_bootmem_pages good enough? I already
restructured the boot sequence a while back to allow for that.

The only problem I see with using those routines is that it is a little
harder to free up memory allocated with those routines once the
memory subsystem is fully initialized, but if you are only dynamically
allocating, without a need to free the memory you should be able to
use those routines without having to do any restructuring.

John
