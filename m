Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id A9622482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Feb 2002 11:36:00 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: James.Bottomley@HansenPartnership.com
Date: Sun, 3 Feb 2002 19:29:48 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <200202031829.12429.deller@gmx.de>
In-Reply-To: <200202031829.12429.deller@gmx.de>
MIME-Version: 1.0
Message-Id: <200202031929.48891.deller@gmx.de>
Subject: [parisc-linux] Re: 53c700 (LASI SCSI 53c700) hang
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

it just happened again while shutting down the system - thus
now I have a little more verbose output:

Unmounting remote filesystems... scsi0 (6:0) New error handler wants to abort 
command                        
        0x2a 00 00 14 0e 5c 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 14 0e cc 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 18 0e 1c 00 00 10 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 18 0e a4 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 2c 0e 54 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 30 0e 2c 00 00 10 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 30 0e 4c 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 30 0f ac 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 30 10 2c 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 30 10 5c 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 30 10 84 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 08 0d fc 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 10 0e 1c 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 10 0e 44 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants to abort command                                                         
        0x2a 00 00 10 0e 54 00 00 10 00                                                                      
scsi0 (6:0) New error handler wants device reset                                                             
        0x2a 00 00 14 0e 5c 00 00 08 00                                                                      
scsi0 (6:0) New error handler wants BUS reset, cmd 10040c00                                                  
        0x2a 00 00 14 0e 5c 00 00 08 00                                                                      
scsi0: Bus Reset detected, executing command 00000000, slot 00000000, dsp 
000504a8[04a8]                     
 failing command because of reset, slot 00010520, cmnd 10040400                                              
 failing command because of reset, slot 00010654, cmnd 10040200                                              
 failing command because of reset, slot 00010788, cmnd 10040600                                              
 failing command because of reset, slot 000108bc, cmnd 10041e00                                              
 failing command because of reset, slot 000109f0, cmnd 10041200                                              
 failing command because of reset, slot 00010b24, cmnd 10041c00                                              
 failing command because of reset, slot 00010c58, cmnd 10040800                                              
 failing command because of reset, slot 00010ec0, cmnd 10040a00                                              
 failing command because of reset, slot 00010ff4, cmnd 10041400                                              
 failing command because of reset, slot 00011128, cmnd 10040c00                                              
 failing command because of reset, slot 0001125c, cmnd 10041000                                              
 failing command because of reset, slot 00011390, cmnd 10040000                                              
 failing command because of reset, slot 000114c4, cmnd 10041600                                              
 failing command because of reset, slot 000115f8, cmnd 10041800                                              
 failing command because of reset, slot 0001172c, cmnd 10041a00                                              
scsi0: (6:0) Synchronous at offset 8, period 100ns                                                           
scsi0 (6:0) New error handler wants to abort command                                                         
        0x03 00 00 00 40 00                                                                                  
scsi: device set offline - not ready or command retry failed after bus reset: 
host 0 channel 0 id 6 lun 0    


Helge



On Sunday 03 February 2002 18:29, Helge Deller wrote:
> Hi James,
>
> today my 715/64 completely stopped after some "dpkg -i"-ing.
> According to the following lines from the serial console the new
> SCSI driver stopped talking to my harddisk.
> I'm sending this bug report now, after that this has happened
> ~3 times in the last 2 months.
> Any ideas ?
>
> TIA,
> Helge
>
> This is what I got on my serial console. Sadly some things before it
> are missing:
>
> scsi0 (6:0) New error handler wants to abort command
>         0x00 00 00 00 00 00
> scsi: device set offline - not ready or command retry failed after bus
> reset: host 0 channel 0 id 6 lun 0
> scsi0 (6:0) New error handler wants to abort command
>         0x00 00 00 00 00 00
> scsi: device set offline - not ready or command retry failed after bus
> reset: host 0 channel 0 id 6 lun 0
> scsi0 (6:0) New error handler wants to abort command
>         0x00 00 00 00 00 00
> scsi: device set offline - not ready or command retry failed after bus
> reset: host 0 channel 0 id 6 lun 0
>
>
> from the dmesg:
> SCSI subsystem driver Revision: 1.00
> 53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
> scsi0: 53c710 rev 2
> scsi0 : LASI SCSI 53c700
> scsi0: (6:0) Synchronous at offset 8, period 100ns
>   Vendor: QUANTUM   Model: FIREBALL_TM3200S  Rev: 300X
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
> scsi0: (6:0) Enabling Tag Command Queuing
> SCSI device sda: 6281856 512-byte hdwr sectors (3216 MB)
> Partition check:
>  sda: sda1 sda2 sda3 sda4
