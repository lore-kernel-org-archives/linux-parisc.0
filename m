From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] NCR_700 problems on 715/64 with 2.6.11-rc4-pa1
Date: Sat, 19 Feb 2005 08:00:44 -0600
Message-ID: <200502190800.44901.mszick@wolfbutter.com>
References: <200502191234.30310.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200502191234.30310.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat February 19 2005 05:34, Helge Deller wrote:
> I get random messages from the 53c700 scsi driver (see below). 
> Any ideas ?
> Helge
> 
Looks like more udev/irq balance/irq routing problems,
see concurrent thread "BUG 2.6.11-rc4..."

try: 'noudev pci=routeirq' options on the command line
to change behavior in generic code.

Mike

> System LOG:
> 
> Linux version 2.6.11-rc4-pa1 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #170 Sat Feb 19 12:04:12 CET 2005
> FP[0] enabled: Rev 1 Model 13
> The 32-bit Kernel has started...
> Determining PDC firmware type: Snake.
> model 000060a0 00000481 00000000 00000000 773c7d2c 00000000 00000004 00000072 00000072
> vers  0000000c
> model 9000/715
> Total Memory: 160 Mb
> Built 1 zonelists                                                                                                                         
> .....
> 53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
> scsi0: 53c710 rev 2
> scsi0 : LASI SCSI 53c700
>   Vendor: QUANTUM   Model: FIREBALL_TM3200S  Rev: 300X
>   Type:   Direct-Access                      ANSI SCSI revision: 02
>  target0:0:6: Beginning Domain Validation
> scsi0: (6:0) Enabling Tag Command Queuing
> scsi0: (6:0) Asynchronous
>  target0:0:6: Domain Validation skipping write tests
> scsi0: (6:0) Synchronous at offset 8, period 100ns
>  target0:0:6: Ending Domain Validation
> st: Version 20041025, fixed bufsize 32768, s/g segs 256
> SCSI device sda: 6281856 512-byte hdwr sectors (3216 MB)
> SCSI device sda: drive cache: write back
> SCSI device sda: 6281856 512-byte hdwr sectors (3216 MB)
> SCSI device sda: drive cache: write back
>  sda: sda1 sda2 sda3 sda4
> Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
> Attached scsi generic sg0 at scsi0, channel 0, id 6, lun 0,  type 0                                                                       
> ...
> 
> 
> 
> in dmesg (at random times):
> _raw_foo() called with bad address 0xf0106121
> Backtrace:
>  [<10104ce4>] __raw_bad_addr+0x64/0x70
>  [<1028edd8>] NCR_700_start_command+0x3e8/0x78c
>  [<10290684>] NCR_700_queuecommand+0x2fc/0x440
>  [<1026cf30>] scsi_dispatch_cmd+0x164/0x238
>  [<10272ba4>] scsi_request_fn+0x18c/0x354
>  [<10250454>] __generic_unplug_device+0x4c/0x54
>  [<10250470>] generic_unplug_device+0x14/0x24
>  [<102504b0>] blk_backing_dev_unplug+0x30/0x38
>  [<10169038>] sync_buffer+0x54/0x58
>  [<10103708>] __wait_on_bit+0xd4/0xe0
>  [<101037c4>] out_of_line_wait_on_bit+0xb0/0xcc
>  [<101ba2a4>] journal_commit_transaction+0xe68/0x1028
>  [<101bc7ac>] kjournald+0xc0/0x240
>  [<1010bc5c>] ret_from_kernel_thread+0x1c/0x24
> 
> 
> and:
> __raw_foo() called with bad address 0xf0106122
> Backtrace:
>  [<10104ce4>] __raw_bad_addr+0x64/0x70
>  [<1028f200>] NCR_700_intr+0x84/0x120c
>  [<10142cfc>] handle_IRQ_event+0x50/0xa4
>  [<10142e78>] __do_IRQ+0x128/0x174
>  [<102163dc>] gsc_asic_intr+0xac/0xc8
>  [<10142cfc>] handle_IRQ_event+0x50/0xa4
>  [<10142e78>] __do_IRQ+0x128/0x174
>  [<101072a0>] do_cpu_irq_mask+0x7c/0xd8
>  [<1010c068>] intr_return+0x0/0x14
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
