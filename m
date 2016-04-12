From: Simone Mannori <simone.mannori@gmail.com>
Subject: PCI video card hangs during system boot
Date: Tue, 12 Apr 2016 10:20:17 +0200
Message-ID: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dear All,

looking for a solution for a presistent issue (lack of any hardware
acceleration support for X11 because error during the loading of the
"radeon" or "nouveau" kernel module at boot time) I have bought a PCI
video card: ATI RADEON 9300 128M PCI. This test has been suggested by
many guys on several mailing list.

NOTA BENE: make sure that the PCI video card is 3.3V type or is an
"universal" (3.3V and 5.0V) model like mine.

I have put this video card leaving the ATI FireCL X1 installed; I have
removed the AGP video card; I have moved the PCI video card on
different positions.

No matter what I do, the c8000 is unable to boot.

Using the serial console, I have his message

<Cpu0> 0e000e7a00e00000  600601005d441002  CC_IODISC_PCI_DEVICE_CONFIG
pci_bus_walk line 2878 - bridge aperture too big
<Cpu0> 160012cb00e00000  0000000000000000  CC_MPS_SLAV.......
.......
Then the system boot process STOPs:
<Cpu1> e000108401e00000  0000000000000000  CC_BOOT_BOOT_FAILURE
<Cpu1> 030010d501e00000  0000000000000000  CC_CPU_STOP

This problem lie in the internal c8000 "system bios/diagnostic" code,
Linux boot process, kernel and modules are not involved.

Finally, the people that have suggested this test have not tried to make it.

Question: "Someone has tried with a NVDIA or MATROX PCI video cards?"

Thanks in advance for your help.

   Simone Mannori - ITALY
