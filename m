Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37A51482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Nov 2002 09:39:48 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18GMGt-0003Pi-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Nov 2002 17:39:43 +0100
Date: Mon, 25 Nov 2002 17:39:41 +0100
Message-ID: <3DA3C88900004E55@ocpmta3.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] 2.4.20-rc1-pa7 boot problem
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

Hi all,

Starting to investigate squid problem (having tree different behaviour between
my install), I try to boot my sarge b180 with my test k-2.4.20-rc1-pa7 (booting
well my b2k) but it failled with following messages:
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: 53c875 detected 
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 99
sym53c875-0: ID 7, Fast-20, Parity Checking
scsi0 : sym53c8xx-1.7.3c-20010512
blk: queue 1003d774, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: IBM       Model: DDRS-39130WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
blk: queue 1003d874, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: IBM       Model: DDRS-39130WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
blk: queue 1003d974, I/O limit 4095Mb (mask 0xffffffff)
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
sym53c875-0-<5,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
Partition check:
 sda:scsi : aborting command due to timeout : pid 38, scsi0, channel 0, id
5, lun 0 0x28 00 00 00 00 00 00 00 08 00 
sym53c8xx_abort: pid=38 serial_number=39 serial_number_at_timeout=39

Any idea.

Thanks in advance,
    Joel

PS: I used sym1 as scsi device driver

********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be
