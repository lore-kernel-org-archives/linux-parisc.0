Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54A644834
	for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 00:15:17 -0600 (MDT)
Received: from localhost (nick@localhost)
	by ns.snowman.net (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id CAA29000
	for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 02:15:15 -0400
Date: Wed, 26 Sep 2001 02:15:15 -0400 (EDT)
From: <nick@snowman.net>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.LNX.4.21.0109260213000.25631-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HP C180
List-ID: <linux-parisc.vger.kernel.org>

My c180 is now happily booting (current CVS kernel), however whenever I
try to ls some dirs (no all, this example is from /usr/bin) I get errors
along these lines
ls: memory exhausted
init-2.04# ls ap*
./apt-get


SysRq: Boot Sync Unmount showPc showTasks showMem loglevel0-8 tErm kIll
killalL
SysRq: Show Regs
SysRq: Show State

                         free                        sibling
  task             PC    stack   pid father child younger older
init          R current      0     1      0    10       3       (NOTLB)
keventd       S 00ABCDEF     0     2      1             9       (L-TLB)
ksoftirqd_CPU S 00ABCDEF     0     3      0             4     1 (L-TLB)
kswapd        S 00ABCDEF     0     4      0             5     3 (L-TLB)
kreclaimd     S 00ABCDEF     0     5      0             6     4 (L-TLB)
bdflush       S 00ABCDEF     0     6      0             7     5 (L-TLB)
kupdated      S 00ABCDEF     0     7      0                   6 (L-TLB)
mdrecoveryd   S 00ABCDEF     0     9      1            10     2 (L-TLB)
rpciod        S 00ABCDEF     0    10      1                   9 (L-TLB)
SysRq: Show Memory
Mem-info:
Free pages:      118612kB (     0kB HighMem)
( Active: 491, inactive_dirty: 861, inactive_clean: 0, free: 29653 (255
510 765) )
105*4kB 48*8kB 35*16kB 14*32kB 9*64kB 6*128kB 3*256kB 2*512kB 3*1024kB
54*2048kB = 118612kB)
= 0kB)
= 0kB)
Swap cache: add 0, delete 0, find 0/0
Free swap:            0kB
32768 pages of RAM
1223 reserved pages
296 pages shared
0 pages swap cached
Buffer memory:     2372kB
