Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B8EB4857
	for <parisc-linux@parisc-linux.org>; Thu, 11 Oct 2001 02:14:04 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 717CBB00C; Thu, 11 Oct 2001 09:15:00 +0100 (BST)
Date: Thu, 11 Oct 2001 09:15:00 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011011091500.I11105@linuxcare.com>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <20011010134526.F11105@linuxcare.com> <20011010152807.C24923@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011010152807.C24923@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 10, 2001 at 03:28:07PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 10, 2001 at 03:28:07PM +0100, Matthew Wilcox wrote:
> Alternatively, we could hack the 53c710 script to generate CPU interrupts
> directly :-)  Let me just document how that would work (Grant, please
> correct me if I misunderstood):
> 
> Instead of generating a PCI/EISA interrupt, generate a write of an
> allocated value to the CPU's EIRR (External Interrupt register).
> This way, the CPU jumps straight to the scsi chip's interrupt handler
> rather than Asp's, which then has to decode which Asp IRQ it was;
> then jump to the EISA interrupt handler, decode which EISA IRQ it was,
> finally calling the scsi interrupt handler.

If we make the scsi script do that, the scsi chip wont realise it
has generated an interrupt, so wont stop processing scripts.  The
driver expects th chip to be halted when the int handler is called.
If we had a driver specific to the 53c710 where the scsi script managed
queues of requests itself, there might be scope for emulating an
INTFLY instruction (which is found on newer chips) that way.  The
53c700 doesn't have the capability of writing memory locations from
script.

Richard
