Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E55E4A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 11:11:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Vdjp-0000gV-00; Wed, 21 Feb 2001 11:11:41 -0700
Date: Wed, 21 Feb 2001 11:11:41 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: arjanv@redhat.com
Cc: parisc-linux@parisc-linux.org
Message-ID: <20010221111141.H31164@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Prefetch macros for PA-RISC
List-ID: <linux-parisc.vger.kernel.org>

on PA, we have prefetch for read and prefetch for write.  They're encoded
as loads to the 0 register.  prefetch read is ldd (load 64-bit quantity)
and prefetch-write is ldw (load 32-bit quantity).

Off the top of my head, untested (and someone on the list please correct
me if I'm wrong):

#define prefetch_read(addr) __asm__("ldd 0(%%sr0, %0), %%r0" : : "r" (addr))
#define prefetch_write(addr) __asm__("ldw 0(%%sr0, %0), %%r0" : : "r" (addr))

i think these are only defined for PA 2.0, so we might need to be more
clever than this.

-- 
Revolutions do not require corporate support.
