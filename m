Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtppop3pub.verizon.net (smtppop3pub.gte.net [206.46.170.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79BD7482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 20:13:25 -0700 (MST)
Received: from verizon.net (pool-151-201-37-152.pitt.east.verizon.net [151.201.37.152])
	by smtppop3pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id VAA51315175
	Fri, 9 Nov 2001 21:13:03 -0600 (CST)
Message-ID: <3BEC9B8B.8060408@verizon.net>
Date: Fri, 09 Nov 2001 22:14:19 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] SCSI errors after installing 0.9.2 on a 715/75
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

Hello,

I'm trying again to get a working system on this 715/75. Installation of 
the base system using the 0.9.2 CD went well.

I was performing an "apt-get upgrade" and got this erro messages:


# apt-get upgrade
Reading Package Lists... Done
Building Dependency Tree... Done
The following packages have been kept back
   bsdutils dpkg gzip ipchains logrotate mount nano net-tools ppp procps
   sysvinit util-linux
63 packages upgraded, 0 newly installed, 0 to remove and 12  not upgraded.
Need to get 1536kB/18.1MB of archives. After unpacking 270kB will be freed.
Do you want to continue? [Y/n] y
Get:1 ftp://ftp.us.debian.org unstable/main console-tools 1:0.2.3-23.2 
[262kB]
Get:2 ftp://ftp.us.debian.org unstable/main modutils 2.4.10-4 [249kB] 

Get:3 ftp://ftp.us.debian.org unstable/main apt-utils 0.5.4 [210kB] 

Get:4 ftp://ftp.us.debian.org unstable/main tasksel 1.11 [33.2kB] 

Get:5 ftp://ftp.us.debian.org unstable/main base-config 1.29 [114kB] 

Get:6 ftp://ftp.us.debian.org unstable/main dhcp-client 2.0pl5-6.1 
[194kB]
Get:7 ftp://ftp.us.debian.org unstable/main fdutils 5.3-3.3 [359kB] 

Get:8 ftp://ftp.us.debian.org unstable/main modconf 0.2.37 [114kB] 

Fetched 1536kB in 31s (48.7kB/s) 

scsi0: Serious error, sstat0 = 04
scsi0: Chip register contents:
  (script[0] at virt 10050000, bus 50000)
  00  sien:  af  sdid:  40  scntl1:20  scntl0:d4
  04  socl:  06  sodl:  c9  sxfer: 00  scid:  80
  08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
  0C  sstat2:0e  sstat1:20  sstat0:00  dstat: 00
  10
  14  ctest3:df  ctest2:31  ctest1:03  ctest0:00
  18  ctest7:00  ctest6:eb  ctest5:00  ctest4:00
  1C  temp:  00000000
  20              ctest8:ff  istat: 06  dfifo: 04
  24  dbc:   0e000006  dnad:  00056cde  dsp:   00056038
  30  dsps:  00056cde
  34  dmode: 80
  38  dcntl: 80  dwt:   00  dien:  1d
  3C
scsi0: Unexpected stacked interrupt, istat 06, sstat0 08, dstat 00
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI 
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00056038 (script[0x180e]), dsps = 00056cde, target = 0
scsi0: Failing command for ID6
scsi0: Unable to send Bus Device Reset for target 6
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
SCSI disk error : host 0 channel 0 id 6 lun 0 return code = 2
  I/O error: dev 08:03, sector 1450072
  I/O error: dev 08:03, sector 1450080
  I/O error: dev 08:03, sector 16
  I/O error: dev 08:03, sector 25200
  I/O error: dev 08:03, sector 1048608
  I/O error: dev 08:03, sector 1059400
  I/O error: dev 08:03, sector 1311040
  I/O error: dev 08:03, sector 1324576
  I/O error: dev 08:03, sector 1450320
  I/O error: dev 08:03, sector 1450568
  I/O error: dev 08:03, sector 1450816
  I/O error: dev 08:03, sector 1451064
  I/O error: dev 08:03, sector 1451312 

  I/O error: dev 08:03, sector 1451560 

  I/O error: dev 08:03, sector 1451808 

 

 
         Is there a newer kernel image I can use that has a more stable 
SCSI? If so where can I retrieve it and how to replace the one installed 
from the CD in the hard drive.

Thanks.
-- 
      Rafael
