Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020913170351.1D5414829@dsl2.external.hp.com>
Date: Fri, 13 Sep 2002 11:03:51 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] misaligned handler failing...
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

grundler@debian:~$ /usr/X11R6/bin/xlock -mode morph3d
Access control list restored.
xlock: caught signal 10 while running morph3d mode (uid 1000).

I haven't explicitly tested all modes, but this is the only
failure I've seen.

grundler@debian:~$ fgrep 10 /usr/include/asm/signal.h
#define SIGBUS          10
#define SA_SIGINFO      0x00000010
#define _SA_SIGGFAULT   0x00000100 /* HPUX */
grundler@debian:~$

SIGBUS implies a misaligned address access....and dmesg output confirms
that theory:

xlock(16254): unaligned access to 0x4071402c at ip=0x400ea63f
Not-handled unaligned insn 0x2fe81205
Unaligned handler failed, ret = -1
xlock (pid 16254): Unaligned data reference (code 28)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 00267c90 400d2943 4013c558
r04-07  00267a60 001dcec8 001d9ec8 002486c8
r08-11  001d9ec8 001d9ec8 002486c8 001d9ec8
r12-15  001d9ec8 00000001 002596c8 001d9ec8
r16-19  002486c8 00000000 002486c8 4013c558
r20-23  00000034 000000af 400ea5e8 4071403c
r24-27  40714024 40714028 00267c90 001d9ec8
r28-31  0026b160 40753f48 faf00b80 40714028
sr0-3   00000000 00000050 00000000 00000050
sr4-7   00000050 00000050 00000050 00000050

IASQ: 00000050 00000050 IAOQ: 400ea63f 400ea643
IIR: 2fe81205    ISR: 00000050  IOR: 4071402c


grant
