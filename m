Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03343482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 10:42:07 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14kTsS-0001K0-00; Tue, 03 Apr 2001 17:41:56 +0100
Date: Tue, 3 Apr 2001 17:41:56 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] request_region()
Message-ID: <20010403174156.U11435@parcelfarce.linux.theplanet.co.uk>
References: <20010403001114.F9198@linuxcare.com> <200104030306.VAA10572@puffin.external.hp.com> <20010403100502.K9198@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010403100502.K9198@linuxcare.com>; from rhirst@linuxcare.com on Tue, Apr 03, 2001 at 10:05:02AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 03, 2001 at 10:05:02AM +0100, Richard Hirst wrote:
> Yep, that make sense.  Does mean sim700.c will have to make runtime
> decisions whether to use raw_read (for the on-board 53c700) or inb
> (for one on an EISA card), on my 715, but that is no big deal.

i think sim700.c should be using ioremap / readX / writeX instead
of raw_read.  Is the EISA scsi really only accessible via port io?
I would have throught that it would be memory mapped, in which case
there's no need to have a macro to access it.

> EISA allocates 0x1000 bytes per slot, with a four (?) byte signature
> at offset 0xc80 (IIRC) to identify the cards.  At least, that is
> how my old Compaq works, with first slot at 0x1000.  Seems to tie
> up address-wise, at least:
> 
> 10. Scorpio Sr. EISA BA (11) at 0xfc000000, versions 0x19, 0x0, 0x76, 0x0, 0x0
> 11. Unknown device (10) at 0xfc001000, versions 0x0, 0x0, 0xfff, 0x0, 0x0

That seems to indicate memory mapped IO...

> Again, IIRC, last time I played with the EISA slot on my 715 I
> found the EISA 53c700 couldn't access main memory, and EISA interrupts
> were not routed to the CPU.  The driver could access the chip registers
> though.  But that was all a long time ago, so things may be different
> now.

How BugFree(TM) do we think the Wax driver is?

-- 
Revolutions do not require corporate support.
