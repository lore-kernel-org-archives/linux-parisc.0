Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id D113B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 18:28:22 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h0U1gtp03289
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 17:42:55 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h0U1Rdj01866
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 17:27:39 -0800
Date: Wed, 29 Jan 2003 17:27:39 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0301291610240.235-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Update...
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

Yesterday I sent back saying my box, booted faster with your bus-walk
patch, but still hung..  I finally had a chance to take a little closer
look at it today.

The kernel dead hangs, {magic keys don't work}, and it does it where it
should be starting to mount/read the root volume.

I've removed from the kernel config:
RAM disk support
Initial RAM disk (initrd) support

HP System Device Controller i8042 Support
HP SDC Real Time Clock
HIL MLC Support
HIL Keyboard (full) support (NEW)
HIL Mouse & Pointer support (NEW)

and now it boots fine...
I will attempt to figure out which option hosed it...
