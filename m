Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4BEE484C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 10:14:34 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 0E23F1FFEEC
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 18:14:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 6453422E13
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 17:12:21 +0000 (UTC)
Date: Fri, 15 Nov 2002 17:12:21 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.44.0211151707330.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] [2.5] next issues ...
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

2.5.47-pa3 up and running I added my vlan interface, ssh'ed to the
host and *buff*


--- 8< 8< ---
Stack Dump:
 14db4000:

Kernel addresses on the stack:


Kernel Fault: Code=15 regs=14db4000 (Addr=4c4c4c4c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 10290810 101b4134 4c4c0000
r04-07  4c4c4c4c 4c4c4c4d 14db7000 14db3e48
r08-11  00000001 00000000 00000000 40018000
r12-15  14db798c 14dac290 000e7760 faf00fdc
r16-19  000e7760 ffffffe8 00000004 0000000b
r20-23  0000000b 0000000f 00000000 00000001
r24-27  106fd160 00000000 150d7000 10274010
r28-31  00000000 000b7cc1 14db4000 101b3278
sr0-3   00000000 00000632 00000000 00000632
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101b40f0 101b40f4
 IIR: 0c821033    ISR: 00000000  IOR: 4c4c4c4c
 CPU:        0   CR30: 14dac000 CR31: 102a2000
 ORIG_R28: 00000000
--- 8< 8< ---



So I booted up again to have a look at System.map but....



--- 8< 8< ---
Checking root file system...
fsck 1.30-WIP (30-Sep-2002)
/dev/sda3 was not cleanly unmounted, check forced.
...
    | 84.5%   fsck.ext2(27): unaligned access to 0x0004feff at ip=0x000140af
fsck.ext2(27): unaligned access to 0x0004feff at ip=0x000140c3
Not-handled unaligned insn 0x27c11018
Unaligned handler failed, ret = -1
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
fsck.ext2(27): Unaligned data reference
fsck.ext2(27): unaligned access to 0x0004feff at ip=0x000140c3
Not-handled unaligned insn 0x27c11018
Unaligned handler failed, ret = -1
      _______________________________
...
--- 8< 8< ---

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
