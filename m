Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2EDD4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 12:28:03 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 07C791FFEC2
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 20:27:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id E1DCA22E1A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 19:27:31 +0000 (UTC)
Date: Sat, 9 Nov 2002 19:27:31 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.44.0211091923280.32930-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.5.46-pa7 boot prob
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

run it through ksymoops but got nothing usable. Only
stack dump was printed...

If you need more information please let me know.


Linux version 2.5.46-pa7 (bz@apollo) (gcc version 3.2) #3 Sat Nov 9 16:51:14 UTC 2002
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 000060b0 00000481 00000000 00000000 78356107 00000000 00000004 00000072 00000072
vers  0000000b
model 9000/715
Total Memory: 96 Mb
pagetable_init
On node 0 totalpages: 24576
  DMA zone: 24576 pages, LIFO batch:6
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=/dev/sda3 HOME=/ TERM=linux console=ttyS0 palo_kernel=3/boot/vmlinux-2.5.46-pa7
...
Serial: 8250/16550 driver $Revision: 1.90 $ IRQ sharing disabled
ttyS0 at MMIO 0xf0105800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xf0202800 (irq = 121) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071A_Z
STI word mode ROM at f0025000, hpa at f8000000
STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1280

Stack Dump:
 15fb07c0:  0004ff0f 00000000 00000000 00000000
 15fb07b0:  00000000 10141cc4 00000000 00000000
 15fb07a0:  00000000 10362010 00000066 102a7ce4
 15fb0790:  00000000 10061c00 10362010 10029c60
 15fb0780:  000000a0 00000000 00000000 00000000
 15fb0770:  00000000 101f0814 1010d2e4 00000000
 15fb0760:  00000000 00000000 00000188 00000000
 15fb0750:  00000000 10360810 1029e810 00000000
 15fb0740:  00000000 00000000 41000000 00000000
 15fb0730:  40800000 101bfb18 40000000 00000000
 15fb0720:  00008124 00000000 00000000 00000000
 15fb0710:  00000000 1029e940 00000000 00000000

Kernel addresses on the stack:
 [<10141cc4>]  [<101f0814>]  [<1010d2e4>]  [<101bfb18>]
 [<101bfc78>]  [<101bfb18>]  [<101c0068>]  [<101459cc>]
 [<10125878>]  [<10141f58>]  [<10142100>]  [<101ee63c>]
 [<101ee0c4>]  [<101459cc>]  [<101bfda4>]  [<101c4168>]
 [<10141f58>]  [<101ed0f8>]  [<10121d70>]  [<10144c7c>]
 [<10100198>]  [<10109c54>]

Kernel Fault: Code=26 regs=15fb07c0 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 00000000 101f0814 102a7ce4
r04-07  00000500 102a7ce4 00002000 10061c00
r08-11  10362010 10029c60 00000400 1029e940
r12-15  000000a0 00000140 00000040 00000000
r16-19  00005000 15fb04c8 15f4d000 00000013
r20-23  00000000 00000000 10029c60 00000001
r24-27  00000000 00080000 00000000 1027e010
r28-31  00000000 00000400 15fb07c0 101f4264
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101f4290 101f4294
 IIR: 0ea01085    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 15fb0000 CR31: 102b7000
 ORIG_R28: 00000000


-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
