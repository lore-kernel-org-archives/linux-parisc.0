Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA20403
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Oct 1999 17:09:56 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id TAA24905
	for <parisc-linux@thepuffingroup.com>; Sun, 3 Oct 1999 19:29:20 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37F7E6CF.F781614F@thepuffingroup.com>
Date: Sun, 03 Oct 1999 19:29:19 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Dino developments...
List-ID: <linux-parisc.vger.kernel.org>



I've fixed up a couple of things in the kernel:

- PCI bus walking happens in the *right place*, pci_init().

- I've fixed the inventory code to handle hversion_rev and sversion_rev

- Multiple Dinos are detected properly now

- Card Mode Dino now seems to work for bus walking, the MMIO is a whole
different story.

As a test, I packed in:
- a Symbios SCSI controller PCI card
- a GSC gigabit ethernet card (which uses a dino)
- another GSC gigabit ethernet card (which uses a dino)

(and if you're curious as to how I can pack three cards in an A class,
you'll have to visit Ottawa to see)

The output I get is:
Dino version 3.1 (bridge mode) found at
0xfff80000                              
Dino version 3.0/3.1 (card mode) found at
0xfff84000                            
Found a PCI device, and the vendor is 0x107e, device
0x3                        
Dino version 3.0/3.1 (card mode) found at
0xfff88000                            
Found a PCI device, and the vendor is 0x12ae, device
0x1                        
PCI: Probing PCI
hardware                                                       
Found a PCI device, and the vendor is 0x104b, device
0x8130                     
Found a PCI device, and the vendor is 0x1011, device
0x19                       

So the first PCI device found is an "Interphase" gigE thing that's not
in the PCI database, the second is an Alteon Acenic gigE, the third is
the Symbios SCSI card, and the last is the onboard DEC tulip.

- Alex


-- 
Alex deVries
Vice President of Engineering
The Puffin Group
