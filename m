Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B2DB482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 13:56:06 -0600 (MDT)
Received: from security.hp.com (cranston.fc.hp.com [15.1.44.224])
	by atlrel1.hp.com (Postfix) with ESMTP id E2AB6579
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 15:56:04 -0400 (EDT)
To: parisc-linux@lists.parisc-linux.org
From: LaMont Jones <lamont@hp.com>
Cc: LaMont Jones <lamont@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 12 Jul 2001 12:45:41 -0600
Sender: lamont@hp.com
Message-Id: <20010712184542.D9D621872C@security.hp.com>
Subject: [parisc-linux] J200 built-in broken with 2.4.6?
List-ID: <linux-parisc.vger.kernel.org>

I have a J200 that had a working NIC back in April, which now successfully
net-boots up to the point of trying to get it's IP, at which point I see
bootp requests (and their answer) on the bootp server, but it never accepts
the packet.  Since we tftpbooted, I find it hard to suspect hardware, and
rather expect that it's something b0rked in the 2.4.0->2.4.6 transition.

lamont
