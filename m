Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tlr-es01.eu.unilever.com (mailout04.unilever.com [194.60.106.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id F340B4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Jan 2003 02:37:37 -0700 (MST)
Received: from teatime.eu.unilever.com by tlr-es01.eu.unilever.com with ESMTP for parisc-linux@lists.parisc-linux.org; Wed, 8 Jan 2003 09:37:06 Z
Reply-To: <Matt.Foster@Unilever.com>
From: "Matt Foster" <Matt.Foster@Unilever.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Wed, 8 Jan 2003 09:36:24 -0000
Message-Id: <003001c2b6f9$693c0bd0$211def9f@teatime>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Subject: [parisc-linux] Re: do_page_fault() infinite loop running 2.4.20-pa18 #9 SMP
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

My B132 seems to be having similar problems running a non SMP kernel,
don't know if this is useful information. 

saturn:/usr/local/src# dmesg | more
Linux version 2.4.20-pa18 (bame@dsl2) (gcc version 3.0.3) #1 Tue Jan 7
06:44:31
MST 2003
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
[*SNIP*]
Adding Swap: 249232k swap-space (priority -1)
eth0: link ok.

do_page_fault() pid=266 command='sendmail' type=6 address=0x00000003

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 400c78f0 40315e07 00000000
r04-07  40326bec 40316230 00000010 00000001
r08-11  00000000 402d3c98 0008df50 0008df54
r12-15  00000076 00000073 00000006 00000000
r16-19  000b3348 ffffffff 000bc248 40326bec
r20-23  00000000 faf02a58 00000000 00000001
r24-27  00000000 40316230 000f6dd0 000b3348
r28-31  00000016 400e19dc faf029c0 40315e07
sr0-3   00000000 0000016e 00000000 0000016e
sr4-7   0000016e 0000016e 0000016e 0000016e

IASQ: 0000016e 0000016e IAOQ: 00000003 00000007
 IIR: 081c0243    ISR: 0000016e  IOR: 000f703c
 CPU:        0   CR30: 16668000 CR31: 103b8000
 ORIG_R28: 00000000
