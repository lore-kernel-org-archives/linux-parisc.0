Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 384364830
	for <parisc-linux@parisc-linux.org>; Fri,  5 Oct 2001 15:58:16 -0600 (MDT)
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200110052158.OAA06081@opus.allegro.com>
Subject: Re: [parisc-linux] pdc_add_valid
To: willy@debian.org (Matthew Wilcox)
Date: Fri, 5 Oct 2001 14:58:13 -0700 (PDT)
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20011005172222.D19206@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Oct 05, 2001 05:22:22 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

>         if (!pdc_add_valid( (void *)(port+4))) {
> 
> Which says to me `if this address is not valid' -- the opposite of what it
> does.  It could be rewritten as:

Very good point.

Code should be readable first, and efficient second.

Routines that work the opposite of their name are just problems
waiting to happen.
 
> 	if (valid_io_addr (port+4)) {
vs:
> +       return (pdc_add_valid (addr) == PDC_OK);

The latter has the advantage that the reader knows it's a PDC
routine being called, not some kernel routine that could be done
who knows what.

Thus, I'd go for the latter, or change your "valid_io_addr" to
"pdc_valid_io_addr", to (a) be readable; and (b) convey the PDC info.

Stan (still can't believe HP-UX uses non-compatible "sprintf" in the kernel) Sieler
