Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 785E14829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Oct 2002 06:54:50 -0600 (MDT)
Date: Mon, 7 Oct 2002 15:58:25 +0300 (EEST)
From: Stephan Trajkoff <darkstar@itp.bg>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0210071557590.5384-100000@marian.itp.bg>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] kernel panic on k210
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

Oct  7 14:26:02 obzor kernel: KERNEL: assertion
(!skb_queue_empty(&sk->write_queue)) failed at tcp_timer.c(327)
Oct  7 14:26:02 obzor kernel: WARNING! Stack pointer and cr30 do not
correspond!Oct  7 14:26:02 obzor kernel: Dumping virtual address stack
instead
Oct  7 14:26:02 obzor kernel:
Oct  7 14:26:02 obzor kernel: Dumping Stack from 0x204c8000 to 0x204c8c40:
Oct  7 14:26:02 obzor kernel: 8000 25504446 2d312e32 0a25e2e3 cfd30d0a
31203020
6f626a0a 3c3c0a2f 41757468

can anyone explain the problem?

Regards
