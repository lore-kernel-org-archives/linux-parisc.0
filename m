Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EC4A482D
	for <parisc-linux@parisc-linux.org>; Thu, 27 Dec 2001 09:12:11 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-15"
From: Helge Deller <helge.deller@sap.com>
To: James.Bottomley@hansenpartnership.com
Date: Thu, 27 Dec 2001 17:12:08 +0100
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Message-Id: <E16Jd8a-0000J5-00@linuxlab.wdf.sap-ag.de>
Subject: [parisc-linux] rmmod lasi700 hangs the machine
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

Hi James,

unloading the lasi700 scsi module hangs my PARISC-machine:

hw1306:/# uname -a
Linux hw1306 2.4.16-pa25 #2 Thu Dec 27 13:03:15 CET 2001 parisc unknown

hw1306:/# modprobe lasi700
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
scsi1: (2:0) Synchronous at offset 8, period 236ns
  Vendor: TOSHIBA   Model: CD-ROM XM-3601TA  Rev: 0725
  Type:   CD-ROM                             ANSI SCSI revision: 02

hw1306:/# lsmod
Module                  Size  Used by    
lasi700                 1996   0  (unused)
53c700                 28396   0  [lasi700]
....

hw1306:/# rmmod lasi700
<machine hangs and only responds to pings, no login possible>

The machine is a B180L with an integrated 53c875 (scsi0, compiled into kernel)
and one 53c700 (scsi1, lasi700, as module) with one external CD-ROM drive.

Any ideas ?

Thanks,
Helge
