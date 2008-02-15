From: "rubisher" <rubisher@scarlet.be>
Subject: Re: parisc compile error
Date: Fri, 15 Feb 2008 11:42:27 +0100
Message-ID: <JWA0ER$69F0160369E3E3D45E8196C6620D02EE@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "kyle" <kyle@parisc-linux.org>, "matthew" <matthew@wil.cx>,
	"grundler" <grundler@parisc-linux.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"rubisher" <rubisher@scarlet.be>
To: "kyle" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Feb 13, 2008 at 07:49:12AM +0100, rubisher wrote:
> > --- include/asm-parisc/pgtable.h.Orig	2007-10-22 08:19:20.000000000 +0000
> > +++ include/asm-parisc/pgtable.h	2008-02-12 16:28:36.000000000 +0000
> > +extern  void *vmalloc_start;
> > +#define PCXL_DMA_MAP_SIZE   (8*1024*1024)
> > +#define VMALLOC_START   ((unsigned long)vmalloc_start)
> > +/* this is a fixmap remnant, see fixmap.h */
> > +#define VMALLOC_END	(KERNEL_MAP_END)
> > +
> 
> i moved this to fixmap.h, since i think it makes more sense there,
> really.
> 
Nice to me too ;-)

(btw where can I grab your latest update. I didn't yet see in your git
linux-2.6-snaps or any other place I know)?

Tx,
    r.
---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/
