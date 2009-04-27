From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: SMP: CPU:1 is stuck. on J6750
Date: Mon, 27 Apr 2009 17:30:27 -0400
Message-ID: <20090427213027.GB5264@bombadil.infradead.org>
References: <200904240915.44386.nick.leippe@whitecanyon.com> <20090427170151.GA7823@bombadil.infradead.org> <200904271529.44414.nick.leippe@whitecanyon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Nicholas Leippe <nick.leippe@whitecanyon.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200904271529.44414.nick.leippe@whitecanyon.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Apr 27, 2009 at 03:29:44PM -0600, Nicholas Leippe wrote:
> On Mon Apr 27 2009 11:01:51 you wrote:
> > On Fri, Apr 24, 2009 at 09:15:44AM -0600, Nicholas Leippe wrote:
> > > I'm still experiencing this issue on a J6750.
> > > I've gotten this w/kernels 2.6.26 thru 2.6.29.
> > > Other than the missing cpu, things seem to function just fine.
> > > Increasing the timeout in smp.c line 410 to 100000 did not help.
> >
> > Does it work in 32-bit mode?
> 
> I built it as a 32bit kernel and it seems to work just fine.
> (Only difference is CONFIG_64BIT and 32bit compiler).

The dmesg you posted was a 64-bit kernel. See the "the 64-bit kernel has
started message".

To build a 32-bit kernel, CONFIG_64BIT needs to be off...

thanks, Kyle
