Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B927482A
	for <parisc-linux@parisc-linux.org>; Fri, 12 Oct 2001 03:00:59 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 56F58B00C; Fri, 12 Oct 2001 10:01:49 +0100 (BST)
Date: Fri, 12 Oct 2001 10:01:49 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011012100149.Q11105@linuxcare.com>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <20011012074449.E25868@parcelfarce.linux.theplanet.co.uk> <20011012094719.P11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011012094719.P11105@linuxcare.com>; from rhirst@linuxcare.com on Fri, Oct 12, 2001 at 09:47:19AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Oct 12, 2001 at 09:47:19AM +0100, Richard Hirst wrote:
> On Fri, Oct 12, 2001 at 07:44:49AM +0100, Matthew Wilcox wrote:
> > 
> > OK, just committed 2.4.9-pa49 which makes my hp100 EISA card work:
> > 
> > 64 bytes from 15.1.50.0: icmp_seq=1 ttl=255 time=0.5 ms
> > 
> > Haven't made any effort to support busmastering cards yet, but having
> > ioports, iomem & interrupts working should allow most cards to function.
> 
> Still can't get any interrupts out of my EISA scsi card in 715/75.

I tried adding a handler for irq 81 (64 + 17), as you said that was
asp error, at the end of asp_init_chip().

        request_irq(81, asp_error, 0, "asp error", asp);

That handler gets called as soon as it is registered.  Is it likely that
EISA interrupts are blocked until that error is cleared down somehow?

Richard
