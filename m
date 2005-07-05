From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: Help wanted: Getting Matrox Mystique to run on HPPA B2000
Date: Tue, 05 Jul 2005 22:47:16 +0800
Message-ID: <5.1.1.6.1.20050705220226.02abcec0__28923.2091782198$1416623835$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <1sjOdB.A.x4F.U2pyCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Hi,

I have set up Matrox Millennum II on B2000 running Linux 2.6.12-rc6-pa1 
kernel. Am now trying to set up Matrox Mystique to run on it too.

In my first attempt I compiled the "Matrox acceleration" as MODULE with 
"Millennium I/II support" and "Mystique support" compiled into the KERNEL 
(they are not "module" selectable). After rebooting, 'matroxfb' was not 
loaded automatically. Executed a command "modprobe matroxfb" it returned an 
error msg "FATAL: Module matroxfb not found".

Recompiled the second time with "Matrox acceleration", "Millennium I/II 
support" and "Mystique support" all compiled into the KERNEL. Rebooted 
successfully but the Mystique card was not initialized nor the kernel 
crashes as it did running Linux 2.6.8.

The relevant boot msgs are as follows: (3 extra 'printk' s were added to 
drivers/video/matrox/matroxfb_base.h before kernel recompilation so there 
are extra outputs)


STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at fd820000 (128 kB), fb at fb000000 (16 MB)
     id 35acda16-9a02587, conforms to spec rev. 8.0c
     graphics card name: HPA4982A
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
matroxfb: Matrox Mystique (PCI) detected
mga_ioremap: phys=4253024256 size=16384 flags=1 virt=104f49e0 
virt->vaddr=fd800000
mga_ioremap: phys=4244635648 size=8388608 flags=1 virt=104f49cc 
virt->vaddr=fd000000
matroxfb: cannot determine memory size
mga_iounmap: before iounmap() va->vaddr=fd000000
mga_iounmap: after iounmap() va->vaddr=fd000000
mga_iounmap: before iounmap() va->vaddr=fd800000
mga_iounmap: after iounmap() va->vaddr=fd800000
matroxfb: probe of 0000:01:01.0 failed with error -1
stifb: 'HPA4982A' (id: 0x35acda16) not supported.
Generic RTC Driver v1.07


The 'lspci -v' outputs are as follows:

DebianHPPA01:~# lspci -v
0000:00:0c.0 Ethernet controller: Digital Equipment Corporation DECchip 
21142/43 (rev 41)
	Subsystem: Hewlett-Packard Company: Unknown device 104f
	Flags: bus master, medium devsel, latency 255, IRQ 66
	I/O ports at 0f00 [size=128]
	Memory at f4005000 (32-bit, non-prefetchable) [size=1K]
	Expansion ROM at f4040000 [disabled] [size=256K]

0000:00:0d.0 Multimedia audio controller: Analog Devices AD1889 sound chip
	Subsystem: Analog Devices AD1889 sound chip
	Flags: bus master, medium devsel, latency 255, IRQ 67
	Memory at f4009000 (32-bit, prefetchable) [size=512]
	Memory at f4008000 (32-bit, prefetchable) [size=16]
	Memory at f4007000 (32-bit, prefetchable) [size=16]
	Memory at f4006000 (32-bit, prefetchable) [size=16]
	Capabilities: [dc] Power Management version 1

0000:00:0e.0 IDE interface: National Semiconductor Corporation 87415/87560 
IDE (rev 03) (prog-if 8f [Master SecP SecO PriP PriO])
	Flags: bus master, medium devsel, latency 255, IRQ 7
	I/O ports at 0e00 [size=8]
	I/O ports at 0d00 [size=4]
	I/O ports at 0b00 [size=8]
	I/O ports at 0a00 [size=4]
	I/O ports at 0900 [size=16]

0000:00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O 
(rev 01)
	Flags: bus master, medium devsel, latency 255, IRQ 68

0000:00:0e.2 USB Controller: National Semiconductor Corporation USB 
Controller (rev 02) (prog-if 10 [OHCI])
	Flags: bus master, medium devsel, latency 240, IRQ 1
	Memory at f4004000 (32-bit, non-prefetchable) [size=4K]
	Memory at f4003000 (32-bit, non-prefetchable) [size=4K]

0000:00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c895a 
(rev 01)
	Subsystem: LSI Logic / Symbios Logic LSI53C895A PCI to Ultra2 SCSI Controller
	Flags: bus master, medium devsel, latency 255, IRQ 69
	I/O ports at 0800 [size=256]
	Memory at f4002000 (32-bit, non-prefetchable) [size=1K]
	Memory at f4000000 (32-bit, non-prefetchable) [size=8K]
	Capabilities: [40] Power Management version 2

0000:01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
	Subsystem: Hewlett-Packard Company: Unknown device 108c
	Flags: bus master, 66MHz, medium devsel, latency 255, IRQ 70
	Memory at fb000000 (64-bit, prefetchable) [size=16M]
	Memory at fa000000 (64-bit, non-prefetchable) [size=16M]
	Expansion ROM at fd820000 [disabled] [size=128K]

0000:01:01.0 VGA compatible controller: Matrox Graphics, Inc. MGA 1064SG 
[Mystique] (rev 02) (prog-if 00 [VGA])
	Flags: bus master, stepping, medium devsel, latency 248, IRQ 71
	Memory at fd800000 (32-bit, non-prefetchable) [size=16K]
	Memory at fd000000 (32-bit, prefetchable) [size=8M]
	Memory at f4800000 (32-bit, non-prefetchable) [size=8M]
	Expansion ROM at fd820000 [disabled] [size=64K]


The 'cat /proc/iomem' outputs are as follows:

DebianHPPA01:~# cat /proc/iomem
00000000-0fffffff : System RAM
   00000000-000009ff : PDC data (Page Zero)
   00100000-0039cfff : Kernel code
   0039d000-0050d89b : Kernel data
f05d0000-f05d0000 : lcd_data
f05d0008-f05d0008 : lcd_cmd
f4000000-f47fffff : PCI00 LMMIO
   f4000000-f4001fff : sym53c8xx
   f4002000-f40023ff : sym53c8xx
   f4004000-f4004fff : ohci_hcd
   f4005000-f40053ff : tulip
   f4009000-f40091ff : ad1889
f4800000-f4ffffff : PCI01 LMMIO
fd000000-fdffffff : PCI01 ELMMIO
fed00000-fed00fff : SBA
fed30000-fed30fff : LBA
fed32000-fed32fff : LBA
fef00000-feffffff : Astro Intr Ack
fff80000-fffaffff : Central Bus
   fffa0000-fffa0fff : CPU
fffb0000-fffdffff : Local Broadcast
fffe0000-ffffffff : Global Broadcast
DebianHPPA01:~#


Any suggestion what should I do next to see if Matrox Mytique cards are 
indeed usable on HPPA boxes.

Tks,
Lee




-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
