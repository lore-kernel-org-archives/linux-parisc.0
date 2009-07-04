From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sat, 4 Jul 2009 19:34:53 -0400 (EDT)
Message-ID: <20090704233454.B1A2B5160@hiauly1.hia.nrc.ca>
References: <20090703221525.GA4242@roeckx.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: kurt@roeckx.be (Kurt Roeckx)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090703221525.GA4242@roeckx.be> from "Kurt Roeckx" at Jul 4, 2009 00:15:25 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Jul 03, 2009 at 09:28:00PM +0200, Philipp Kern wrote:
> > On Fri, Jul 03, 2009 at 08:57:56PM +0200, Kurt Roeckx wrote:
> > > Did something change to peri?  I'm currently only seeing them on
> > > penalosa.
> > 
> > UP kernel, maybe?
> 
> Both peri and penalosa run 2.6.29-2-parisc64-smp and from what I
> can tell run on identical hardware.

I tried a SMP kernel (2.6.30.1 with the patch set posted earlier) on
my rp34404.  Fired up a GCC build.  It didn't take more than a few
minutes to trigger a couple of segvs in /bin/sh.  On the other hand,
I ran a UP version of 2.6.30 for more than a week without any major
problems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
