Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA16225
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 04:40:49 -0600
Message-ID: <20000518044034.B14031@puffin.external.hp.com>
Date: Thu, 18 May 2000 04:40:34 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Chris Snow <csnow@julian.uwo.ca>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 LAN interface
References: <Pine.LNX.4.21.0005172239190.1861-100000@boy.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0005172239190.1861-100000@boy.localdomain>; from Chris Snow on Wed, May 17, 2000 at 10:41:59PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> The documentation on LASI (lasi_ers.ps) seems to be specific to the
> 712.  But, AFAIK the 715 has the same ethernet (82596).  Is it safe to
> assume that the LAN section of lasi_ers.ps is equally applicable to the
> 715 interface, or is there some other documentation somewhere that I
> should consult ?

It basically is the same (we had it working.  if it doesn't now you're
probably reinventing the wheel), except that the paragraph in lasi_ers.ps
that reads

"	Even though the megacell is in CA mode, the port accesses look
	like the part is in DX mode: the data needs to be on the lower
	16 bits of the data bus for both port accesses.  This change
	should be sufficient to make the CA mode look like DX mode to
	software, maintaining software compatibility with previous 700
	implementations."

really means "we word-swap the CPU port register and didn't for previous
implementations.  This means you need to change your software or you'll
never even see the nic exists.".

translated to the wonderful language of 82596.c, the function that reads

static inline void MPU_PORT(struct net_device *dev, int c, volatile void *x)
{
#ifdef ENABLE_MVME16x_NET
        if (MACH_IS_MVME16x) {
                struct i596_reg *p = (struct i596_reg *) (dev->base_addr);
                p->porthi = ((c) | (u32) (x)) & 0xffff;
                p->portlo = ((c) | (u32) (x)) >> 16;
        }
#endif
#ifdef ENABLE_BVME6000_NET
        if (MACH_IS_BVME6000) {
                u32 v = (u32) (c) | (u32) (x);
                v = ((u32) (v) << 16) | ((u32) (v) >> 16);
                *(volatile u32 *) dev->base_addr = v;
                udelay(1);
                *(volatile u32 *) dev->base_addr = v;
        }
#endif
}

needs to do the word-swapping for 715/old, but doesn't for 715/new and 712.

(also it should use gsc_writel()).


Generally, 715/olds won't support the new dynamic PCI DMA API, while 712s
will.  My suggestion is that someone takes over the taks of maintaining
the drivers we actually need (82596, scsi, parallel if your masochistic),
using the old DMA API.  I personally will use my 715 as diskless dumb
terminal only if at all so I only care about 82596.

	Philipp Rumpf
