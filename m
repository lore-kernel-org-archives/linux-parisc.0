From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 11:18:21 -0500
Message-ID: <1247242701.3936.28.camel@mulgrave.site>
References: <20090710155559.CFAA44FC4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Grant Grundler <grundler@parisc-linux.org>,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090710155559.CFAA44FC4@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2009-07-10 at 11:55 -0400, John David Anglin wrote:
> > But I'm still wondering what the effect of this bug will be.
> > The first order (not setting U-bit) should only affect ZX1 (pa8800/pa8900)
> > machines. Those have uncacheable IO space between 2GB-4GB physical address.
> > My guess is the machines should HPMC since the CPU would attempt to access
> > those ranges as a cacheline read/write instead of sub-cacheline transactions.
> 
> I think the depdi change may fix the random memory corruption that
> I have been complaining about.  My rp3440 has got through a full build
> of GCC with 2.6.30.1.  Previous two attempts failed with segmentation
> faults in the dynamic loader, one of which I reported on.  It will
> take a few more builds to be sure.  Your comment would explain why I
> don't see this on c3750.  Could this affect PA8700?

In theory it would affect every box running a 64 bit kernel.  We
actually set PAGE_NO_CACHE on ioremaps(), so it's spreading out from the
PCI device space.

> I installed the change on my rp3440, c3750 and gsyprf11 last night.
> At some point, I need to test the change with an SMP build on the rp3440.

rp3440 is a pa88/8900 system?  We have ion in the test ring at
cupertino, it's a 4 CPU pa8900 ... I've been keeping it up to date with
debian testing.

> There is one other issue that I see on the rp3440 which I don't see
> on the c3750 or gsyprf11.  I get occassional testsuite timeouts during
> compilation on compilations that shouldn't timeout.  I had always
> thought this to be a tcl/expect issue, but now I think this is likely
> a kernel issue.  I need to change the timeout value in the testsuite
> to something big so I can see what's happening.

It sounds a bit like another caching issue ... perhaps a cached value
for a spinlock or futex making the thread thing the lock is held against
it when it isn't?

James


