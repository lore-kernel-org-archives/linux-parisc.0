Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from winfree.gag.com (winfree.gag.com [192.133.104.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 493364A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 15:26:37 -0700 (MST)
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by winfree.gag.com (Postfix) with ESMTP id DF8B425E0B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 15:26:36 -0700 (MST)
Received: from gag.com (localhost [127.0.0.1])
	by rover.gag.com (Postfix) with ESMTP id 647ED35CF1
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 15:26:36 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 06 Feb 2001 15:26:36 -0700
From: Bdale Garbee <bdale@gag.com>
Message-Id: <20010206222636.647ED35CF1@rover.gag.com>
Subject: [parisc-linux] ICE compiling pump
List-ID: <linux-parisc.vger.kernel.org>

Building the Debian pump package on a J5000 running a kernel provided by jsm
last night and the latest taggart nfsroot updated with more or less everything
in the new-debs directory on pehc, I get:

cc -I. -Wall -g  -D__STANDALONE__ -DVERSION=\"0.8.3\"   -c -o dhcp.o dhcp.c
dhcp.c: In function `pumpDhcpRun':
dhcp.c:1330: Internal compiler error in eliminate_regs, at reload1.c:2505

Nothing in dmesg.  What else can/should I provide to help chase this down?

Bdale
