Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-3.cisco.com (sj-msg-core-3.cisco.com [171.70.157.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFA53482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 00:56:06 -0600 (MDT)
Received: from mira-sjc5-9.cisco.com (mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-3.cisco.com (8.11.3/8.9.1) with ESMTP id f9D6s0C15751
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 23:54:00 -0700 (PDT)
Date: Fri, 12 Oct 2001 23:56:03 -0700 (PDT)
From: Christian Suder <csuder@cisco.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0110122341540.766-100000@ibanez.csuder.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Followup: 735/125 hangs...
List-ID: <linux-parisc.vger.kernel.org>

FWIW, 

I repartitioned the HD, from boot-swap-root to boot-root-swap. Formatting
the filesystem went until after the message about tune2fs
appears. Powercycled and did not format again but selected 'use existing
fs'. Hangs with : 'ioctl: LOOP_CLR_FD: No such device or address' when
installing the system image. 

Tried the same excercise again and got lots of 

 - block = 4244379656, count = 1
EXT2-fs error (device sd(8,2)): ext2_free_blocks: Freeing blocks not in
datazone - block = 4269604550, count = 1

Hmmm.... saw the same when the C110 had problems. 

Used the same CD on a 712/80 with no problems at all !

	Christian
