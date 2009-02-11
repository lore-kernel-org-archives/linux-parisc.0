From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Hacking SuperDome
Date: Wed, 11 Feb 2009 10:02:32 -0700
Message-ID: <20090211170232.GA4644@colo.lackof.org>
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

I only check the "ser pim" output at PDC prompt.
I don't know any other reliable way. Even with HPUX.

grant

> 
> I've done some hacking yesterday and it looks like the basic
> problem is, that REO isn't handled properly. As a start it would
> be good to know, if the used IOC_IKE_OFFSET in sba_iommu.c is really
> correct...
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessary a
> good idea.                                                [ RFC1925, 2.3 ]
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
