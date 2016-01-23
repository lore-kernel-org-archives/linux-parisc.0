From: John David Anglin <dave.anglin@bell.net>
Subject: SCSI bug
Date: Sat, 23 Jan 2016 13:00:00 -0500
Message-ID: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I gave 4.4.0+ a try this morning and we still have the SCSI issue previously reported:

sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 70
sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi host0: sym-2.2.3
usb 1-3: new high-speed USB device number 2 using ehci-pci
usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb2: Product: OHCI PCI host controller
usb usb2: Manufacturer: Linux 4.4.0+ ohci_hcd
usb usb2: SerialNumber: 0000:00:01.0
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 3 ports detected
ohci-pci 0000:00:01.1: OHCI PCI host controller
ohci-pci 0000:00:01.1: new USB bus registered, assigned bus number 3
ohci-pci 0000:00:01.1: irq 67, io mem 0xffffffff80001000
usb 1-3: New USB device found, idVendor=1058, idProduct=0748
usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=5
usb 1-3: Product: My Passport 0748
usb 1-3: Manufacturer: Western Digital
usb 1-3: SerialNumber: 575836314542325A33383231
usb-storage 1-3:1.0: USB Mass Storage device detected
scsi host1: usb-storage 1-3:1.0
usbcore: registered new interface driver usb-storage
usbcore: registered new interface driver uas
usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb3: Product: OHCI PCI host controller
usb usb3: Manufacturer: Linux 4.4.0+ ohci_hcd
usb usb3: SerialNumber: 0000:00:01.1
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
pata_cmd64x 0000:00:02.0: Secondary port is disabled
scsi host2: pata_cmd64x
scsi host3: pata_cmd64x
ata1: PATA max UDMA/100 cmd 0xd18 ctl 0xd24 bmdma 0xd00 irq 69
ata2: DUMMY
ata1.00: ATAPI: DW-224E, C.0B, max UDMA/33
ata1.00: configured for UDMA/33
scsi 2:0:0:0: CD-ROM            TEAC     DW-224E          C.0B PQ: 0 ANSI: 5
sr 2:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
cdrom: Uniform CD-ROM driver Revision: 3.20
scsi 1:0:0:0: Direct-Access     WD       My Passport 0748 1022 PQ: 0 ANSI: 6
scsi 1:0:0:1: Enclosure         WD       SES Device       1022 PQ: 0 ANSI: 6
sd 1:0:0:0: [sda] Spinning up disk...
.
scsi 0:0:0:0: Direct-Access     SEAGATE  ST3300007LC      D705 PQ: 0 ANSI: 3
scsi target0:0:0: tagged command queuing enabled, command queue depth 16.
scsi target0:0:0: Beginning Domain Validation
scsi target0:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
scsi target0:0:0: Ending Domain Validation
sd 0:0:0:0: [sdb] 585937500 512-byte logical blocks: (300 GB/279 GiB)
sd 0:0:0:0: [sdb] Write Protect is off
sd 0:0:0:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
sd 0:0:0:0: [sdb] Attached SCSI disk
ready
sd 1:0:0:0: [sda] 3906963456 512-byte logical blocks: (2.00 TB/1.82 TiB)
sd 1:0:0:0: [sda] Write Protect is off
sd 1:0:0:0: [sda] No Caching mode page found
sd 1:0:0:0: [sda] Assuming drive cache: write through
ses 1:0:0:1: Attached Enclosure device
 sda: sda1 sda2
sd 1:0:0:0: [sda] Attached SCSI disk
random: nonblocking pool is initialized
------------[ cut here ]------------
WARNING: at block/blk-merge.c:454
Modules linked in: ses enclosure scsi_transport_sas sd_mod sr_mod cdrom uas usb_storage pata_cmd64x ohci_pci tg3(+) ptp sym53c8xx(+) libata pps_core ehci_pci scsi_transport_spi ohci_hcd ehci_hcd scsi_mod usbcore usb_common
CPU: 1 PID: 930 Comm: systemd-udevd Not tainted 4.4.0+ #1
task: 000000007f038c68 ti: 000000007e198000 task.ti: 000000007e198000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  000000ff0804ff0e 0000000040756dc0 0000000000000000 000000007e199210
r04-07  000000004072cdc0 0000000000000000 0000000000000000 000000000000001e
r08-11  0000000000000001 0000000000000000 000000007c1fe1b8 0000000000000000
r12-15  0000000000000002 00000000000001e0 0000000000001000 000000007e1d6800
r16-19  000000007c1fa6f8 000000004270e3c0 000000007c1fe1b8 0000000000000000
r20-23  0000000000000000 000000007e3f3c00 00000000407ac690 0000000000000000
r24-27  0000000000000000 000000007c1fa6f8 000000004270e3c0 000000004072cdc0
r28-31  0000000000000001 0000000000001000 000000007e199340 0000000000000001
sr00-03  0000000000012000 0000000000000000 0000000000012000 0000000000012000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004038d5f4 000000004038d5f8
 IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000000f07f9fe1b8
 CPU:        1   CR30: 000000007e198000 CR31: ff7f1bfb00e9e4ff
 ORIG_R28: 000000007e1994f0
 IAOQ[0]: blk_rq_map_sg+0x564/0x598
 IAOQ[1]: blk_rq_map_sg+0x568/0x598
 RP(r2):           (null)
Backtrace:
 [<0000000018317690>] scsi_init_sgtable+0x70/0x168 [scsi_mod]
 [<00000000183177f4>] scsi_init_io+0x6c/0x250 [scsi_mod]
 [<000000001c7f16b0>] sd_setup_read_write_cmnd+0x58/0x948 [sd_mod]
 [<000000001c7f1fe4>] sd_init_command+0x44/0x130 [sd_mod]
 [<0000000018317adc>] scsi_setup_cmnd+0x104/0x1c0 [scsi_mod]
 [<0000000018317e28>] scsi_prep_fn+0x100/0x340 [scsi_mod]
 [<000000004038663c>] blk_peek_request+0x1b4/0x290
 [<0000000018319a34>] scsi_request_fn+0xf4/0xab0 [scsi_mod]
 [<00000000403819e4>] __blk_run_queue+0x4c/0x70
 [<00000000403ac6a8>] cfq_insert_request+0x2e0/0x588
 [<0000000040380ba0>] __elv_add_request+0x190/0x2d8

---[ end trace 19da17b0d547c92b ]---
------------[ cut here ]------------
kernel BUG at drivers/scsi/scsi_lib.c:1097!
CPU: 1 PID: 930 Comm: systemd-udevd Tainted: G        W       4.4.0+ #1
task: 000000007f038c68 ti: 000000007e198000 task.ti: 000000007e198000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Tainted: G        W      
r00-03  000000ff0804ff0e 0000000040756dc0 0000000018317690 000000007e199170
r04-07  0000000018301000 000000007c1fa6f8 000000007e21ab60 0000000000000000
r08-11  000000007c1fa6f8 000000007e1fe800 00000000408444d0 0000000000000110
r12-15  0000000000000000 000000007e198798 0000000018301000 0000000040756dc0
r16-19  00000000408444dc 000000007e1fe800 000000007c216800 0000000000000000
r20-23  0000000000000000 000000007e3f3c00 00000000407ac690 0000000000000000
r24-27  0000000000000000 000000007c1fa6f8 000000004270e3c0 000000004072cdc0
r28-31  0000000000000002 0000000000001000 000000007e199210 0000000000000001
sr00-03  0000000000012000 0000000000000000 0000000000012000 0000000000012000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000183176d4 00000000183176d8
 IIR: 03ffe01f    ISR: 0000000000000000  IOR: 0000000000000000
 CPU:        1   CR30: 000000007e198000 CR31: ff7f1bfb00e9e4ff
 ORIG_R28: 0000000000000000
 IAOQ[0]: scsi_init_sgtable+0xb4/0x168 [scsi_mod]
 IAOQ[1]: scsi_init_sgtable+0xb8/0x168 [scsi_mod]
 RP(r2): scsi_init_sgtable+0x70/0x168 [scsi_mod]
Backtrace:
 [<00000000183177f4>] scsi_init_io+0x6c/0x250 [scsi_mod]
 [<000000001c7f16b0>] sd_setup_read_write_cmnd+0x58/0x948 [sd_mod]
 [<000000001c7f1fe4>] sd_init_command+0x44/0x130 [sd_mod]
 [<0000000018317adc>] scsi_setup_cmnd+0x104/0x1c0 [scsi_mod]
 [<0000000018317e28>] scsi_prep_fn+0x100/0x340 [scsi_mod]
 [<000000004038663c>] blk_peek_request+0x1b4/0x290
 [<0000000018319a34>] scsi_request_fn+0xf4/0xab0 [scsi_mod]
 [<00000000403819e4>] __blk_run_queue+0x4c/0x70
 [<00000000403ac6a8>] cfq_insert_request+0x2e0/0x588
 [<0000000040380ba0>] __elv_add_request+0x190/0x2d8

CPU: 1 PID: 930 Comm: systemd-udevd Tainted: G        W       4.4.0+ #1
Backtrace:
 [<000000004015d560>] show_stack+0x20/0x38
 [<00000000403b1f94>] dump_stack+0x9c/0x110
 [<000000004015d734>] die_if_kernel+0x19c/0x2e0
 [<000000004015e610>] handle_interruption+0x9a8/0x9d0

---[ end trace 19da17b0d547c92c ]---
NMI watchdog: BUG: soft lockup - CPU#3 stuck for 22s! [systemd-udevd:930]
Modules linked in: ses enclosure scsi_transport_sas sd_mod sr_mod cdrom uas usb_storage pata_cmd64x ohci_pci tg3(+) ptp sym53c8xx(+) libata pps_core ehci_pci scsi_transport_spi ohci_hcd ehci_hcd scsi_mod usbcore usb_common
CPU: 3 PID: 930 Comm: systemd-udevd Tainted: G      D W       4.4.0+ #1
task: 000000007f038c68 ti: 000000007e198000 task.ti: 000000007e198000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101111111100001111 Tainted: G      D W      
r00-03  000000ff0806ff0f 000000007e199d00 00000000402039c0 000000007e199c30
r04-07  000000004072cdc0 000000007e199cd0 00000000407bc588 00000000407bc4a0
r08-11  00000000428443a0 00000000428443a8 0000000000000001 0000000040705660
r12-15  0000000000000000 000000007e199cd0 0000000018301000 0000000040756dc0
r16-19  000000007e199210 000000007e1fe800 000000007c216800 000000004282bfa0
r20-23  0000000000000001 00000000428443a8 000000000800000f 0000000000000000
r24-27  0000000000000000 0000000000000020 00000000428443a8 000000004072cdc0
r28-31  0000000000000001 000000007e199d50 000000007e199d00 0000000000000003
sr00-03  000000000001c000 0000000000000000 0000000000000000 000000000001c000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402039e8 00000000402039ec
 IIR: 4a7f0030    ISR: 000000004072cdc0  IOR: 000000007e36e620
 CPU:        3   CR30: 000000007e198000 CR31: ffffffffffffffff
 ORIG_R28: 0000000000000001
 IAOQ[0]: smp_call_function_many+0x338/0x3b0
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0
 RP(r2): smp_call_function_many+0x310/0x3b0
Backtrace:
 [<0000000040203b18>] on_each_cpu+0x58/0xa0
 [<000000004015aed8>] flush_tlb_all+0x108/0x1e8
 [<0000000040258270>] tlb_flush_mmu_tlbonly+0x48/0xa8
 [<0000000040259048>] tlb_finish_mmu+0x30/0x98
 [<0000000040263e5c>] exit_mmap+0x134/0x1b8
 [<0000000040182668>] mmput+0xc0/0x1a8
 [<0000000040188eec>] do_exit+0x334/0xce0
 [<000000004015d790>] die_if_kernel+0x1f8/0x2e0
 [<000000004015e610>] handle_interruption+0x9a8/0x9d0

NMI watchdog: BUG: soft lockup - CPU#3 stuck for 22s! [systemd-udevd:930]
Modules linked in: ses enclosure scsi_transport_sas sd_mod sr_mod cdrom uas usb_storage pata_cmd64x ohci_pci tg3(+) ptp sym53c8xx(+) libata pps_core ehci_pci scsi_transport_spi ohci_hcd ehci_hcd scsi_mod usbcore usb_common
CPU: 3 PID: 930 Comm: systemd-udevd Tainted: G      D W    L  4.4.0+ #1
task: 000000007f038c68 ti: 000000007e198000 task.ti: 000000007e198000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101111111100001111 Tainted: G      D W    L 
r00-03  000000ff0806ff0f 000000007e199d00 00000000402039c0 000000007e199c30
r04-07  000000004072cdc0 000000007e199cd0 00000000407bc588 00000000407bc4a0
r08-11  00000000428443a0 00000000428443a8 0000000000000001 0000000040705660
r12-15  0000000000000000 000000007e199cd0 0000000018301000 0000000040756dc0
r16-19  000000007e199210 000000007e1fe800 000000007c216800 000000004282bfa0
r20-23  0000000000000001 00000000428443a8 000000000800000f 0000000000000000
r24-27  0000000000000000 0000000000000020 00000000428443a8 000000004072cdc0
r28-31  0000000000000001 000000007e199d50 000000007e199d00 0000000000000003
sr00-03  000000000001c000 0000000000000000 0000000000000000 000000000001c000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402039e8 00000000402039ec
 IIR: 4a7f0030    ISR: 000000004072cdc0  IOR: 000000007e36e620
 CPU:        3   CR30: 000000007e198000 CR31: ffffffffffffffff
 ORIG_R28: 0000000000000001
 IAOQ[0]: smp_call_function_many+0x338/0x3b0
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0
 RP(r2): smp_call_function_many+0x310/0x3b0
Backtrace:
 [<0000000040203b18>] on_each_cpu+0x58/0xa0
 [<000000004015aed8>] flush_tlb_all+0x108/0x1e8
 [<0000000040258270>] tlb_flush_mmu_tlbonly+0x48/0xa8
 [<0000000040259048>] tlb_finish_mmu+0x30/0x98
 [<0000000040263e5c>] exit_mmap+0x134/0x1b8
 [<0000000040182668>] mmput+0xc0/0x1a8
 [<0000000040188eec>] do_exit+0x334/0xce0
 [<000000004015d790>] die_if_kernel+0x1f8/0x2e0
 [<000000004015e610>] handle_interruption+0x9a8/0x9d0

INFO: rcu_sched self-detected stall on CPU
	3-...: (5978 ticks this GP) idle=ecb/140000000000001/0 softirq=709/709 fqs=6000 
	 (t=6000 jiffies g=-123 c=-124 q=4)
Task dump for CPU 1:
kworker/1:1H    R  running task        0   948      2 0x00000004
Workqueue: kblockd cfq_kick_queue
Backtrace:
 [<000000004015361c>] __schedule+0x264/0x5b8
 [<00000000401539bc>] schedule+0x4c/0xc8
 [<00000000401a29d0>] worker_thread+0x338/0x688
 [<00000000401aae84>] kthread+0x144/0x178
 [<0000000040149020>] end_fault_vector+0x20/0x28

Task dump for CPU 3:
systemd-udevd   R  running task        0   930    925 0x00000014
Backtrace:
 [<000000004015d560>] show_stack+0x20/0x38
 [<00000000401b95b4>] sched_show_task+0x134/0x1d0
 [<00000000401bc054>] dump_cpu_task+0x64/0x80
 [<00000000401e7584>] rcu_dump_cpu_stacks+0xf4/0x180
 [<00000000401ec644>] rcu_check_callbacks+0x5ac/0x9b8
 [<00000000401ef264>] update_process_times+0x74/0xd8
 [<000000004015e878>] timer_interrupt+0x1b0/0x210
 [<00000000401dc510>] handle_irq_event_percpu+0xa8/0x248
 [<00000000401e1e7c>] handle_percpu_irq+0xac/0xe8
 [<00000000401db794>] generic_handle_irq+0x4c/0x68
 [<000000004014b2cc>] call_on_stack+0x18/0x24

...

Dave
--
John David Anglin	dave.anglin@bell.net



