Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EF634829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Oct 2002 07:56:36 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by atlrel9.hp.com (Postfix) with ESMTP id 21FB2E0078D
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Oct 2002 09:56:33 -0400 (EDT)
Message-ID: <3DA192E7.AC5339AD@hpfrcu81.france.hp.com>
Date: Mon, 07 Oct 2002 15:58:00 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.44.0210071557590.5384-100000@marian.itp.bg>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Long boot
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

Hi All,

May be its a FAQ, I tried to browse the mailing list archive but didn't find
anything.

I got te very last palinux source, did the various method (oldconfig,
menuconfig), then make dep and make vlinux.

When I reboot the latest build kernel on my C180 it got up to

........
Segment 0 load 00100000 size 1819636 mediaptr 0x1000
Segment 1 load 002be000 size 264864 mediaptr 0x1be000
Segment 2 load 00300000 size 401768 mediaptr 0x1ff000
Segment 3 load 00364000 size 8192 mediaptr 0x262000
Segment 4 load 00368000 size 32768 mediaptr 0x264000
Segment 5 load 003900b0 size 92624 mediaptr 0x26c0b0
Branching to kernel entry point 0x00100258.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org


Then it hang there for about 15 minutes (or was it 30 didn't noted), then it
proceed successfully

Linux version 2.4.19-pa21 (phi@iws1pb02) (gcc version 3.0.4) #3 Mon Oct 7
11:44:
59 CEST 2002
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
......



When I reboot again but ask PALO to use vmlinux.prev (my prev kernel don't
know how to make another one likethis one) the micro hang is less than a
minute.

Is there something I should do to get booted faster?

Thanx in advance,
Phi
