Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62CE5483C
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 01:56:45 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id 0ED971C00058
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 03:56:45 -0500 (EST)
Date: Sun, 9 Feb 2003 01:55:28 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200302090855.BAA17861@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: grundler@dsl2.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] re: [parisc-linux-cvs] linux grundler
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Can I move the disable_sr_hashing() call from setup_bootmem() to
> before/after cache_init() in setup_arch()?

Sure. As long as you call it before paging_init() you will be OK.

> Please feel free to correct if you have time to muck with it.
> If my damage is not backed out in the morning, I'll back it out then.

I don't have a current tree and I need to go to bed.

John
