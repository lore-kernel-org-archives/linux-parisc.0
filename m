Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA13714
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 05:42:27 -0600
Received: from user49-209.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.49.209)
  by mailserv2.iuinc.com with SMTP; 25 Aug 2000 11:42:23 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B211FB005; Fri, 25 Aug 2000 12:40:49 +0100 (BST)
Date: Fri, 25 Aug 2000 12:40:49 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000825124049.B13420@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Kernel and palo source broken
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I just cvs updated palo and kernel source, and grabbed a new
cross compiler build from Matt.

palo update results in by A180 boot stopping after:

  Entry 00100000 first 00100000 n 3
  Segment 0 load 00100000 size 1512788 mediaptr 0x1000
  Segment 1 load 00272000 size 115348 mediaptr 0x173000
  Segment 2 load 00290000 size 122880 mediaptr 0x190000
  branching to kernel entry point 0x00100000
  Set default PSW W bit to 0


Kernel wouldn't build - mostly arch/parisc/kernel/signal.c problems,
needs to include linux/version.h, PF_PTRACED undefined...

I did cvs update -D '24 hours ago' on various things and my A180
boots again, but my 715/75 doesn't.  It thinks it has three disks
rather than two plus a tape, disk probing then fails, and finally
it thinks it is sending BOOTP requests but nothing is seen on the
network.  

Boy, am I glad Friday lunchtime is pub time!

Richard
