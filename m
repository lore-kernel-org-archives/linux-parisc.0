Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zabbadoz.net (mail.zabbadoz.net [195.2.176.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B3B1482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Jul 2001 12:11:59 -0600 (MDT)
Received: from localhost (bz@localhost)
	by mail.zabbadoz.net (8.11.0/8.11.0) with ESMTP id f6RIBvd57081
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Jul 2001 20:11:57 +0200 (CEST)
Date: Fri, 27 Jul 2001 20:11:57 +0200 (CEST)
From: "Bjoern A. Zeeb" <bzeeb+hplinux@zabbadoz.net>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.BSF.4.30.0107272003070.822-100000@noc.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 715/100 0.9.1.iso
List-ID: <linux-parisc.vger.kernel.org>

Hi,

also had an 0.9.1 iso (from ESIEE ) around an tried that.
Doesn't boot either (when booting from cdrom).

If anybody needs further information please let me know.

Would it make any difference if I also try 0.9-32serial ?

--- snipp ---
Kernel Fault: Code=15 regs=102924c0 (Addr=00304008)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001110
r0-3     00000000 10337010 10102614 00304000
r4-7     003058d8 10256000 00000000 f0002848
r8-11    0000000d f0305698 00000030 00310000
r12-15   f0002840 00000000 00000000 f0305710
r16-19   10292080 00283bab 00000002 00000000
r20-23   00000000 f0105800 01c9c380 00000060
r24-27   00000001 00000001 1029f3c0 1028a010
r28-31   0000002a 00000000 10292700 00000000
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10102574 10102578
 IIR: 0c701093    ISR: 00000000  IOR: 00304008
 ORIG_R28: 00000000
--- snipp ---

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
