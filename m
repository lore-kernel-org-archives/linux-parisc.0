Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA18201
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 19:40:14 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 559D331B
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 18:43:24 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id SAA23429
	for parisc-linux@thepuffingroup.com; Wed, 27 Dec 2000 18:44:41 -0800 (PST)
Date: Wed, 27 Dec 2000 18:44:41 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200012280244.SAA23429@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] DPF (code 15) in scsi on A500
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I was trying to setup a root disk on the A500 based on the v0.5 CD.
My A500 has crashed three times with this symptom.
Twice with DELAYED_RESOURCE_CNT defined in SBA and once without.
In case it matters, I'm using "modprobe sym53c8xx" to load the scsi drivers.

Here is data from the second crash:

# fdisk /dev/sda
...
   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1      1025   1049584   82  Linux swap
/dev/sda2          1026      1046     21504   f0  Unknown
/dev/sda3          1047      5143   4195328   83  Linux
/dev/sda4          5144      8682   3623936   83  Linux

Command (m for help): q

gggA500:~# dd if=/palinux-0.5.iso of=/dev/sdb bs=32k
5633+1 records in
5633+1 records out
gggA500:~# mke2fs /dev/sda3
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
...
# mount /dev/sda3 /mnt
# mount /dev/sdb /cdrom
# cd /cdrom
# find . | cpio -pdum /mnt/

Dumping Stack from 00000000c8100000 to 00000000c8101dc0:

...
1cc0 00000000 00000000 00000000 00000000 00000000 c01e854c 00000000 c01e8550
1ce0 00000000 cfd5b800 00000000 00000000 00000000 c01aa5e8 00000000 cf386600
1d00 00000000 00000000 00000000 0002d1a4 00000000 00000230 00000000 00010230
1d20 00000000 0000003f 00000000 52820020 00000000 3010303b 00000000 31005262
1d40 00000000 cfd5b800 00000000 00000000 00000000 cf386600 00000000 cf386600
1d60 00000000 c02d8770 00000000 00000002 00000000 c01dff7c 00000000 c0281eb0
1d80 00000000 cfd5b800 00000000 00000000 00000000 cfd53680 00000000 cf28b800
1da0 00000000 c02d8770 00000000 0800000b 00000000 c0104b60 00000000 cf3e8000

Bad Address (null pointer deref?): Code=15 regs=00000000c8101a80 (Addr=31005262)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001001111111100001011                                           
r0-3     0000000000000000 00000000c02e0f70 00000000c01e855c 00000000cf2870f8
r4-7     00000000c02d8770 00000000c7bd7180 00000000cf287000 0000000000000004
r8-11    0000000000000000 0000000000000001 0000000000000001 0000000000000001
r12-15   0000000000000001 000000000000c7a8 00000000000007a8 000000000002971c
r16-19   00000000c8100f40 00000000c7cfcbc0 0000000000000000 0000000000000004
r20-23   3030303b31005252 0000000000001038 00000000c7bd7180 000000000000001e
r24-27   00000000c03327b0 0000000000000001 00000000c7bd7180 00000000c02d8770
r28-31   0000000000000000 00000000c8101a70 00000000c8101dc0 00000000000001a8
sr0-3    0000000000000380 0000000000000380 0000000000000000 0000000000000000
sr4-7    0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000c01e854c 00000000c01e8550
 IIR: 52820020    ISR: 000000003010303b  IOR: 0000000031005262

IOAQ 0xc01e854c __scsi_end_request+bc
GR02 0xc01e855c __scsi_end_request+cc

Some kernel addresses off the stack:
0xc0104b60 tlb_fault+250
0xc02d8770 __gp+0
0xc0281eb0 cpu_irq_region+0
0xc01dff7c scsi_dispatch_cmd+28c
0xc01aa5e8 blkdev_release_request+50
0xc01e8550 __scsi_end_request+c0
0xc01e854c __scsi_end_request+bc

Code around the offending instruction is:
    c01e8538:   46 d3 00 20     ldh 10(r22),r19
    c01e853c:   52 d4 00 d0     ldd 68(r22),r20
    c01e8540:   d2 73 1a c9     extrw,u r19,22,23,r19
    c01e8544:   0a 67 04 33     sub r7,r19,r19
    c01e8548:   da 67 0f e0     extrd,s r19,63,32,r7
    c01e854c:   52 82 00 20     ldd 10(r20),rp		<- DPF here
    c01e8550:   52 9b 00 30     ldd 18(r20),dp
    c01e8554:   e8 40 f0 00     call (rp)
    c01e8558:   08 00 02 40     nop

c01e854c:   52 82 00 20     ldd 10(r20),rp

and r20 pretty clearly has garbage in it.

On the third crash, r20 contained 35e199f72318db9d and the
kernel adresses on the stack looked similar (ie tlb_fault was
the first kernel address).

I didn't save r20 or other output from the first crash.

I've saved the 2cd crash's console_out/vmlinux/System.map in case someone
else dares look more at this.

grant
