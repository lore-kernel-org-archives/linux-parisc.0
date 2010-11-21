From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [RFT] irq changes (was Re: [git] parisc: Changes to ref
 refs/heads/parisc)
Date: Sat, 20 Nov 2010 19:25:31 -0500
Message-ID: <20101121002531.GL22651@bombadil.infradead.org>
References: <201010140531.o9E5VRYK010123@hera.kernel.org>
 <20101014153931.GI24144@bombadil.infradead.org>
 <4CE04DCF.7040306@gmx.de>
 <20101115195606.GA8332@bombadil.infradead.org>
 <4CE8453C.5020106@gmx.de>
 <1290290759.3000.10.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1290290759.3000.10.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Nov 20, 2010 at 04:05:59PM -0600, James Bottomley wrote:
> commit ba20085c20f1c9e8af546dea6ad0efa421bdef32
> Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
> Date:   Wed Oct 13 21:00:55 2010 -0400
> 
>     parisc: lay groundwork for killing __do_IRQ
> 
> But I haven't found the fix yet ... the commit looks to be an equivalent
> transformation.
> 

The only obvious thing that jumps out is that... no, set_irq_chip
doesn't look to be doing anything awry.

But it must be something between what a 'raw' irq_desc looks like, and
what the helpers initialize them to.

--Kyle

