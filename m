Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7C954830
	for <parisc-linux@parisc-linux.org>; Fri,  5 Oct 2001 17:24:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15peKA-0005D9-00; Sat, 06 Oct 2001 00:24:10 +0100
Date: Sat, 6 Oct 2001 00:24:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: Stan Sieler <sieler@allegro.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] pdc_add_valid
Message-ID: <20011006002410.D3745@parcelfarce.linux.theplanet.co.uk>
References: <20011005172222.D19206@parcelfarce.linux.theplanet.co.uk> <200110052158.OAA06081@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110052158.OAA06081@opus.allegro.com>; from sieler@allegro.com on Fri, Oct 05, 2001 at 02:58:13PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Oct 05, 2001 at 02:58:13PM -0700, Stan Sieler wrote:
> > 	if (valid_io_addr (port+4)) {
> vs:
> > +       return (pdc_add_valid (addr) == PDC_OK);
> 
> The latter has the advantage that the reader knows it's a PDC
> routine being called, not some kernel routine that could be done
> who knows what.
> 
> Thus, I'd go for the latter, or change your "valid_io_addr" to
> "pdc_valid_io_addr", to (a) be readable; and (b) convey the PDC info.

I should have explained this in my original mail... the reason I don't
want to make this a pdc_* call is that I believe we have an expectation
that pdc_* calls return PDC_ error codes.  Perhaps this isn't an
expectation that people have, in which case I don't have an objection
to simply renaming pdc_add_valid to pdc_addr_valid, and changing the
sense of the return value.

-- 
Revolutions do not require corporate support.
