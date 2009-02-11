From: Kyle McMartin <kyle@infradead.org>
Subject: Re: Hacking SuperDome
Date: Wed, 11 Feb 2009 13:14:25 -0500
Message-ID: <20090211181425.GA27133@bombadil.infradead.org>
References: <20090207142906.GA8553@alpha.franken.de> <20090211072312.GA19531@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090211072312.GA19531@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 11, 2009 at 12:23:12AM -0700, Grant Grundler wrote:
> Look for HPMC's. The console can't keep up with the kernel in general.
> When an HPMC occurs, some of the output can get stranded.
> 
> I would add "initcall_debug=1" to boot parameters. See kernel/main.c.
> Possible add a mdelay(100) after each initcall.
> 
> Since Tulip configured properly, I'm going to assume PCI resources
> were properly assigned and all PCI Busses enumerated. PCI support
> shouldn't be any different than for other PAT PDC machines.
> 

The interrupt assignment looks a little wonky, don't you think?
