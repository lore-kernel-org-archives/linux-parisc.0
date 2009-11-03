From: Helge Deller <deller@gmx.de>
Subject: pci 0000:01:04.0: BAR 0: no parent found for of device
Date: Tue, 03 Nov 2009 22:00:39 +0100
Message-ID: <4AF099F7.10903@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Matthew Wilcox <matthew@wil.cx>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,

Something broke the stifb graphics driver in 2.6.32-rc5 (Linus' current head).
Somehow it seems, that the PCI subsystem does not activate this PCI slot:

Linux version 2.6.32-rc5-32bit (deller@p100) (gcc version 4.4.1 (GCC) ) #157 Tue Nov 3 21:49:24 CET 2009
...
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. Allegro W2 at 0xfffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
7. Memory at 0xfed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Setting cache flush threshold to 780 (1 CPUs online)
SBA found Astro 2.1 at 0xfed00000
Elroy version TR4.0 (0x5) found at 0xfed30000
PCI: Enabled native mode for NS87415 (pif=0x8f)
Elroy version TR4.0 (0x5) found at 0xfed32000
pci 0000:01:04.0: BAR 0: no parent found for of device [0xfa000000-0xfbffffff]
			^^^  HERE
...
STI GSC/PCI core graphics driver Version 0.9a
sti 0000:01:04.0: device not available because of BAR 0 [0xfa000000-0xfbffffff] collisions
sti 0000:01:04.0: Cannot enable PCI device
			^^^ HERE
sti: probe of 0000:01:04.0 failed with error -22
STI PCI graphic ROM found at f3800000 (2048 kB), fb at f6000000 (32 MB)
     id 35acda30-9a02587, conforms to spec rev. 8.0d
     graphics card name: A1262A
sticon: Initializing STI text console.
Console: switching to colour STI console 128x48
stifb: 'A1262A' (id: 0x35acda30) not supported.
Linux agpgart interface v0.103
....

Hopefully someone of you has an idea what caused this change?

lspci reports:
01:04.0 Display controller: Hewlett-Packard Company A4977A Visualize EG (rev 03)
         Flags: 66MHz, medium devsel
         Memory at fa000000 (32-bit, non-prefetchable) [size=32M]
         Expansion ROM at f2400000 [disabled] [size=64K]

Helge
