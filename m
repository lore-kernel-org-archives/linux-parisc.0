From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [RFT] irq changes (was Re: [git] parisc: Changes to ref
 refs/heads/parisc)
Date: Mon, 15 Nov 2010 14:56:06 -0500
Message-ID: <20101115195606.GA8332@bombadil.infradead.org>
References: <201010140531.o9E5VRYK010123@hera.kernel.org>
 <20101014153931.GI24144@bombadil.infradead.org>
 <4CE04DCF.7040306@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CE04DCF.7040306@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Nov 14, 2010 at 09:59:59PM +0100, Helge Deller wrote:
> 
> I just got again a chance to boot up my b160L and 715/64 machines.
> 
> Both broke due to the IRQ changes. I did reverted all of your IRQ
> patches (based on current Linus head branch) and now they boot
> again.
> Basically they just hang during the SCSI initialization (timeouts
> while detectings discs).
> 
> So, there is something wrong for Lasi/GSC and Dino busses....
> 
> Any idea?
>

No, but I'll take a look, it's probably something simple and stupid that
I missed. :/

--Kyle
