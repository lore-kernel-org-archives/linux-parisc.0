Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65FD24829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Feb 2003 21:17:03 -0700 (MST)
Received: from carlos by systemhalted with local (Exim 3.36 #1 (Debian))
	id 18kzBe-0004qE-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Feb 2003 23:16:54 -0500
Date: Mon, 17 Feb 2003 23:16:54 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030218041653.GI15855@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] /dev/loop0 problems in 2.5.x?
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

parisc,

Works in 2.4.x, thinking of moving part of the cluster to 2.5, but I like
to play with swap over NFS.

root@node01:/etc# /sbin/losetup /dev/loop0 /swapfile
ioctl: LOOP_SET_FD: Inappropriate ioctl for device
root@node01:/etc# uname -a
Linux node01 2.5.59-pa2 #2 Thu Jan 23 00:49:22 EST 2003 parisc unknown
unknown GNU/Linux

Do I need newer tools for playing with 2.5.x on HPPA?
Loopback is compiled into the kernel, no modules, and I can produce the
.config if you would like to look :)

Help is much appreciated. I've trolled a few places but no mention of
this particular problem.

c.
