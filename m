From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Hacking SuperDome
Date: Wed, 11 Feb 2009 09:26:41 -0700
Message-ID: <20090211162641.GB3624@parisc-linux.org>
References: <20090207142906.GA8553@alpha.franken.de> <20090211072312.GA19531@colo.lackof.org> <20090211100052.GA6371@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090211100052.GA6371@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 11, 2009 at 11:00:52AM +0100, Thomas Bogendoerfer wrote:
> On Wed, Feb 11, 2009 at 12:23:12AM -0700, Grant Grundler wrote:
> > > First guess would be some PCI setup issues... Any hints ?
> > 
> > Look for HPMC's. The console can't keep up with the kernel in general.
> > When an HPMC occurs, some of the output can get stranded.
> 
> never saw an HPMC, but I'm sure it's because lots of output gets lost...
> 
> I've done some hacking yesterday and it looks like the basic
> problem is, that REO isn't handled properly. As a start it would
> be good to know, if the used IOC_IKE_OFFSET in sba_iommu.c is really
> correct...

I've worked my contacts who're still at HP, and can confirm that REO is
basically the same as IKE.  While the terminology has changed, function
0 is the SBA, function 2 is IOC 0 and function 3 is IOC 1, just as with
Ike.  The Rope Control registers are offset in the 0x200 range, the
IOTLB registers are in the 0x300 range and ROPE_CONFIG is at 0x40.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
