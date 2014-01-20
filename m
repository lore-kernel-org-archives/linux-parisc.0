From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Issue with =?UTF-8?Q?pata=5Fsil=36=38=30?=
Date: Mon, 20 Jan 2014 13:24:00 +0100
Message-ID: <b1936c5daf63913a0a5d0c37b7ebc425@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,


I tried to switch to the ATA drivers but I keep getting a panic whenever 
I load the pata_sil680 module on my C8000.


Kconfig : http://bpaste.net/show/170067/
Kver : 3.12.8-gentoo

This is the backtrace :
insmoterminator ~ # insmod pata_sil680.ko
pata_sil680 0000:60:02.0: version 0.4.9
pata_sil680 0000:60:02.0: sil680: BA5_EN = 1 clock = 00
pata_sil680 0000:60:02.0: sil680: BA5_EN = 1 clock = 10
sil680: 133MHz clock.
Backtrace:
  [<00000000401ad0c4>] handle_percpu_irq+0xbc/0xf8
  [<00000000401a62c4>] generic_handle_irq+0x4c/0x68
  [<00000000401062a4>] syscall_do_resched+0x28/0x34
  [<000000004011e1f8>] execute_on_irq_stack+0x70/0xb8
  [<000000004019486c>] enqueue_task_fair+0x5ac/0xbd0
  [<0000000040188ec8>] check_preempt_curr+0x98/0xc8
  [<0000000040188f34>] ttwu_do_wakeup+0x3c/0xd0
  [<0000000040189184>] ttwu_do_activate.constprop.68+0xbc/0xd8
  [<000000004018c2b8>] try_to_wake_up+0x238/0x450
  [<000000004017ff8c>] __raw_notifier_call_chain+0x2c/0x40
  [<000000004017ffd0>] raw_notifier_call_chain+0x30/0x48
  [<00000000401b0f74>] timekeeping_update.constprop.9+0x5c/0xe0
  [<0000000040188f34>] ttwu_do_wakeup+0x3c/0xd0
  [<0000000040189184>] ttwu_do_activate.constprop.68+0xbc/0xd8
  [<000000004018c2b8>] try_to_wake_up+0x238/0x450
  [<000000004018c4fc>] default_wake_function+0x2c/0x40
Bad Address (null pointer deref?): Code=26 regs=0000000041f77350 
(Addr=0000000000000000)
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 3.12.8-gentoo #2
task: 000000007fc887e0 ti: 000000007fcc4000 task.ti: 000000007fcc4000

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  000000ff0804ff0e 0000000040987e60 00000000401ad0c4 
0000000041f77250
r04-07  0000000040970660 0000000000000000 0000000000000000 
0000000041f77320
r08-11  0000000000000047 00000000407c4880 0000000000000004 
0000000000000001
r12-15  0000000040889a90 0000000000000047 0000000000000000 
0000000000000001
r16-19  000000007fcc4250 000000000000001a 0000000040889a90 
0000000001559000
r20-23  00000000407dec50 0000000041f7b020 fffc000000000000 
feffffffffffffff
r24-27  0000000041f77040 0000000000000000 00000000407c4880 
0000000040970660
r28-31  fefc000000000000 0000000041f77220 0000000041f77350 
0100000000000000
sr00-03  0000000000217000 0000000000217000 0000000000000000 
0000000000217000
sr04-07  0000000000000000 0000000000000000 0000000000000000 
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401a7234 
00000000401a7238
  IIR: 0dc010dc    ISR: 0000000000000000  IOR: 0000000000000000
  CPU:        1   CR30: 000000007fcc4000 CR31: ffffe1691b8f2119
  ORIG_R28: 0000000040189184
  IAOQ[0]: handle_irq_event_percpu+0x9c/0x378
  IAOQ[1]: handle_irq_event_percpu+0xa0/0x378
  RP(r2): handle_percpu_irq+0xbc/0xf8


If I hack the driver to enable MMIO, I have the following backtrace :
scsi2 : pata_sil680
scsi3 : pata_sil680
ata1: PATA max UDMA/133 irq 71
ata2: PATA max UDMA/133 irq 71
scsi 3:0:0:0: CD-ROM            HL-DT-ST DVDRAM GSA-4082B A208 PQ: 0 
ANSI: 5
ata2.00: configured for UDMA/66
sr0: scsi3-mmc drive: 32x/32x writer dvd-ram cd/rw xa/form2 cdda tray
cdrom: Uniform CD-ROM driver Revision: 3.20
sr 3:0:0:0: Attached scsi CD-ROM sr0
sr 3:0:0:0: Attached scsi generic sg1 type 5
  [<00000000401ad0c4>] handle_percpu_irq+0xbc/0xf8
  [<00000000401a62c4>] generic_handle_irq+0x4c/0x68
  [<00000000401062a4>] syscall_do_resched+0x28/0x34


With MMIO, it goes a little bit further as it detects the drive 
correctly but eventually fails the same way.

As far as I understand the backtrace, it would seem that an IRQ handler 
function pointer is set to NULL or some NULL pointer deref occurs in the 
IRQ handler.
Also, this is not the original DVD drive from the C8000. I replaced it 
with a DVD burner.

How idea what can be the issue ?

Thanks,
   Guy




