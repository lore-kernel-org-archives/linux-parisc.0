Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDF704838
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 00:41:32 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 273981C01B82
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 02:41:32 -0500 (EST)
Date: Sun, 9 Feb 2003 00:40:14 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200302090740.AAA17008@udlkern.fc.hp.com>
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

> o moved disable_sr_hash() from SMP to common code path so all
> CPU's (including monarch) have this disabled.

Huh? You didn't seriously think the monarch still had sr hashing enabled
did you? Believe me, shared memory wouldn't work at all if that was the
case.

This change is wrong. init_per_cpu() is called too early for the monarch.
disable_sr_hashing relies on the boot cpu data to be initialized to
determine which code should be used to disable the sr hashing.  It might
work for PA2.0, since it is the default case, but you probably broke all
of the other processors.

disable_sr_hashing() is called for the monarch in mm/init.c in
setup_bootmem().

John Marvin
jsm@fc.hp.com
