Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8F144829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 11:03:40 -0700 (MST)
Received: from xparelay2.ptp.hp.com (xparelay2.ptp.hp.com [15.1.28.65])
	by palrel13.hp.com (Postfix) with ESMTP id 212E8400E61
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 10:03:36 -0800 (PST)
Received: from xpabh1.ptp.hp.com (xpabh1.ptp.hp.com [15.1.28.60])
	by xparelay2.ptp.hp.com (Postfix) with ESMTP id 98D82188
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 10:03:15 -0800 (PST)
Message-ID: <9A0482A7BD2506488AD9417C93F3714FB865E1@xsp01.brazil.hp.com>
From: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
To: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Date: Wed, 11 Dec 2002 10:03:01 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] smp crash in version 2.4.20-pa13
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

Hi people,

I'm trying to run Linux (compiled with smp, kernel version 2.4.20-pa13) on a
single-processed C3600 workstation and I receive the folowing error message
at boot time:

POSIX conformance testing by UNIFIX
SMP: Bootstrap processor only.
SMP: Total 1 of 1 processors activated (1101.00 BogoMIPS noticed).
Waiting on wait_init_idle (map = 0x0)
All processors have done init_idle

Stack Dump:
 104588c0:  0004070e 00000000 00000000 00000000
 104588b0:  00000000 1011f2cc 00000000 00000000
 104588a0:  00000000 00000000 00000000 00000000
 10458890:  00000000 00000000 00000000 00000000
 10458880:  00000000 00000000 00000000 00000000
 10458870:  00000000 00000000 00000000 103a0810

Kernel addresses on the stack:
 [<1011f2cc>]  [<10108c28>]  [<10120f6c>]  [<10120f6c>]
 [<101213b4>]  [<101213b4>]  [<101001e8>]  [<101211ec>]
 [<101001ac>]  [<10125f7c>]

Kernel Fault: Code=15 regs=104588c0 (Addr=0006cd00)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000011100001110 Not tainted
r00-03  00000000 10362260 1011f2cc 100ac000
r04-07  003a7000 00000001 00010f00 10362010
r08-11  fffffff4 1039c810 00000000 104585c0
r12-15  00000995 ffffffff 00000000 f0400004
r16-19  f00008c4 f000017c f0000174 00000001
r20-23  10362270 000006cd 0006cd00 0000000f
r24-27  0000000f 100ac000 00010f00 10362010
r28-31  00000000 000009bb 104588c0 10486010
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1011f4c4 1011f4c8
 IIR: 0ec01093    ISR: 00000000  IOR: 0006cd00
 CPU:        0   CR30: 10458000 CR31: 10460000
 ORIG_R28: 1039f640

Anyone, already see this problem? 
Anyone, know anything about it?
Please, help me to found a solution to this problem.

Thanks in advance.

-----------------------------------------------------------------------
              Leandro Marcondes Farinati
                    Software Developer

*   leandro.farinati@hp.com
