Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from winfree.gag.com (winfree.gag.com [192.133.104.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82DA94A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 15:34:37 -0700 (MST)
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by winfree.gag.com (Postfix) with ESMTP id 3527E25E0B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 15:34:37 -0700 (MST)
Received: from gag.com (localhost [127.0.0.1])
	by rover.gag.com (Postfix) with ESMTP id 0FAF635CF1
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 15:34:35 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 06 Feb 2001 15:34:35 -0700
From: Bdale Garbee <bdale@gag.com>
Message-Id: <20010206223437.0FAF635CF1@rover.gag.com>
Subject: [parisc-linux] db2 build failed
List-ID: <linux-parisc.vger.kernel.org>

On the same J, building the Debian db-2.7.7 "db2" libraries fails after 
building the "important" pieces with the following:

gcc -g3 -pg  -Ibuild_unix -Iinclude -fPIC -Wall -pipe -D_REENTRANT  -c -o btreec
cc1: warning: PIC code generation is not compatible with profiling

btree/bt_compare.c: In function `__bam_cmp':
btree/bt_compare.c:137: Internal compiler error in output_90, at insn-output.c:4


Bdale
