Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 30 Sep 2001 14:35:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org,
	parisc-linux-cvs@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux tsbogend
Message-ID: <20010930143550.A6355@solo.franken.de>
References: <200109291642.KAA12575@puffin.external.hp.com> <20010930080143.A9242@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010930080143.A9242@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Sun, Sep 30, 2001 at 08:01:43AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 30, 2001 at 08:01:43AM +0100, Matthew Wilcox wrote:
> On Sat, Sep 29, 2001 at 10:42:33AM -0600, Thomas Bogendoerfer wrote:
> > Log message:
> > we need to flush pages used inside the kernel and passed to user processes
> > otherwise because of the virtual alias we get mixed writebacks.
> > FIMXE: flush_data_cache() isn't a very well optimized function for this
> > purpose
> 
> flush_dcache_page() is perhaps the function you are looking for?  I'm
> not sure I understand what the problem is since you didn't post a diff.

flush_kernel_dcache_page() works and it should even be the right fix.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
