Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E355482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Nov 2002 13:32:55 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 7C6331FFEC7
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Nov 2002 21:32:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 62B0F22E1A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Nov 2002 20:34:11 +0000 (UTC)
Date: Sun, 24 Nov 2002 20:34:11 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.44.0211242029230.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.5.47-paX STI(?) null pointer deref
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

first I got that far:

--- 8< 8< 8< ---
....
STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071A_Z
STI word mode ROM at f0025000, hpa at f8000000
STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1280

Stack Dump:
 10034780:  0004ff0f 00000000 00000000 00000000
 10034770:  00000000 10143b28 00000000 00000000
 10034760:  00000000 00000000 80000000 00000000
 10034750:  102ac010 00000066 1036393c 00000000
 10034740:  102ac010 00000000 00000000 00000000
 10034730:  00000000 101f6aec 00000000 00000000
 10034720:  00000000 1036fea0 00000188 00000000
 10034710:  00000000 10360810 10360010 00000000
 10034700:  00000000 00000000 00000000 00000000
 100346f0:  00000000 101c531c 00000000 00000000
 100346e0:  00000000 00000000 00000000 00000000
 100346d0:  00000000 1036072c 00000000 00000000

Kernel addresses on the stack:
 [<10143b28>]  [<101f6aec>]  [<101c531c>]  [<101c5410>]
 [<101c531c>]  [<1010d2fc>]  [<101c5af8>]  [<1010d2fc>]
 [<10147928>]  [<101ace68>]  [<10143db8>]  [<10126c04>]
 [<10143f70>]  [<101f490c>]  [<101f4380>]  [<10147928>]
 [<101c55b4>]  [<101c9c84>]  [<10143db8>]  [<101f33c8>]
 [<101002b8>]  [<10109c54>]

Kernel Fault: Code=26 regs=10034780 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 00000400 1036393c 00002000
r04-07  00000066 1036393c 00000000 15f7cc00
r08-11  10367010 10029c60 000000a0 000000a0
r12-15  00000140 00000040 00005000 00000000
r16-19  10034488 15f45000 1036072c 00000000
r20-23  00000013 00000000 10029c60 00000000
r24-27  00000000 00000000 00000040 10288010
r28-31  00000500 00000400 10034780 101fa578
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101fa59c 101fa5a0
 IIR: 0ea01096    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 10034000 CR31: 102b2000
 ORIG_R28: 00000000
--- 8< 8< 8< ---



then I added some printk's to see where it actually happens and
I got that far:

--- 8< 8< 8< ---
...
STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
Stack Dump:
--- 8< 8< 8< ---

so I added some more printk's and got *suprise* that far:

--- 8< 8< 8< ---
...
STI GSC/PCI graphics driver version 0.9
Stack Dump:
--- 8< 8< 8< ---


How to debug this one ???


-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
