Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D15B482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Oct 2001 22:50:49 -0600 (MDT)
Received: (from grundler@localhost)
	by puffin.external.hp.com (8.9.3/8.9.3) id WAA03931
	for parisc-linux@lists.parisc-linux.org; Thu, 18 Oct 2001 22:47:27 -0600
Date: Thu, 18 Oct 2001 22:47:27 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Message-Id: <200110190447.WAA03931@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] ide_intr() code review
List-ID: <linux-parisc.vger.kernel.org>

Hey, 
trivial thing that's not really a bug.

linux/spinlock.h:#define spin_lock_irqsave(lock, flags)               do { local_irq_save(flags);       spin_lock(lock); } while (0)

asm-parisc/system.h:#define local_irq_save(x) \
        __asm__ __volatile__("rsm %1,%0" : "=r" (x) :"i" (PSW_I) : "memory" )

/*
 * entry point for all interrupts, caller does __cli() for us
 */
void ide_intr (int irq, void *dev_id, struct pt_regs *regs)
{ 
...
        spin_lock_irqsave(&io_request_lock, flags);


is __cli() being done twice?

It just seems wrong to be calling spin_lock_irqsave() from
the interrupt handler.

grant
