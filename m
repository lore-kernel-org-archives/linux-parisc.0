From: Max Grabert <parisc@gmail.com>
Subject: [parisc-linux] tests with IDE controller ... IRQ xy: nobody cared!
Date: Wed, 9 Feb 2005 04:01:01 +0000
Message-ID: <e6eae0290502082001783c3780@mail.gmail.com>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: Linux/PA <parisc-linux@parisc-linux.org>
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

Hi PA,

It has been quite a long time since I last tried to get
PCI IDE controllers working in my C3k. So I decided
whether anything has change in this situation lately
 (Debian/testing, 2.6.11-rc3-pa3, 32bit, gcc-3.4.4).

I tried a noname Silicon Image Sil680 based IDE controller
and a Promise Ultra100 Tx2 (I compiled all IDE stuff and
IDE drivers as modules, so I could more easily test it).
I didn't have any luck getting the IDE controller to work,
but at least now I got much different error messages than
I used to get (months ago).
Maybe this might help you to locate the problem:

kernel: Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
kernel: ide: Assuming 33MHz system bus speed for PIO modes; override
with idebus=xx
kernel: PDC20268: IDE controller at PCI slot 0000:01:04.0
kernel: PCI: 0000:01:04.0 has unsupported PM cap regs version (1)
kernel: PDC20268: chipset revision 2
kernel: PDC20268: ROM enabled at 0xf4a00000
kernel: PDC20268: 100%% native mode on irq 21
kernel:     ide0: BM-DMA at 0x12100-0x12107, BIOS settings: hda:pio, hdb:pio
kernel:     ide1: BM-DMA at 0x12108-0x1210f, BIOS settings: hdc:pio, hdd:pio
kernel: Probing IDE interface ide0...
kernel: hda: ST3120022A, ATA DISK drive
kernel: ide0 at 0x12500-0x12507,0x12402 on irq 21
kernel: irq 21: nobody cared!
kernel: Backtrace:
kernel:  [<10143de4>] __report_bad_irq+0x34/0xac
kernel:  [<10143f4c>] note_interrupt+0xbc/0xf4
kernel:  [<101438d0>] __do_IRQ+0x17c/0x190
kernel:  [<101072fc>] do_cpu_irq_mask+0xa8/0xe4
kernel:  [<1010c068>] intr_return+0x0/0x14
kernel: handlers:
kernel: [<002ed640>] (ide_intr+0x0/0x290 [ide_core])
kernel: Disabling IRQ #21
kernel: Probing IDE interface ide1...
kernel: hdc: PLEXTOR DVDR PX-716A, ATAPI CD/DVD-ROM drive
kernel: ide1 at 0x12300-0x12307,0x12202 on irq 21

This particular message showed up when I tried the 
Promise card with the pdc202xx_new driver in a 33MHz slot.
Exactly the same backtrace occurs when I put the card in
a 66MHz slot and also when I tried the Silicon Image card
with the siimage driver (33MHz).

As you can see from the log, the hdd and the DVD burner
are correctly detected, but I cannot access them; a
'mount /dev/hda ...' or a 'cat /dev/hda' results in
'cannot open /dev/hda'.

(The Promise card with the pdc202xx_old driver does load, but
 doesn't detect anything nor does anything show up in the logs)


Thanks a lot in advance,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
