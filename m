Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA04609
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Oct 1999 15:00:54 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id OAA13828
	for <parisc-linux@thepuffingroup.com>; Thu, 7 Oct 1999 14:01:23 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id OAA19052 for <parisc-linux@thepuffingroup.com>; Thu, 7 Oct 1999 14:00:45 -0700 (PDT)
Message-Id: <199910072100.OAA19052@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Dino developments... 
Date: Thu, 07 Oct 1999 14:00:45 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Hi all,
I've committed changes to the following files:

  linux/arch/parisc/kernel/drivers.c
  linux/arch/parisc/kernel/inventory.c
  linux/arch/parisc/kernel/pci.c
  linux/drivers/gecko/dino.c
  linux/drivers/gecko/gecko.c
  linux/include/asm-parisc/pci.h
  linux/init/main.c

Both Card-mode and Built-in now get walked and devices are discovered.

outb/inb stuff probably isn't working because it doesn't call
dino_in/out functions yet. I've made changes to dino_in/out
functions and that's the *only* way a PCI driver can talk to a PCI
device for card-mode implementations. But Alex is eager to
get the built-in 100BT working and will hack at this some more...


> o Before generic PCI  bus walk occurs card-mode dino support must
>   program PCI_INTERRUPT_LINE of each PCI device below it.
>   Firmware does this for PCI devices below built-in Dino.
>   For now, this can be a simple none-recursive bus walk since
>   very few people will have the card-mode expansion chassis (which
>   uses PCI-PCI bridges).
>   I'll take care of it this week but just wanted it noted in case
>   anyone wonders why card-mode interrupts don't work now.

This issue is still outstanding too.

Requires code be added to pcibios_fixup_bus() and applies to both
built-in and card-mode Dino busses. So PCI line interrupts won't work
until this is fixed or the driver is temporarily kluged to hardcode
the virtual IRQ number.

Where is the tree now?

The kernel is data page faulting on both 715 and A-class with:

...
VFS: Mounted root (ext2 filesystem).
Warning: unable to open an initial console.
It's for the PA-RISC!
It's executable!
It has an appropriate version!
The checksum checks out!
Well, it *smells* like a valid SOM executable
interrupted with code 15, regs c00749ec
 IAOQ: c003fa10 c003fa14
 ior 20000028

PSW  : 0006ff0b  GR 1 : c010a800  GR 2 : c003ff50  GR 3 : 20000000  
GR 4 : 00000002  GR 5 : 00000005  GR 6 : 20000024  GR 7 : 20000018  
GR 8 : 20000000  GR 9 : c00747c0  GR10 : c00746c0  GR11 : 0000000a  
GR12 : ffffffff  GR13 : fdffffff  GR14 : 000000fd  GR15 : f0100000  
GR16 : f00008e8  GR17 : f000009c  GR18 : 00000020  GR19 : 00000018  
GR20 : 0000000c  GR21 : c0074000  GR22 : 20100000  GR23 : c0074000  
GR24 : c0074740  GR25 : c01810e0  GR26 : c0074488  GR27 : c0070000  
GR28 : 20000000  GR29 : 000000f5  GR30 : c0074b40  GR31 : c0024320  
SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  
IAOQ : c003fa10 c003fa14
SHR 1: 50000800  SHR 8: 00000008  SHR 9: c00d0000  SHR16: c00749ec  
SHR17: f000009c  SHR24: ffffffff  SHR25: 00000001  
d_p_f c00749ec 0000000f 20000028
returning c00749ec
...


IAOQ:
0xc003fa10?i
create_som_tables+60:           STWS,MB         r8,4(r6)

GR2:
0xc003ff50?i
load_som_binary+240:            STW             r28,256(r7)


grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
