Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp4ve.mailsrvcs.net (smtp4vepub.gte.net [206.46.170.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CC27482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 00:22:19 -0600 (MDT)
Received: from neuronet.pitt.edu (client-151-201-23-51.pittpa.adsl.bellatlantic.net [151.201.23.51])
	by smtp4ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id GAA52868072
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 06:22:17 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3B4BF099.704C7B92@neuronet.pitt.edu>
Date: Wed, 11 Jul 2001 02:22:17 -0400
From: Rafael Herrera <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: PL <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] palinux-0.9.2.iso installs on 715/75, crash fallows.
List-ID: <linux-parisc.vger.kernel.org>

After successfully installing the base system and booting 
from disk the system started to generate these messages 
intermittently:

ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

After the first boot, the program 'base-config' was started, 
after answering a few questions, the program 'tasksel' was 
executed. My selections resulted in downloads of about 100 
packages (getting the messages above once i a while). Towards 
the end I got an scsi error:

scsi0: Serious error, sstat0 = 04
scsi0: Chip register contents:
 (script[0] at virt 10050000, bus 50000)
 00  sien:  af  sdid:  40  scntl1:20  scntl0:d4
 04  socl:  06  sodl:  67  sxfer: 00  scid:  80
 08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
 0C  sstat2:0e  sstat1:20  sstat0:00  dstat: 00
 10
 14  ctest3:df  ctest2:31  ctest1:03  ctest0:00
 18  ctest7:00  ctest6:28  ctest5:00  ctest4:00
 1C  temp:  00000000
 20              ctest8:ff  istat: 06  dfifo: 04
 24  dbc:   0e000006  dnad:  00056cde  dsp:   00056038
 30  dsps:  00056cde
 34  dmode: 80
 38  dcntl: 80  dwt:   00  dien:  1d
 3C
scsi0: Unexpected stacked interrupt, istat 06, sstat0 08, dstat 00
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00056038 (script[0x180e]), dsps = 00056cde, target = 0
scsi0: Failing command for ID6
scsi0: Unable to send Bus Device Reset for target 6
scsi0: Unable to do SCSI bus reset
sscsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
SCSI disk error : host 0 channel 0 id 6 lun 0 return code = 2
 I/O error: dev 08:03, sector 1456912
 I/O error: dev 08:03, sector 1456920
 I/O error: dev 08:03, sector 1457160
 I/O error: dev 08:03, sector 1457408
 I/O error: dev 08:03, sector 1457656
 I/O error: dev 08:03, sector 1457904
 I/O error: dev 08:03, sector 1458152
 I/O error: dev 08:03, sector 1458400
 I/O error: dev 08:03, sector 1458648
 I/O error: dev 08:03, sector 1458896
 I/O error: dev 08:03, sector 1459144

At this point the machine crashed, I saved the ouput of sysrq tm and p, if 
anyone is interested.

--
     Rafael
