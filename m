Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA20177
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 18:07:31 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 23 Sep 2000 00:08:12 -0000
Received: from dhd by tarwebok with local (Exim 3.12 #1 (Debian))
	id 13ccrf-0003Xy-00
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Sep 2000 20:08:23 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 22 Sep 2000 20:08:20 -0400
Message-ID: <87og1gm0ln.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Big bad SCSI errors building GCC with / on SCSI
List-ID: <linux-parisc.vger.kernel.org>

Hi,

When trying to build GCC on a SCSI disk (with a root filesystem on
SCSI) I get a lot of horrible looking errors and the build fails.

Building GCC on a SCSI disk with root filesystem on NFS doesn't seem
to cause problems.

Note that building smaller things doesn't seem to trigger this.
Binutils for instance managed to squeak through though I got a few
'resetting SCSI bus and chip' messages.

One thing I should point out is that I didn't power cycle my A180 when
it crashed, I just soft-rebooted.  So I will try to provoke these
problems and then power cycle to see if they are cured by that.

My boot messages show (excuse the bad formatting, ^%@#%^#$^%$#Y&^
minicom can't cut and paste properly from xterm)

sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 534
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0: sim700_intr_handle() called with no interrupt
scsi0 : LASI/Simple 53c7xx
scsi : 1 host.
Vendor: SEAGATE   Model: ST34573N
Rev: HP05
Type:   Direct-Access
ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
Vendor: SEAGATE   Model: ST34573N
Rev: HP05
Type:   Direct-Access
ANSI SCSI revision: 02
Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
scsi : detected 2 SCSI disks total.
SCSI device sda: hdwr sector= 512 bytes. Sectors= 8388314 [4095 MB] [4.1 GB]
Partition check:
sda: sda1 sda2
SCSI device sdb: hdwr sector= 512 bytes. Sectors= 8388314 [4095 MB] [4.1 GB]
Partition check:
sdb: sdb1 sdb2

Errors look like:

scsi0: Unexpected stacked interrupt, istat 0a, sstat0 30, dstat 00
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI bus and chip
scsi0: istat = 0a, sstat0 = 20, sstat1 = 00, dstat = 00
scsi0: dsp = 07f4d3d0 (script[0x14f4]), dsps = ab93001b, target = 0
scsi0: Failing command for ID5
scsi0: Failing command for ID6
scsi0: sim700_intr_handle() called with no interrupt
scsi0: Unexpected stacked interrupt, istat 0a, sstat0 20, dstat 00
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI bus and chip
scsi0: istat = 0a, sstat0 = 20, sstat1 = 01, dstat = 00
scsi0: dsp = 07f4d150 (script[0x1454]), dsps = ab93000c, target = 0
scsi0: Failing command for ID5
scsi0: sim700_intr_handle() called with no interrupt
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<                                     
scsi0: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00                         
scsi0: dsp = 07f4f438 (script[0x1d0e]), dsps = 07f4f448, target = 0             
scsi0: sim700_intr_handle() called with no interrupt                            
SCSI disk error : host 0 channel 0 id 5 lun 0 return code = 2                    
I/O error: dev 08:02, sector 139408                                             
I/O error: dev 08:02, sector 139416                                             
I/O error: dev 08:02, sector 139520                                             
I/O error: dev 08:02, sector 139768                                             
I/O error: dev 08:02, sector 140016                                             
I/O error: dev 08:02, sector 786768                                             
I/O error: dev 08:02, sector 888512
(etc)

Then the disk becomes basically unusable, I push TOC, I lose lots of
files, my blood pressure raises 30 points, I yell obscenities, etc.

This happens on both disks on the A180.  When it's my root filesystem
(/dev/sdb2) then it's really bad because the machine becomes totally
screwed (I still have a shell prompt but can't run any programs at
all).

The chart of success/failure in building/bootstrapping GCC looks like
this with kernel 2.4:

root NFS, build NFS:            'rpc_execute called for sleeping task!!',
                                over and over, total death (machine
                                continues to respond to pings, terminal
                                driver functions, all processes are
                                terminally wedged though)

root NFS, build /dev/sda2:      same NFS problem but it takes longer to
                                manifest itself.

root /dev/sdb2, build /dev/sda2: semi-horrible SCSI problems, but the
                                machine remains usable since /dev/sdb
                                is still basically functional

root /dev/sdb2, build /dev/sdb2: SCSI problems halfway through building
                                GCC backend, machine rendered unusable,
                                many files lost, filesystem corruption.

In order to build GCC at all I need to use linux 2.3.99pre8 with root
on NFS and build on SCSI.  And then I get unrelated crashes (probably
due to some bugs I've fixed in the 2.4 branch).

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
