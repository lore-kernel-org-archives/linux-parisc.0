From: "Matt Carlson" <mcarlson@broadcom.com>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Mon, 13 Apr 2009 11:37:25 -0700
Message-ID: <20090413183725.GC11109@xw6200.broadcom.net>
References: <1239636110.3278.29.camel@mulgrave.int.hansenpartnership.com>
 <20090413180052.GB11076@xw6200.broadcom.net>
 <1239646516.3278.57.camel@mulgrave.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Cc: "Matthew Carlson" <mcarlson@broadcom.com>,
	"linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	"Parisc List" <linux-parisc@vger.kernel.org>,
	"Michael Chan" <mchan@broadcom.com>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1239646516.3278.57.camel@mulgrave.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Apr 13, 2009 at 11:15:16AM -0700, James Bottomley wrote:
> On Mon, 2009-04-13 at 11:00 -0700, Matt Carlson wrote:
> > Hi James.  I'd like to think about this some more before we apply it.  I
> > investigated this problem using a 5703 on a SPARC Ultra 10, and all my
> > assumptions checked out.
> 
> Um, I think you'll find the SPARC has a special routine for extracting
> the MAC address from Open Firmware, so it doesn't exercise the NVRAM
> path.

Yes, it does.  The driver moves beyond that point because the routine
fails on this system.  (It's really old and doesn't have a Broadcom LOM
on it.)

> >   I don't dispute that you and Robin are having
> > a problem.  I just don't understand where the root cause of the problem
> > is yet.  Stay tuned.
> 
> The root cause is basically that if you get the MAC from NVRAM into two
> native 32 bit words, you have to be careful about how you convert them
> to a byte stream for the MAC address.  You can't use a memcpy from the
> native number to the MAC because it's not endian invariant (it copies
> the numbers the opposite ways around on big and little endian boxes).
> 
> James

But that is exactly what the code is doing.  tg3_nvram_read_be32() will
return the data in bytestream format.  A memcpy() should be all that is
needed to transport the data to a different memory location.

