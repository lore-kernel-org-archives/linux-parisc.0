Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA23376
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 16:20:42 -0700
Received: from zaphod.halden.lillfab.se (t1o70p60.telia.com [62.20.148.60])
	by mailg.telia.com (8.9.3/8.9.3) with ESMTP id AAA00655
	for <parisc-linux@thepuffingroup.com>; Thu, 7 Dec 2000 00:23:04 +0100 (CET)
Received: from localhost (danne@localhost)
	by zaphod.halden.lillfab.se (8.9.3/8.9.3) with ESMTP id AAA29108
	for <parisc-linux@thepuffingroup.com>; Thu, 7 Dec 2000 00:23:00 +0100
Date: Thu, 7 Dec 2000 00:23:00 +0100 (CET)
From: Daniel Engstrom <danne@telia.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0012070011280.8673-100000@zaphod.halden.lillfab.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Subject: [parisc-linux] SCSI on ASP systems
List-ID: <linux-parisc.vger.kernel.org>

As noted earlier SCSI (sim700) don not work on systems with an ASP. Below
is some of the error messages I get. It seems to fail on the first write
command (read commands seem to work). I dont have any idea how the 53c700
is supposed to work and I cant find any docs on the net. Does anyone on
the list have any idea?

/Daniel


# palo -I \
> -b boot/iplboot \
> -k boot/vmlinux /dev/sda
palo version 0.8 bame@noam Tue Oct 31 14:18:23 MST 2000
F0 partition start sector 62 length 36766
check_bootloader 181
ipl: addr 32768 size 24576 entry 0x0 ko 0 ksz 0 rdo 0 rdsz 0
<ˆ..>
scsi0: Phase mismatch, phase MSGIN (7) at script[0x31b]
Write (10) 00 00 00 03 c0 00 00 80 00
scsi0: DOUT sg 117, old 02ac4c00/00000400, new 02ac4e00/00000200 (32)
scsi0: Serious error, sstat0 = 04
scsi0: Chip register contents:
 (script[0] at virt c2fa0000, bus 2fa0000)
 00  sien:  af  sdid:  20  scntl1:20  scntl0:d4
 04  socl:  06  sodl:  00  sxfer: 00  scid:  80
 08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
 0C  sstat2:06  sstat1:00  sstat0:00  dstat: 00
 10
 14  ctest3:21  ctest2:35  ctest1:0b  ctest0:00
 18  ctest7:00  ctest6:99  ctest5:00  ctest4:00
 1C  temp:  00000000
 20              ctest8:ff  istat: 06  dfifo: 00
 24  dbc:   0e000001  dnad:  02fa5cde  dsp:   02fa5038
 30  dsps:  02fa5cde
 34  dmode: 80
 38  dcntl: 80  dwt:   00  dien:  1d
 3C
scsi0: Unexpected stacked interrupt, istat 06, sstat0 08, dstat 00             p
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI bus and
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 02fa5038 (script[0x140e]), dsps = 02fa5cde, target = 0
scsi0: Failing command for ID5
scsi0: sim700_intr_handle() called with no interrupt
scsi0: Negotiating async transfers for ID 5
scsi0: Response to host SDTR = 00 00
scsi0: Phase mismatch, phase STATUSIN (3) at script[0x22d]
Request Sense 00 00 00 ff 00
scsi0: DIN sg 127, old 02fa8a00/00000100, new 02fa8a12/000000ee (0)
scsi0: Phase mismatch, phase MSGIN (7) at script[0x321]
Write (10) 00 00 00 08 40 00 00 80 00
scsi0: DOUT sg 120, old 029a0800/00000400, new 029a0a00/00000200 (32)
SCSI disk error : host 0 channel 0 id 5 lun 0 return code = 10
 I/O error: dev 08:00, sector 2112
