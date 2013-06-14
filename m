From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Fri, 14 Jun 2013 10:39:22 +0200
Message-ID: <20130614083922.GC5391@alpha.franken.de>
References: <20130614071142.GB10443@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130614071142.GB10443@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 14, 2013 at 09:11:42AM +0200, Helge Deller wrote:
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> The LMMIO length reported by PAT and the length given by the LBA MASK
> register are not consistent. This leads e.g. to a non-working ATI FireGL
> card with the radeon DRM driver since the memory can't be mapped.
> 
> Fix this by correctly adjusting the resource sizes.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

add my Acked-By or Signed-off-by, whatever you like.

BTW. thanks for cleaning up the patches.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
