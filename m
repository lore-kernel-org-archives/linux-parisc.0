Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta06ps.bigpond.com (unknown [144.135.25.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F806492B
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 05:01:34 -0600 (MDT)
Received: from bubble.local ([144.135.25.78]) by
          mta06ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GKZLKS00.IW7 for <parisc-linux@parisc-linux.org>; Wed, 10 Oct
          2001 21:07:40 +1000
Date: Wed, 10 Oct 2001 20:31:10 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: "Michael S. Zick" <mszick@pflash.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011010203110.S1100@bubble.sa.bigpond.net.au>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <01101003320900.00964@Wolf-01>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01101003320900.00964@Wolf-01>; from mszick@pflash.com on Wed, Oct 10, 2001 at 03:32:09AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 10, 2001 at 03:32:09AM -0500, Michael S. Zick wrote:
> 
> Old ISA boards only do a 10-bit decode and it is a frequent occurance
> that old drivers don't "clean up" the unused high 6 bits.
> 
> Would it be reasonable to mask port numbers to 10 bits for ISA in the
> inb/outb routines?

No.  Some old ISA boards do decode the top bits, and actually use them.
