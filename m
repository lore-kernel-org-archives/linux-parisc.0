Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00D57488F
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 17:33:16 -0700 (MST)
Received: from weilbach (helo=localhost)
	by leo.uni-sw.gwdg.de with local-esmtp (Exim 3.34)
	id 16j8Js-0004xM-00
	for parisc-linux@lists.parisc-linux.org; Fri, 08 Mar 2002 01:33:12 +0100
Date: Fri, 8 Mar 2002 01:33:11 +0100 (CET)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <006d01c1c482$1e5712a0$02c1a8c0@james.co.uk>
Message-ID: <Pine.LNX.4.43.0203080127340.12154-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] traps in whiptail with apt-get upgrade
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

Hi,

I updated the kernel on my 712/60 today using the 32bit precompiled
version 2.4.18-pa3 from the ftp-site. It seems to fix the /dev/lp0
problem for me.

But it still traps with command='whiptail' when I do an apt-get
upgrade. Below are the entries from /var/log/kern.log, before I
Ctrl-C'ed the apt-get.

Greetings,
	Peter.

P.S.: Is it possible to activate autofs or autofs4 in the
precompiled kernel? I hate to compile it myself on that slow 712/60
just for that...


Mar  8 01:29:44 hplinux kernel:
Mar  8 01:29:44 hplinux kernel: do_page_fault() pid=486 command='whiptail' type=15 address=0x0003302c
Mar  8 01:29:44 hplinux kernel: vm_start = 0x00025000, vm_end = 0x00033000
Mar  8 01:29:44 hplinux kernel:
Mar  8 01:29:44 hplinux kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Mar  8 01:29:44 hplinux kernel: PSW: 00000000000011001111111100001111 Not tainted
Mar  8 01:29:44 hplinux kernel: r00-03  00000000 402d8b68 402d8698 00032f18
Mar  8 01:29:44 hplinux kernel: r04-07  402d8690 402dd190 00000110 00000000
Mar  8 01:29:44 hplinux kernel: r08-11  faf00a50 402d8690 00000000 00000000
Mar  8 01:29:44 hplinux kernel: r12-15  00000000 faf00bcc ffffffff faf00bd0
Mar  8 01:29:44 hplinux kernel: r16-19  faf00bc8 000b9e9c faf00990 402dd190
Mar  8 01:29:44 hplinux kernel: r20-23  00000111 00033028 00000004 402d87a8
Mar  8 01:29:44 hplinux kernel: r24-27  00000200 00000110 00000024 000240b8
Mar  8 01:29:45 hplinux kernel: r28-31  00032f18 00032f18 faf00d80 01fffde1
Mar  8 01:29:45 hplinux kernel: sr0-3   00000000 00000005 00000000 00000005
Mar  8 01:29:45 hplinux kernel: sr4-7   00000005 00000005 00000005 00000005
Mar  8 01:29:45 hplinux kernel:
Mar  8 01:29:45 hplinux kernel: IASQ: 00000005 00000005 IAOQ: 4020e097 4020db5f
Mar  8 01:29:45 hplinux kernel:  IIR: 0ebf1288    ISR: 00000005  IOR: 0003302c
Mar  8 01:29:45 hplinux kernel:  CPU:        0   CR30: 14794000 CR31: 10390000
Mar  8 01:29:45 hplinux kernel:  ORIG_R28: 400c2588
Mar  8 01:29:59 hplinux kernel:
Mar  8 01:29:59 hplinux kernel: do_page_fault() pid=516 command='whiptail' type=15 address=0x00033f2c
Mar  8 01:29:59 hplinux kernel: vm_start = 0x00025000, vm_end = 0x00033000
Mar  8 01:29:59 hplinux kernel:
Mar  8 01:29:59 hplinux kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Mar  8 01:29:59 hplinux kernel: PSW: 00000000000011001111111100001111 Not tainted
Mar  8 01:29:59 hplinux kernel: r00-03  00000000 402d8b68 402d8698 00032f18
Mar  8 01:29:59 hplinux kernel: r04-07  402d8690 402dd190 00001010 00000002
Mar  8 01:29:59 hplinux kernel: r08-11  faf00b08 402d8690 00025380 00000000
Mar  8 01:29:59 hplinux kernel: r12-15  faf01090 00000002 ffffffff 00000000
Mar  8 01:29:59 hplinux kernel: r16-19  00000000 000b9e9c faf00990 402dd190
Mar  8 01:29:59 hplinux kernel: r20-23  00001011 00033f28 00000122 00000016
Mar  8 01:29:59 hplinux kernel: r24-27  02000000 00001010 00000064 000240b8
Mar  8 01:29:59 hplinux kernel: r28-31  00032f18 00032f18 faf01200 01ffed11
Mar  8 01:29:59 hplinux kernel: sr0-3   00000000 00000001 00000000 00000001
Mar  8 01:29:59 hplinux kernel: sr4-7   00000001 00000001 00000001 00000001
Mar  8 01:29:59 hplinux kernel:
Mar  8 01:30:00 hplinux kernel: IASQ: 00000001 00000001 IAOQ: 4020e097 4020db5f
Mar  8 01:30:00 hplinux kernel:  IIR: 0ebf1288    ISR: 00000001  IOR: 00033f2c
Mar  8 01:30:00 hplinux kernel:  CPU:        0   CR30: 1409c000 CR31: 10390000
Mar  8 01:30:00 hplinux kernel:  ORIG_R28: 402d5da4
Mar  8 01:30:02 hplinux kernel:
Mar  8 01:30:02 hplinux kernel: do_page_fault() pid=523 command='whiptail' type=15 address=0x00033eec
Mar  8 01:30:02 hplinux kernel: vm_start = 0x00025000, vm_end = 0x00033000
Mar  8 01:30:02 hplinux kernel:
Mar  8 01:30:02 hplinux kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Mar  8 01:30:02 hplinux kernel: PSW: 00000000000011001111111100001111 Not tainted
Mar  8 01:30:02 hplinux kernel: r00-03  00000000 402d8b68 402d8698 00032ed8
Mar  8 01:30:02 hplinux kernel: r04-07  402d8690 402dd190 00001010 00000002
Mar  8 01:30:02 hplinux kernel: r08-11  faf00bc8 402d8690 00025380 00000000
Mar  8 01:30:02 hplinux kernel: r12-15  faf01150 00000002 ffffffff 00000000
Mar  8 01:30:02 hplinux kernel: r16-19  00000000 000b9e9c faf00990 402dd190
Mar  8 01:30:02 hplinux kernel: r20-23  00001011 00033ee8 00000502 00000020
Mar  8 01:30:02 hplinux kernel: r24-27  02000000 00001010 00000064 000240b8
Mar  8 01:30:02 hplinux kernel: r28-31  00032ed8 00032ed8 faf012c0 01ffecc1
Mar  8 01:30:02 hplinux kernel: sr0-3   00000000 00000001 00000000 00000001
Mar  8 01:30:02 hplinux kernel: sr4-7   00000001 00000001 00000001 00000001
Mar  8 01:30:02 hplinux kernel:
Mar  8 01:30:03 hplinux kernel: IASQ: 00000001 00000001 IAOQ: 4020e097 4020db5f
Mar  8 01:30:03 hplinux kernel:  IIR: 0ebf1288    ISR: 00000001  IOR: 00033eec
Mar  8 01:30:03 hplinux kernel:  CPU:        0   CR30: 1409c000 CR31: 10390000
Mar  8 01:30:03 hplinux kernel:  ORIG_R28: 402d5da4
