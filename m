Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C1C8482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 03:52:57 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id F2B3A1FFFBA
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 11:52:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 9CD6F15384
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 09:52:19 +0000 (UTC)
Date: Sun, 15 Jun 2003 09:52:19 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.53.0306150945230.651@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.5.71-pa1 do_sigaction problem
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

already had this problem with 2.5.70.
This is a monolithic kernel, modules=no on 715/100.

gcc is		gcc version 3.3 (Debian) [3.3-3]
binutils 	2.14.90.0.4-0

anyhing I can do best to trace this ?

--- cut ---
......
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 432k freed

Stack Dump:
 10030200:  0006ff0e 102bd000 100376c0 00000000
 100301f0:  00027670 00026e70 102bd000 00027670
 100301e0:  102a8010 15fb8ca4 00000003 ffffffe0
 100301d0:  100376c0 0000003f 00000040 15fb8d48
 100301c0:  00000000 102bd000 102a8010 102a8010
 100301b0:  0900deee 1012ffac 00020002 15ff1000
 100301a0:  00020002 faf00078 00000001 00000003
 10030190:  00020002 15ff1000 00020002 00000000
 10030180:  15ffe820 40180000 40026fb4 4017fcc8
 10030170:  40181cf8 1010642c 102b9020 faf010a8
 10030160:  15efa6d4 10349960 15ff726c ffffffea
 10030150:  100300d8 00000000 0000000e faf00078
 10030140:  00000001 40001f5f faf00140 1030d810
 10030130:  1036b920 101304b4 00000000 00000001
 10030120:  00000003 15efa6d4 15ff1000 faf00348
 10030110:  4017e33c 00000000 00000001 00000000
 10030100:  000272ae 00000001 100376c0 102bd000
 100300f0:  faf00348 4017e33c 00000000 faf00fc0
 100300e0:  faf00000 00000001 faf00348 00000000
 100300d0:  00000000 00000000 00027456 00000001
 100300c0:  faf005c0 00000000 00000000 00000000
 100300b0:  00000000 1010afe8 00000000 00000000
 100300a0:  00000000 10290140 000002eb 4002f014
 10030090:  40028850 00000000 00000000 40015340
 10030080:  00000001 00000000 00000000 00000000
 10030070:  00000000 1010a088 00000000 00000000
 10030060:  00000000 00000000 00000000 00000000
 10030050:  00000000 00000000 00000000 00000000
 10030040:  00000000 00000000 00000000 00000000
 10030030:  00000000 00000000 00000000 00000000
 10030020:  00000000 00000000 00000000 00000000
 10030010:  00000001 00000000 00000000 102be8e4

Kernel addresses on the stack:
 [<1012ffac>] do_sigaction+0xe0/0x290
 [<1010642c>] handle_interruption+0x274/0x5b4
 [<101304b4>] sys_rt_sigaction+0x7c/0xc4
 [<1010afe8>] syscall_exit+0x0/0x28
 [<1010a088>] intr_check_sig+0x0/0xc


Kernel Fault: Code=15 regs=10030200 (Addr=00027454)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001110 Not tainted
r00-03  00000000 102e97c0 1012ffac 00027454
r04-07  00000000 0000000d 0000000e 15fb8d54
r08-11  100300c8 00027670 102bd000 00026e70
r12-15  00027670 00000000 100376c0 102bd000
r16-19  102a8010 102a8010 0900deee 102a8010
r20-23  00001000 00027457 000000e0 0000000c
r24-27  00000000 00000000 00027456 102a8010
r28-31  00027456 00000400 10030200 40061097
sr0-3   00000001 00000001 00000000 00000001
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101a0ce4 101a0ce8
 IIR: 0c601094    ISR: 00000000  IOR: 00027454
 CPU:        0   CR30: 10030000 CR31: 102ec000
 ORIG_R28: 000014f4
 IAOQ[0]: __canonicalize_funcptr_for_compare+0x38/0x134
 IAOQ[1]: __canonicalize_funcptr_for_compare+0x3c/0x134
 RP(r2): do_sigaction+0xe0/0x290

--- cut ---

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
