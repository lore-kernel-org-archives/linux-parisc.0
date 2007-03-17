From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [PATCH] limit thread stack size with >4K pages
Date: Sat, 17 Mar 2007 12:23:32 -0400
Message-ID: <20070317162332.GB10950__24221.719420939$1416624329$gmane$org@athena.road.mcmartin.ca>
References: <200703171323.06002.deller@gmx.de> <1174139264.3476.1.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@mcmartin.ca>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <kyle@athena.road.mcmartin.ca>
In-Reply-To: <1174139264.3476.1.camel@mulgrave.il.steeleye.com>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 17, 2007 at 08:47:44AM -0500, James Bottomley wrote:
> That's a bit ugly ... and would break if someone added new page sizes.
> Can't we do something like
> 
> #if PAGE_BITS > 16
> #define THREAD_ORDER 0
> #else
> #define THREAD_ORDER (16 - PAGE_BITS)
> #endif
> 

Nice.
