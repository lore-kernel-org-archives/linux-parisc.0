From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Debian bug 622997
Date: Sat, 16 Apr 2011 16:14:39 -0500
Message-ID: <1302988479.7967.0.camel@mulgrave.site>
References: <20110416192920.1E15B4FD9@hiauly1.hia.nrc.ca>
	 <1302986887.4058.13.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	622997@bugs.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1302986887.4058.13.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2011-04-16 at 15:48 -0500, James Bottomley wrote:
> On Sat, 2011-04-16 at 15:29 -0400, John David Anglin wrote:
> > > On Sat, 2011-04-16 at 14:07 -0400, John David Anglin wrote:
> > > > I posted this debian bug report because the most recent debian
> > > > SMP kernel build fails to boot on my rp3440:
> > > > http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=622997
> > > > 
> > > > I don't think debian kernels have worked since lenny.
> > > 
> > > Hmm, well upstream ones have: so it's likely a patch debian has but
> > > upstream doesn't, or it could be a toolchain issue ... I didn't think
> > > gcc-4.4.5 worked properly on 64 bit without a few patches?
> > 
> > Yes, but debian tends to build almost everything.  For some reason,
> > I've turned off ipv6.  Unlike many kernel bugs, this one is completely
> > reproducible.
> 
> I suppose it could be USB ... before I got ion, I didn't have any parisc
> systems with USB, so it's turned off in my build.  I'll turn it on and
> see if there's a problem there.

Strike that one ... I enabled USB in my 2.6.39-rc3 build and it inserts
the OHCI module and discovers the ports just fine.

James


