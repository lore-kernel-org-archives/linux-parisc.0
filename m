Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maila.telia.com (maila.telia.com [194.22.194.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99E36482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Nov 2001 14:28:28 -0700 (MST)
Date: Sun, 4 Nov 2001 22:28:24 +0100
From: Daniel Engstrom <5116@telia.com>
To: parisc-linux@lists.parisc-linux.org
Cc: 5116@telia.com
Message-ID: <20011104222824.O2303@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Some Questions...
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello all, 

I have some qustions regarding the EISA support and other stuff.

1) Non sharable interrupts
ISA IRQ are edge triggered and inherently un-sharable. Should 
there be a flag-field attached to the irq region struct which
reports the sharability of an irq?

2) ISR Re-entrance
I think that an IRQ manager needs to mask the IRQ while serviceing it
to avoid reentring the ISR(s). Is this done for non-EISA irq manager on 
palinux?

3) String I/O implementation
The string I/O functions (insl/outsl and friends) are implemented in 
terms of inl/outl and so on. This means that the HPA switch code in 
arch/parisc/kernel/pci.c is executed once per word in the transfer.
If the pci_hba_data struct had entries for these the test would have 
been done outside of the loop.

4) EISA EEPROM format
I have not yet fully understood the fromat of the EISA configuration 
EEPROM located on the system board. 
Could anyone fill-in with how the EISA slot configuration space should be 
decoded. I have figured out the general header and the fixed part of the 
per-slot structure.

5) EISA Memory Mapping/DMA stuff
I'd like to make something here too, any pointer to how to proceed?
What I thnk I have figured out is the following:
It seems like that from the EISA side the window is 4MB starting at 
1MB. From the host side the window seem to start at 0xfc100000 and be 
1.75MB in size.
How is the window controlled?

/Daniel

-- 
