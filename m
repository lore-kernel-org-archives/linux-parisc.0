Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE83A482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Mar 2001 00:01:43 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14h4Wy-0004lK-00; Sun, 25 Mar 2001 08:01:40 +0100
Date: Sun, 25 Mar 2001 08:01:40 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: rbradetich@uswest.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Additional PDC cleanups
Message-ID: <20010325080140.F31126@parcelfarce.linux.theplanet.co.uk>
References: <20010324154419.A18097@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010324154419.A18097@beavis.ybsoft.com>; from rbrad@beavis.ybsoft.com on Sat, Mar 24, 2001 at 03:44:19PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 24, 2001 at 03:44:19PM -0700, Ryan Bradetich wrote:
> My first thoughts were to make the STI_CALL function look like this:
> 
> #define STI_CALL(func, flags, inptr, outptr, glob_cfg) \
> 	({	 						\
> 		pdc_sti_call( func, (unsigned long)STI_PTR(flags), \
> 				    STI_PTR(inptr), STI_PTR(outptr), \
> 				    glob_cfg); \
> 	})
> 
> and define the pdc_sti_call in firmware.c.  Anyone have a different
> approach that would make more sense? 

Makes sense.  you might want to remove the cast and do it inside
pdc_sti_call.  every time i look at the sti code, i have to resist the
urge to rip it into tiny pieces and redo it :-)

> +/*
> + * pdc_putc:
> + * Console character print using IODC.
> + *
> + * Note that only these special chars are architected for console IODC io:
> + * BEL, BS, CR, and LF. Others are passed through.
> + * Since the HP console requires CR+LF to perform a 'newline', we translate
> + * "\n" to "\r\n".
> + */

This is so close to being kernel-doc it seems foolish not to go the
whole hog.

/**
 * iodc_putc - Console character print using IODC.
 * @c: the character to output.
 * 
 * Note that only these special chars are architected for console IODC io:
 * BEL, BS, CR, and LF. Others are passed through.
 * Since the HP console requires CR+LF to perform a 'newline', we translate
 * "\n" to "\r\n".
 */

-- 
Revolutions do not require corporate support.
