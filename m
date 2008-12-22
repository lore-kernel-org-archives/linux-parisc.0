From: Kyle McMartin <kyle@infradead.org>
Subject: Re: HPMC bus timeout on C3600
Date: Mon, 22 Dec 2008 16:47:43 -0500
Message-ID: <20081222214743.GC30144@bombadil.infradead.org>
References: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be> <20081220221653.GA12880@bombadil.infradead.org> <20081220222100.GB12880@bombadil.infradead.org> <20081221081206.GC2047@colo.lackof.org> <20081222224023.2488f2ef@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Kyle McMartin <kyle@infradead.org>,
	linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081222224023.2488f2ef@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 22, 2008 at 10:40:23PM +0100, Guy Martin wrote:
> 
> Kyle, Grant,
> 
> Thanks for your help but being unable to reproduce the issue at will
> makes it very difficult to make any progress. The fault didn't occurred
> those past two days.
> 
> So I decided to go another way. I've plugged in one of my well working
> sata card and did a lot of IO using "dd if=/dev/zero of=/dev/sdc".
> 
> I'm not sure if this would trigger the same problem but it does trigger
> an HPMC Bus timeout too after a few hundreds megs. This time, the PCI
> slot pointed by the output is the sata card itself in slot 4.
> Regarding GR02, it seems to point somewhere in user space.
> 
> Regarding Kyle's patch, it didn't changed anything but since the fault
> isn't at inw(), I'm not sure it still even makes sens to apply it.
> 

you won't know for sure, since readl/etc are inlines into the caller...
