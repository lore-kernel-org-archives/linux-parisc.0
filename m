From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] parisc: pci memory bar assignment fails with 64bit
 kernels on dino/cujo
Date: Sun, 13 Aug 2017 18:21:59 +0200
Message-ID: <20170813162159.GA2779@alpha.franken.de>
References: <20170812214418.DB60D50835D@solo.franken.de>
 <49d641cb-78be-e1fc-9c72-c8deefee6177@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49d641cb-78be-e1fc-9c72-c8deefee6177@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 13, 2017 at 09:56:26AM +0200, Helge Deller wrote:
> Does it mean that your mach64 card will then generally not being
> able to work on a 32bit kernel (due to PCI resource shortage) ?

no, it works 32bit on a B180, but I only tried 64bit kernel on the
C360.

> Now, if we find the issue why the FireGL cards don't work accelerated
> on the C8000 it would be great.

that's my final goal. My next step is to see whether I could get cards
working, which are supported by drivers/video/fbdev/aty/radeon*
This driver is known to work big endian, so I don't have to wonder
about endian issues in the first place...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
