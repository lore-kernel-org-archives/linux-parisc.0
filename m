Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F8F5482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 16:33:57 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 165xvH-0001cR-00; Mon, 19 Nov 2001 23:33:55 +0000
Date: Mon, 19 Nov 2001 23:33:55 +0000
From: Matthew Wilcox <willy@debian.org>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Thomas Marteau <marteaut@esiee.fr>,
	grundler@puffin.external.hp.com, ryan_bradetich@uswest.net,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: E55 status
Message-ID: <20011119233355.B652@parcelfarce.linux.theplanet.co.uk>
References: <3B4396D8.9A33414F@gmx.at> <3BF4E38C.D59603FE@esiee.fr> <3BF98AD5.9BCB6861@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BF98AD5.9BCB6861@gmx.at>; from christoph.plattner@gmx.at on Mon, Nov 19, 2001 at 11:42:29PM +0100
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

Let's try a quick audit...

On Mon, Nov 19, 2001 at 11:42:29PM +0100, Christoph Plattner wrote:
> cvs server: Diffing .
> cvs server: Diffing Documentation

could you use the cvsrc distributed as part of build-tools?  it removes
this extra verbiage...

> +	/* wait for a keyboard (rs232)-input */
> +	do {
> +		unsigned long flags;
> +
> +		save_flags(flags);
> +		cli();
> +		status = real32_call(PAGE0->mem_kbd.iodc_io,
> +			(unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
> +			PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
> +			__pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
> +		restore_flags(flags);
> +		ch = *iodc_dbuf;	/* save the character directly to ch */
> +	} while (0) ;                   /* once !! */

please use spin_lock_irqsave/restore instead.

> #ifdef SERIAL_INLINE
> #define _INLINE_ inline
> #else
> #define _INLINE_
> #endif

i hate this.  all examples of this have been removed from our tree afaik..

have to go out now... back later.

-- 
Revolutions do not require corporate support.
