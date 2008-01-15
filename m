From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Any idea why gcc "discards qualifiers from pointer target type"?
Date: Tue, 15 Jan 2008 05:31:14 -0700
Message-ID: <20080115123114.GX18741@parisc-linux.org>
References: <JUOL5D$C964A06D0284BFBD2341C0E52FF636D0@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <JUOL5D$C964A06D0284BFBD2341C0E52FF636D0@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jan 15, 2008 at 11:29:37AM +0100, rubisher wrote:
> Hello Dave,
> 
> Compiling p-l with gcc-4.2 I see new warning "discards qualifiers from pointer
> target type":

Joel, this is a standard C question ... this list really isn't for
teaching people how to program.

> /SRCTREE/drivers/net/lib82596.c:388: warning: passing argument 2 of
> 'dma_cache_sync' discards qualifiers from pointer target type

You're passing a volatile pointer to a function which is expecting a
non-volatile pointer.  That's potentially dangerous, so gcc warns about
it.

The normal way to fix this would be to add a volatile attribute to the
argument in question:

dma_cache_sync(struct device *dev, volatile void *vaddr, size_t size,
               enum dma_data_direction direction)

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
