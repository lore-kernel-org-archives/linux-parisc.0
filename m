Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30000482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 10:58:37 -0600 (MDT)
Received: from localhost (nick@localhost)
	by ns.snowman.net (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA25502
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:58:34 -0400
Date: Thu, 23 Aug 2001 12:58:34 -0400 (EDT)
From: <nick@snowman.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0108231256390.16296-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C180 netbooting
List-ID: <linux-parisc.vger.kernel.org>

Hi, I'm trying to get a C180 booting entirely off the network.  I can load
a lifimage over bootp, however then I'm stuck.  There is a vmlinux
attached to the lifimage, but I can't figure out how to tell the loader to
boot that and use an NFSroot.  I have found a few suggestions (vmlinux
HOME=/ TERM=linux root=/dev/nfs nfsroot=mynfs:/dir) and that dosen't seem
to work.  Do I need a special lifimage?
	Nick
