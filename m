From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] k-2.6.10-rc1-pa3 & c110: high data rate => Kernel
	panic - ...
Date: Sat, 30 Oct 2004 19:58:40 +0000
Message-ID: <4183F270.30705@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@parisc-linux.org
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

Hello James,

The serial console pb being fixed, I can now boot again my c110 with recent 2.6.10-rc1-pa3 :)

I do first a 'apt-get dist-upgrade' of the chroot disk which use lasi & 53c700 new driver and I unfortunately encounter numerous 
messages (error/warning?):

Oct 30 19:57:33 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
Oct 30 19:57:33 hpalin kernel: scsi1: Bus Reset detected, executing command 2d22a360, slot 2fd6064c, dsp 001d81e8[01e8]
Oct 30 19:57:33 hpalin kernel:  failing command because of reset, slot 2fd6064c, cmnd 2d22a360
Oct 30 20:03:53 hpalin kernel: scsi1: (3:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
Oct 30 20:03:53 hpalin kernel:          len = 10, cmd =scsi1 : destination target 3, lun 0
Oct 30 20:03:53 hpalin kernel:         command = 0x2a 00 00 0c 09 98 00 04 00 00
Oct 30 20:03:53 hpalin kernel: scsi1: Bus Reset detected, executing command 2d22a8e0, slot 2fd608a4, dsp 001d8210[0210]
Oct 30 20:03:53 hpalin kernel:  failing command because of reset, slot 2fd60520, cmnd 2d22ae60
Oct 30 20:03:53 hpalin kernel:  failing command because of reset, slot 2fd6064c, cmnd 2d22a780
Oct 30 20:03:53 hpalin kernel:  failing command because of reset, slot 2fd60778, cmnd 2fd14b60
Oct 30 20:03:53 hpalin kernel:  failing command because of reset, slot 2fd608a4, cmnd 2d22a8e0
Oct 30 20:03:53 hpalin kernel: Incorrect number of segments after building list
Oct 30 20:03:53 hpalin kernel: counted 7, received 6
Oct 30 20:03:53 hpalin kernel: req nr_sec 544, cur_nr_sec 8
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17105
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17106
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17107
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17108
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17109
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17110
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17111
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17112
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17113
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:03:53 hpalin kernel: Buffer I/O error on device sdc5, logical block 17114
Oct 30 20:03:53 hpalin kernel: lost page write due to I/O error on sdc5
Oct 30 20:05:17 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
Oct 30 20:05:17 hpalin kernel: scsi1: Bus Reset detected, executing command 2fd14740, slot 2fd6064c, dsp 001d81e8[01e8]
Oct 30 20:05:17 hpalin kernel:  failing command because of reset, slot 2fd6064c, cmnd 2fd14740
Oct 30 20:07:34 hpalin kernel: end_request: I/O error, dev sdc, sector 4139844
Oct 30 20:07:34 hpalin kernel: printk: 58 messages suppressed.
Oct 30 20:07:34 hpalin kernel: Buffer I/O error on device sdc6, logical block 24883
Oct 30 20:07:34 hpalin kernel: lost page write due to I/O error on sdc6
Oct 30 20:07:34 hpalin kernel: Buffer I/O error on device sdc6, logical block 24884
Oct 30 20:07:34 hpalin kernel: lost page write due to I/O error on sdc6
Oct 30 20:07:34 hpalin kernel: Buffer I/O error on device sdc6, logical block 24885
Oct 30 20:07:34 hpalin kernel: lost page write due to I/O error on sdc6
Oct 30 20:07:34 hpalin kernel: Buffer I/O error on device sdc6, logical block 24886
Oct 30 20:07:34 hpalin kernel: lost page write due to I/O error on sdc6
Oct 30 20:07:34 hpalin kernel: Buffer I/O error on device sdc6, logical block 24887
Oct 30 20:07:34 hpalin kernel: lost page write due to I/O error on sdc6
Oct 30 20:12:42 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
Oct 30 20:12:42 hpalin kernel: scsi1: Bus Reset detected, executing command 2fd148a0, slot 2fd60520, dsp 001d81e8[01e8]
Oct 30 20:12:42 hpalin kernel:  failing command because of reset, slot 2fd60520, cmnd 2fd148a0
Oct 30 20:12:42 hpalin kernel:  failing command because of reset, slot 2fd6064c, cmnd 2fd14060
Oct 30 20:12:42 hpalin kernel:  failing command because of reset, slot 2fd60778, cmnd 2d22aba0
Oct 30 20:12:42 hpalin kernel:  failing command because of reset, slot 2fd608a4, cmnd 2d22a8e0
Oct 30 20:32:41 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
Oct 30 20:32:41 hpalin kernel: scsi1: Bus Reset detected, executing command 2fd14b60, slot 2fd60778, dsp 001d81e8[01e8]
Oct 30 20:32:41 hpalin kernel:  failing command because of reset, slot 2fd60520, cmnd 17cb2340
Oct 30 20:32:41 hpalin kernel:  failing command because of reset, slot 2fd60778, cmnd 2fd14b60
Oct 30 20:45:08 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
Oct 30 20:45:08 hpalin kernel: scsi1: Bus Reset detected, executing command 2bdb0340, slot 2fd60778, dsp 001d81e8[01e8]
Oct 30 20:45:08 hpalin kernel:  failing command because of reset, slot 2fd60778, cmnd 2bdb0340
Oct 30 20:45:08 hpalin kernel:  failing command because of reset, slot 2fd608a4, cmnd 2fd14060

The apt-get operation was near complete:
just a pakage pakage failed to install, a quick check make me appear that postinst and postrm scripts were corrupted :(

But according to previous messages, should I doubt of the intergrity of this chroot disk or only those few files were corrupted?

Secondly the worst thing occured when I try a 'tar cslpf /chroot/Develop/linux-2.6.9-pa1.tar linux-2.6.9-pa1'
(the src linux tree standing on the internal disk using ncr driver and the target file standing on the external disk using 53c700 
driver):

numerous messages of style

          len = 6, cmd =scsi1 : destination target 3, lun 0
         command = 0x2a 00 00 53 3c 66 00 04 00 00
scsi1: Bus Reset detected, executing command 2bc09340, slot 2fd608a4, dsp 001d8] failing command because of reset, slot 2fd60520, 
cmnd 2fd14b60
  failing command because of reset, slot 2fd6064c, cmnd 2bc094a0
  failing command because of reset, slot 2fd60778, cmnd 2bc09b80
  failing command because of reset, slot 2fd608a4, cmnd 2bc09340

ending by the fatal:
Kernel panic - not syncing: drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O M.

And at the reboot weird kernel announce:
[...]
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
scsi1 (0:0) New error handler wants to abort command
         scsi1 : destination target 0, lun 0
         command = 0x12 00 00 00 24 00
scsi1 (0:0) New error handler wants device reset
         scsi1 : destination target 0, lun 0
         command = 0x12 00 00 00 24 00
scsi1 (0:0) New error handler wants BUS reset, cmd 2fd2ab60
         scsi1 : destination target 0, lun 0
         command = 0x12 00 00 00 24 00
scsi1: Bus Reset detected, executing command 2fd2ab60, slot 2fd70520, dsp 001d8] failing command because of reset, slot 2fd70520, 
cmnd 2fd2ab60
  1:0:0:0: Illegal state transition created->quiesce
Badness in scsi_device_set_state at drivers/scsi/scsi_lib.c:1713
Backtrace:
  [<1025de58>] scsi_device_set_state+0xf8/0x1a8
  [<1025df1c>] scsi_device_quiesce+0x14/0x64
  [<102630ac>] spi_dv_device+0x70/0x1a8
  [<102631fc>] spi_dv_device_work_wrapper+0x18/0x3c
  [<10139514>] worker_thread+0x1ac/0x278
  [<1013e04c>] kthread+0xdc/0xe4
  [<1010dc5c>] ret_from_kernel_thread+0x1c/0x24

scsi1 (0:0) New error handler wants HOST reset
         scsi1 : destination target 0, lun 0
         command = 0x12 00 00 00 24 00
scsi: Device offlined - not ready after error recovery: host 1 channel 0 id 0 l0
   Vendor: SEAGATE   Model: ST34573W          Rev: HP11
   Type:   Direct-Access                      ANSI SCSI revision: 02
  target1:0:3: Beginning Domain Validation
scsi1: (3:0) Asynchronous
scsi1: (3:0) Enabling Tag Command Queuing
scsi1: (3:0) Synchronous at offset 8, period 100ns
  target1:0:3: Domain Validation skipping write tests
  target1:0:3: Ending Domain Validation
st: Version 20040403, fixed bufsize 32768, s/g segs 256
[...]

hmm, I try to reproduce the previous panic but I don't reach; this time only one:
  scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
scsi1: Bus Reset detected, executing command 2fd2aa00, slot 2fd70778, dsp 001d81e8[01e8]
  failing command because of reset, slot 2fd70778, cmnd 2fd2aa00

Thanks in advance for your advise,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
