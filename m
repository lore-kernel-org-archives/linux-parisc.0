Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id B721D482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Feb 2002 10:38:53 -0700 (MST)
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: James.Bottomley@HansenPartnership.com
Date: Sun, 3 Feb 2002 18:29:12 +0100
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Message-Id: <200202031829.12429.deller@gmx.de>
Subject: [parisc-linux] 53c700 (LASI SCSI 53c700) hang
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

today my 715/64 completely stopped after some "dpkg -i"-ing.
According to the following lines from the serial console the new
SCSI driver stopped talking to my harddisk.
I'm sending this bug report now, after that this has happened 
~3 times in the last 2 months.
Any ideas ?

TIA,
Helge

This is what I got on my serial console. Sadly some things before it
are missing:

scsi0 (6:0) New error handler wants to abort command                                                         
        0x00 00 00 00 00 00                                                                                  
scsi: device set offline - not ready or command retry failed after bus reset: 
host 0 channel 0 id 6 lun 0    
scsi0 (6:0) New error handler wants to abort command                                                         
        0x00 00 00 00 00 00                                                                                  
scsi: device set offline - not ready or command retry failed after bus reset: 
host 0 channel 0 id 6 lun 0    
scsi0 (6:0) New error handler wants to abort command                                                         
        0x00 00 00 00 00 00                                                                                  
scsi: device set offline - not ready or command retry failed after bus reset: 
host 0 channel 0 id 6 lun 0


from the dmesg:
SCSI subsystem driver Revision: 1.00
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2                                         
scsi0 : LASI SCSI 53c700
scsi0: (6:0) Synchronous at offset 8, period 100ns
  Vendor: QUANTUM   Model: FIREBALL_TM3200S  Rev: 300X
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0            
scsi0: (6:0) Enabling Tag Command Queuing              
SCSI device sda: 6281856 512-byte hdwr sectors (3216 MB)
Partition check:                                        
 sda: sda1 sda2 sda3 sda4
