Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DC0A483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 03:00:03 -0600 (MDT)
Message-ID: <3F76A312.8090603@tiscali.be>
Date: Sun, 28 Sep 2003 09:00:02 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] zalon/ncr53c720 (linux-2.6.0-test5-pa22) broken on C110
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

I read well the thread about the pb on K460 and so try to test it on my 
C110 model but is failed to boot:
2.6.0-test5-pa22
[...]
zalon_probe: Zalon vers field is 0x1, IRQ 
34                                   
ncr53c720-0: rev 0xf irq 
34                                                    
ncr53c720-0: ID 7, Fast-10, Parity Checking, 
Differential                      
ncr53c720-0: suspicious SCSI data while resetting the 
BUS.                     
ncr53c720-0: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o = 
0x3fdff000, expecting 0x100
ncr53c720-0: FATAL ERROR: CHECK SCSI BUS - CABLES, TERMINATION, DEVICE 
POWER etc!
ncr53c720-0: 
detaching...                                                      
53c700: Version 2.8 By 
James.Bottomley@HansenPartnership.com                   
scsi1: 53c710 rev 
2                                                            
scsi1 : LASI SCSI 
53c700                                                       
[...]
VFS: Cannot open root device "sda5" or unknown-block(2,0)
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on unknown-block(2,0)

I am sure there is no hw pb because after that test I can always reboot 
with 2.6.0-test5-PA6:
2.6.0-test5-pa6
[...]
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
ncr53c720-0: rev 0xf on pci bus 0 device 0 function 0 irq 34
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3b-20010512
Using anticipatory scheduling io scheduler
  Vendor: SEAGATE   Model: ST34371W          Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34371W          Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
st: Version 20030811, fixed bufsize 32768, s/g segs 256
ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 >
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sdb: drive cache: write back
 sdb: sdb1 sdb2 sdb3 sdb4 < sdb5 sdb6 sdb7 sdb8 sdb9 >
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 5, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 6, lun 0,  type 0
[...]

Can somebody could help me to find patches (step by step) applied on 
this driver from -pa6 to -pa22?

Thanks in advance,
    Joel
