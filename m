Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96A11482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 May 2001 13:27:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 152e4L-0003XI-00; Wed, 23 May 2001 20:13:17 +0100
Date: Wed, 23 May 2001 20:13:17 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: John Marvin <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic
Message-ID: <20010523201317.X23718@parcelfarce.linux.theplanet.co.uk>
References: <200105230853.CAA07709@udlkern.fc.hp.com> <200105231859.MAA00753@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105231859.MAA00753@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Wed, May 23, 2001 at 12:59:57PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 23, 2001 at 12:59:57PM -0600, Grant Grundler wrote:
> Exactly. But if the driver is mucking with IRQ enable/disable,
> does that mean the enable/disable code has to keep reference counts?
> Don't recall any archs doing that when we did the initial implementation. 

cli -> disables irqs on all processors
__cli -> disables irqs on local processor
sti -> enables irqs on all processors
__sti -> enable irqs on local processor

spin_lock_irqsave -> disables interrupts locally, puts the previous
state into the state variable you supplied and acquires the spinlock
spin_lock_irqrestore -> releases the spinlock and restores previous
state from state variable

no need to keep enable/disable counts, the previous state gets stored
for you.  if you're using cli and sti inappropriately, you lose.

-- 
Revolutions do not require corporate support.
