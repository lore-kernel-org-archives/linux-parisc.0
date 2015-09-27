From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH v2][RFC] parisc: Change L1_CACHE_BYTES to 16
Date: Sun, 27 Sep 2015 09:17:36 -0700
Message-ID: <1443370656.2222.3.camel@HansenPartnership.com>
References: <42430464-867C-4E0B-8E95-C6CDB6D8A0B2@bell.net>
	 <32A3BF6F-B243-4AD4-9AE9-A5F9DAE0270A@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <32A3BF6F-B243-4AD4-9AE9-A5F9DAE0270A@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2015-09-27 at 12:07 -0400, John David Anglin wrote:
> On 2015-09-26, at 11:38 AM, John David Anglin wrote:
> 
> > The attached change reduces L1_CACHE_BYTES from 32 on PA1.1 and 64 on PA2.0 to 16.
> > 
> > This is based on examination of the L1 cache design for the PA-8700 processor where it can
> > be seen the processor loads two double words per cycle.  This line length is consistent with the
> > original alignment requirement for the ldcw instruction.
> > 
> > Thus, we need to distinguish between the L1 and L2 (SMP) cache line lengths.
> > 
> > The attached change bumps SMP_CACHE_BYTES to 128 bytes as this is the line length used
> > on PA-8800 and PA-8900 processors.  This increases the overall kernel size somewhat but seems
> > logically correct.
> 
> 
> Slight tweak to previous.  This version only bumps SMP_CACHE_BYTES when CONFIG_SMP
> is defined.

What makes you think we need SMP_CACHE_BYTES to be different from
L1_CACHE_BYTES?  No other architecture does this.  The theory that gives
us two defines was that some SMP systems would arbitrate for memory at
geater than cache line offsets but, in practise, none does because
that's the level at which the cross CPU memory ownership model works
anyway.

James


