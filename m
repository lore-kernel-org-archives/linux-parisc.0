Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA29019
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Oct 2000 19:40:14 -0600
From: Helge Deller <deller@gmx.de>
Date: Wed, 18 Oct 2000 03:41:22 +0200
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: <parisc-linux@thepuffingroup.com>
To: parisc-linux <parisc-linux@thepuffingroup.com>
References: <200010160432.VAA11300@milano.cup.hp.com> <003d01c0500a$167a9040$a832d793@esiee.fr>
In-Reply-To: <003d01c0500a$167a9040$a832d793@esiee.fr>
MIME-Version: 1.0
Message-Id: <00101803412200.00279@P100>
Subject: [parisc-linux] /proc/interrupts
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I just committed changes, which fills in i386-compatible 
interrupt-information into /proc/interrupts.

During the changes I inserted the constants IRQ_PER_REGION and 
IRQ_REGION_SHIFT into asm-parisc/irq.h, which would allow us to reduce the 
needed amount of static memory for the interrupt routing tables.

This change has following effects:
1. The until now used virtual IRQ's gets new numbers and increments in every 
region by 32 for parisc32 and 64 for parisc64. The old IRQ regions 
incremented by 256.
2. since we now shift by values of 5 (parisc32) or 6 (parisc64) bits, the 
time needed to calculate the offsets may have changed. This needs to be 
inspected.
3. the new algorithm needs less memory than before.

By default I left the current behaviour in CVS, but you may activate the new 
algorithm by changing the "#if 0" to "#if 1" in asm-parsic/irq.h and tell me 
what you think.

Thanks,
Helge.
