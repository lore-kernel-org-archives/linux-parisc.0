Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B16F4880
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Apr 2004 23:53:20 -0600 (MDT)
Date: Mon, 19 Apr 2004 22:53:30 -0700
From: Randolph Chung <tausq@debian.org>
To: Roy Keene <parisc@rkeene.org>
Subject: Re: [parisc-linux] Kernel 2.4 bug (fwd)
Message-ID: <20040420055330.GY17842@tausq.org>
References: <Pine.LNX.4.58.0404200039410.31608@hammer.oc9.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0404200039410.31608@hammer.oc9.org>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> (double free() shouldn't cause the kernel to give page faults, running it
>  enough times eventually crashes the kernel)

actually, the page fault message from the kernel is just informational.
it tells you what is the processor state when you get a segfault. it's
quite useful for some types of debugging.

however, this should NOT cause your kernel to crash. When your kernel
crashes, do you see a different type of register dump show up? does the
machine hang? hpmc? print some errors? the important bit to look at is
the IAOQ listed in the register dump. If the last 2 bits are set, then
it's a userspace page fault (and should be safe). If you get one where
the last 2 bits are 0 then it's a kernel-space fault, and we should try
to figure out where that comes from.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
