Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id 98AF7482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Apr 2001 00:52:58 -0600 (MDT)
Received: from rbrad by beavis.ybsoft.com with local (Exim 3.20 #1 (Debian))
	id 14oJvQ-0002QQ-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Apr 2001 00:52:52 -0600
Date: Sat, 14 Apr 2001 00:52:52 -0600
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010414005252.A9322@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: Ryan Bradetich <rbrad@beavis.ybsoft.com>
Subject: [parisc-linux] kernel panic using cpio from cdrom to disk.
List-ID: <linux-parisc.vger.kernel.org>

Hello parisc-linux hackers,

A bug (#105) was discovered today reguarding cpio'ing an iso image from
the cdrom to the disk.  This was a stupid error and I have a quick patch
for this.  But this leads to my next question....  I am getting a kernel
panic when perfoming the cpio from the cdrom to the disk.  I am trying
to verify if their in another problem with the ccio code, or if this is
a problem witht the scsi driver itself.  Can someone else try it on a
non-ccio machine and see if fails for them also.  [Note:  The cdrom
content should not matter, in this case I have an i386 debian disk I 
was cpio'ing over because it was handy.]

Disk to disk transfers seem to work fine under ccio...

Thanks,

- Ryan


vega:/tmp# mount /dev/sr0 /cdrom
ISO 9660 Extensions: RRIP_1991A
vega:/tmp# find /cdrom | cpio -pm /tmp   
scsi1: Unexpected Illegal Instruction, script[0002]
scsi1: script[fffffffe]: 00000000 00000000 60000200 00000000 7c1bef00 00000000 41040000 00182448
scsi1: Failed to handle interrupt.  Failing commands and resetting SCSI bus and chip
scsi1: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00
scsi1: dsp = 00182008 (script[0x0802]), dsps = 7b255263, target = 0
scsi1: Failing command for ID2



Dumping Stack from 1027e000 to 1027e2c0:
e000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e020 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e040 00000000 00000000 00000000 0028a000 00000000 00000000 00000000 00000000
e060 00000000 00000000 00000000 0010c830 00000000 00000000 00000000 00000000
e080 00000008 fffb1000 0010c830 00008000 00291000 00282000 0010c8a8 00105024
e0a0 00282000 00008000 fffa0000 e0000000 20530a40 0000006c 00000002 0000001f
e0c0 20530a40 102fc010 1012a4a0 ffd05800 00000060 00000000 00000000 00000060
e0e0 0027e548 00000003 ffd05800 f0102400 00000000 ffd05800 1027e2c0 00000007
e100 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e120 00000001 fe4917e0 00000002 1014aee0 ef56b2f6 f9bf8075 dedbd0be f309b5b9
e140 10fec000 3fc900c0 102dc000 00000000 10290064 102f9010 102fc010 10276010
e160 102f8810 00000001 10294010 1013948c 102f8810 102d9d08 102d9d08 102d9c80
e180 3fc99000 1029060c 00000000 00000002 00000000 102a46c0 0004000e 0000004d
e1a0 102f9010 3fc99000 1029060c 1014adc4 cccccccd 00000030 00000000 cccccccd
e1c0 00000001 00000004 3fe00000 00000000 412e8480 00000000 3fc9d140 0000004d
e1e0 ffffff05 102fc010 00000001 101395f4 3fccf400 1028ecc8 00000000 00000000
e200 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e220 00000000 00000000 0010c754 0010c758 ffffffff 00000000 00000000 00000000
e240 00000000 00000008 081a025c 10240041 4c130d44 00000000 00000000 00000000
e260 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e280 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e2a0 00000000 00000000 00000000 10106744 00000000 00000000 00000000 00000000

Unexpected Interruption!: Code=0 regs=1027e080 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000000000000000000001000
r0-3     00000000 fffb1000 0010c830 00008000
r4-7     00291000 00282000 0010c8a8 00105024
r8-11    00282000 00008000 fffa0000 e0000000
r12-15   20530a40 0000006c 00000002 0000001f
r16-19   20530a40 102fc010 1012a4a0 ffd05800
r20-23   00000060 00000000 00000000 00000060
r24-27   0027e548 00000003 ffd05800 f0102400
r28-31   00000000 ffd05800 1027e2c0 00000007
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 0010c754 0010c758
 IIR: 081a025c    ISR: 10240041  IOR: 4c130d44
ORIG_R28: 00000000


-- 
