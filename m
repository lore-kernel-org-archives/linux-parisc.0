Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA16403
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Aug 1999 18:47:59 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA09566
	for <parisc-linux@thepuffingroup.com>; Wed, 25 Aug 1999 17:49:26 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id RAA11578 for <parisc-linux@thepuffingroup.com>; Wed, 25 Aug 1999 17:49:54 -0700 (PDT)
Message-Id: <199908260049.RAA11578@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Wed, 25 Aug 1999 14:15:47 PDT."
             <37C432D3.C9BC0D7F@thepuffingroup.com>
Date: Wed, 25 Aug 1999 17:49:54 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] Thoughts on arch/parisc/irq.c
List-ID: <linux-parisc.vger.kernel.org>


linux/arch/parisc/kernel/irq.c:irq_alloc()/request_irq() seems to be
the method to allocate EIRR bits and register ISRs with PA ext_intr
handler. Dino will call this to initialize it's own EIM register (IAR0).
But to program IAR0 Dino also needs the processor HPA of whatever
processor it is supposed to interrupt.
Is there an interface to return HPAs?

(BTW - anyone else modifying gecko/dino.c?)

Support for PCI 2.2 Message Signalled Interrupts requires
a similar interface - Dino can support this if the interface
were present and PCI drivers wanted to use it.


More thoughts on basic PA interrupt handling:

o Do GBD or other psuedo drivers need to reserve EIRR bits?
  Ie soft interrupts to reschedule work at lower SPL levels.

o associating SPL levels to specific EIRR bits allows changing SPL
  much faster. ie. if EIRR bit 1 is used for SPL2, then setting
  bit 1 in the SPL5 bit mask to disable EIRR bit 1 from generating
  an interrupt makes it very easy to change from SPL2 to SPL5.
  Eg. SPLHI just disables all EIRR bits.

o PA2.0 architecture defines EIRR to be 64-bits wide.
  irq_alloc() and request_irq() hard code 31.
  Using a #define with "ifdef" around it for 32/64 bit
  differences would be better. Just trying to make the
  transition that direction easier.

o Each processor can have it's own EIRR switch table.
  Thus, "irq_action[]" could be an an array hanging off a per processor
  data structure. This is interesting for large configurations where
  the 31 bits aren't enough and sharing isn't supported.

o EIRR bits can be shared just like IRQ lines. A wrapper gets
  put into the irq_action[] field when sharing is required
  (eg run out of EIRR bits to hand out). The wrapper function
  simple calls all ISR's registered for a given EIRR bit.
  This can be ignored for now since A-class/712/715 etc
  configurations probably won't need this.

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
