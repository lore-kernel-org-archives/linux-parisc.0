From: Helge Deller <helge.deller@sap.com>
Subject: [parisc-linux] lasi 53c700 problems
Date: Fri, 8 Oct 2004 15:01:24 +0200
Message-ID: <200410081501.24668.helge.deller@sap.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I saw just some problems with lasi53c700 on my B180L:
Linux version 2.6.9-rc2-pa13 (root@ls3530) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #1 Fri Oct 8 13:02:32 CEST 2004

Attached devive is an external 2x SCSI CD writer which worked in other kernels without problems.

Any idea ?
Helge


scsi0 : sym-2.1.18k
Using anticipatory io scheduler
  Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:5:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:5:0): Beginning Domain Validation
sym0:5: wide asynchronous.
sym0:5: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:5:0): Domain Validation skipping write tests
scsi(0:0:5:0): Ending Domain Validation
  Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:6:0): Beginning Domain Validation
sym0:6: wide asynchronous.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:6:0): Domain Validation skipping write tests
scsi(0:0:6:0): Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
scsi1 (4:0) New error handler wants to abort command
        scsi1 : destination target 4, lun 0
        command = 0x12 00 00 00 24 00
scsi1 (4:0) New error handler wants device reset
        scsi1 : destination target 4, lun 0
        command = 0x12 00 00 00 24 00
scsi1 (4:0) New error handler wants BUS reset, cmd 17c4cb60
        scsi1 : destination target 4, lun 0
        command = 0x12 00 00 00 24 00
scsi1: Bus Reset detected, executing command 17c4cb60, slot 00038520, dsp 07c78088[0088]
 failing command because of reset, slot 00038520, cmnd 17c4cb60
 1:0:4:0: Illegal state transition created->quiesce
Badness in scsi_device_set_state at drivers/scsi/scsi_lib.c:1688
Backtrace:
 [<10277360>] scsi_device_set_state+0xf0/0x164
 [<102773e8>] scsi_device_quiesce+0x14/0x64
 [<1027be84>] spi_dv_device+0x68/0x178
 [<1027bfac>] spi_dv_device_work_wrapper+0x18/0x38
 [<1013a8cc>] worker_thread+0x1ac/0x278
 [<1013f42c>] kthread+0xdc/0xe4
 [<1010ec5c>] ret_from_kernel_thread+0x1c/0x24

scsi1 (4:0) New error handler wants to abort command
        scsi1 : destination target 4, lun 0
        command = 0x00 00 00 00 00 00
scsi1: Bus Reset detected, executing command 17c4cb60, slot 00038520, dsp 07c78088[0088]
 failing command because of reset, slot 00038520, cmnd 17c4cb60
scsi1 (4:0) New error handler wants HOST reset
        scsi1 : destination target 4, lun 0
        command = 0x12 00 00 00 24 00
scsi1 (4:0) New error handler wants to abort command
        scsi1 : destination target 4, lun 0
        command = 0x00 00 00 00 00 00
scsi1: Bus Reset detected, executing command 17c4cb60, slot 00038520, dsp 07c78088[0088]
 failing command because of reset, slot 00038520, cmnd 17c4cb60
scsi: Device offlined - not ready after error recovery: host 1 channel 0 id 4 lun 0
st: Version 20040403, fixed bufsize 32768, s/g segs 256
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sdb: drive cache: write through
 sdb: sdb1 sdb2
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 5, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 6, lun 0,  type 0
ohci_hcd: 2004 Feb 02 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xffd08000 irq 69 @ parisc8:16:7
input: AT Raw Set 2 keyboard on parisc8:16:7
serio: GSC PS2 mouse port at 0xffd08100 irq 69 @ parisc8:16:8
input: PS/2 Logitech Mouse on parisc8:16:8
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
