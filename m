From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] k-2.6.10-rc1-pa3 & c110: high data rate => Kernel
	panic - ...
Date: Sun, 31 Oct 2004 21:11:02 +0000
Message-ID: <418554E6.1060905@tiscali.be>
References: <4183F270.30705@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4183F270.30705@tiscali.be>
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
> 
> The serial console pb being fixed, I can now boot again my c110 with 
> recent 2.6.10-rc1-pa3 :)
> 
[...]
> 
> ending by the fatal:
> Kernel panic - not syncing: drivers/parisc/ccio-dma.c: 
> ccio_alloc_range() I/O M.
> 
> And at the reboot weird kernel announce:
> [...]
> 53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
> scsi1: 53c710 rev 2
> scsi1 : LASI SCSI 53c700
> scsi1 (0:0) New error handler wants to abort command
>         scsi1 : destination target 0, lun 0
>         command = 0x12 00 00 00 24 00
> scsi1 (0:0) New error handler wants device reset
>         scsi1 : destination target 0, lun 0
>         command = 0x12 00 00 00 24 00
> scsi1 (0:0) New error handler wants BUS reset, cmd 2fd2ab60
>         scsi1 : destination target 0, lun 0
>         command = 0x12 00 00 00 24 00
> scsi1: Bus Reset detected, executing command 2fd2ab60, slot 2fd70520, 
> dsp 001d8] failing command because of reset, slot 2fd70520, cmnd 2fd2ab60
>  1:0:0:0: Illegal state transition created->quiesce
> Badness in scsi_device_set_state at drivers/scsi/scsi_lib.c:1713
> Backtrace:
>  [<1025de58>] scsi_device_set_state+0xf8/0x1a8
>  [<1025df1c>] scsi_device_quiesce+0x14/0x64
>  [<102630ac>] spi_dv_device+0x70/0x1a8
>  [<102631fc>] spi_dv_device_work_wrapper+0x18/0x3c
>  [<10139514>] worker_thread+0x1ac/0x278
>  [<1013e04c>] kthread+0xdc/0xe4
>  [<1010dc5c>] ret_from_kernel_thread+0x1c/0x24
> 
> scsi1 (0:0) New error handler wants HOST reset
>         scsi1 : destination target 0, lun 0
>         command = 0x12 00 00 00 24 00
> scsi: Device offlined - not ready after error recovery: host 1 channel 0 
> id 0 l0
>   Vendor: SEAGATE   Model: ST34573W          Rev: HP11
>   Type:   Direct-Access                      ANSI SCSI revision: 02
>  target1:0:3: Beginning Domain Validation
> scsi1: (3:0) Asynchronous
> scsi1: (3:0) Enabling Tag Command Queuing
> scsi1: (3:0) Synchronous at offset 8, period 100ns
>  target1:0:3: Domain Validation skipping write tests
>  target1:0:3: Ending Domain Validation
> st: Version 20040403, fixed bufsize 32768, s/g segs 256
> [...]
> 
> hmm, I try to reproduce the previous panic but I don't reach; this time 
> only one:
>  scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
> scsi1: Bus Reset detected, executing command 2fd2aa00, slot 2fd70778, 
> dsp 001d81e8[01e8]
>  failing command because of reset, slot 2fd70778, cmnd 2fd2aa00
> 
Just a small update:
test 2.6.10-rc1-pa5 boot fine, but didn't solve lasi scsi ctrl:
scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG N
scsi1: Bus Reset detected, executing command 26fb04c0, slot 2fd6064c, dsp 001d8]
  failing command because of reset, slot 2fd60520, cmnd 2fd19740
  failing command because of reset, slot 2fd6064c, cmnd 26fb04c0
  failing command because of reset, slot 2fd60778, cmnd 2fd19b60
  failing command because of reset, slot 2fd608a4, cmnd 26fb0620
Incorrect number of segments after building list
counted 29, received 28
req nr_sec 1024, cur_nr_sec 8
Buffer I/O error on device sdc9, logical block 44761
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44762
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44763
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44764
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44765
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44766
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44767
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44768
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44769
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 44770
lost page write due to I/O error on sdc9
Incorrect number of segments after building list
counted 22, received 21
req nr_sec 1024, cur_nr_sec 8

Just the ggg work-around (ccio_mem_ratio = 2;) seems to help.

Hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
