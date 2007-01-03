From: Christoph Lameter <clameter@sgi.com>
Subject: Re: [RFC][PATCH] use cycle_t instead of u64 in struct time_interpolator
Date: Wed, 3 Jan 2007 09:46:19 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0701030942160.7909__13998.3198758729$1416624250$gmane$org@schroedinger.engr.sgi.com>
References: <200701022233.25697.deller@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <christoph@schroedinger.engr.sgi.com>
In-Reply-To: <200701022233.25697.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 2 Jan 2007, Helge Deller wrote:

> As far as I could see, this patch does not change anything for the 
> existing architectures which use this framework (IA64 and SPARC64), 
> since "cycles_t" is defined there as unsigned 64bit-integer anyway 
> (which then makes this patch a no-change for them).

The 64bit nature of some entities was so far necessary to get the 
proper accuracy of interpolation. Maybe it can be made to work with 32 bit 
entities. The macro GET_TI_SECS must work correctly and the less bits are 
specified in shift the less self-tuning accuracy you will get.
