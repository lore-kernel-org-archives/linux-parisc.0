Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 11B5D4829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 07:02:12 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 67B611FFBCA
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 15:02:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 857F31532F
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 13:01:56 +0000 (UTC)
Date: Sun, 1 Jun 2003 13:01:56 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.53.0306011256430.1237@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.5.70-pa4 no booting on 715/100
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

2.5.70-pa4, no modules

...
IPv6 over IPv4 tunneling driver
802.1Q VLAN Support v1.8 Ben Greear <greearb@candelatech.com>
All bugs added by David S. Miller <davem@redhat.com>
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 432k freed

Stack Dump:
 10034200:  0006ff0e 100336c0 102f3810 1035f810
 100341f0:  00000000 10155ea4 100826d4 10346960
 100341e0:  102a4010 15ef71dc faf00078 ffffffe0
 100341d0:  100336c0 0000003f 00000040 15faed48
 100341c0:  00000000 102b9000 102a4010 102a4010
 100341b0:  0900deee 1012f58c 00020002 15ff1000
 100341a0:  00020002 faf00078 00000001 00000003
 10034190:  00020002 15ff1000 00020002 00000000
 10034180:  15ffe754 40182000 40027094 40181300
 10034170:  40183338 101063e4 102b5020 faf010a8
 10034160:  100826d4 10346960 15ff826c ffffffea
 10034150:  100340d8 00000000 0000000e faf00078
 10034140:  00000001 40001ffb faf00140 10309810
 10034130:  10367920 1012fa94 00000000 00000001
 10034120:  00000003 100826d4 15ff1000 00000001
 10034110:  00000040 faf00348 faf00350 00000000
 10034100:  000272ae 00000001 100336c0 102b9000
 100340f0:  faf00348 4017f988 00000000 faf00fc0
 100340e0:  faf00000 00000001 faf00348 00000000
 100340d0:  00000000 00000000 00027456 00000001
 100340c0:  faf005c0 00000000 00000000 00000000
 100340b0:  00000000 1010afe8 00000000 00000000
 100340a0:  00000000 1028bd04 000001b0 000002bd
 10034090:  40000000 00000000 00000000 102b9000
 10034080:  100336c0 00000000 00000000 00000000
 10034070:  00000000 1010a088 00000000 00000000
 10034060:  00000000 00000000 00000000 00000000
 10034050:  00000000 00000000 00000000 00000000
 10034040:  00000000 00000000 00000000 00000000
 10034030:  00000000 00000000 00000000 00000000
 10034020:  00000000 00000000 00000000 00000000
 10034010:  00000001 00000000 00000000 102ba8e4

Kernel addresses on the stack:
 [<10155ea4>] dentry_open+0x12c/0x1b8
 [<1012f58c>] do_sigaction+0xe0/0x290
 [<101063e4>] handle_interruption+0x274/0x5b4
 [<1012fa94>] sys_rt_sigaction+0x7c/0xc4
 [<1010afe8>] syscall_exit+0x0/0x28
 [<1010a088>] intr_check_sig+0x0/0xc


Kernel Fault: Code=15 regs=10034200 (Addr=00027454)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001110 Not tainted
r00-03  00000000 102e5890 1012f58c 00027454
r04-07  00000000 0000000d 0000000e 15faed54
r08-11  100340c8 00027670 102b9000 00026e70
r12-15  00027670 00000000 100336c0 102b9000
r16-19  102a4010 102a4010 0900deee 102a4010
r20-23  00001000 00027457 000000e0 0000000c
r24-27  00000000 00000000 00027456 102a4010
r28-31  00027456 00000400 10034200 400614af
sr0-3   00000001 00000001 00000000 00000001
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1019f414 1019f418
 IIR: 0c601094    ISR: 00000000  IOR: 00027454
 CPU:        0   CR30: 10034000 CR31: 102e8000
 ORIG_R28: 00000001


-- 
Greetings

Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
