From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Debian bug 622997
Date: Sat, 16 Apr 2011 15:29:19 -0400 (EDT)
Message-ID: <20110416192920.1E15B4FD9@hiauly1.hia.nrc.ca>
References: <1302980251.4058.11.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	622997@bugs.debian.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1302980251.4058.11.camel@mulgrave.site> from "James Bottomley" at Apr 16, 2011 01:57:31 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sat, 2011-04-16 at 14:07 -0400, John David Anglin wrote:
> > I posted this debian bug report because the most recent debian
> > SMP kernel build fails to boot on my rp3440:
> > http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=622997
> > 
> > I don't think debian kernels have worked since lenny.
> 
> Hmm, well upstream ones have: so it's likely a patch debian has but
> upstream doesn't, or it could be a toolchain issue ... I didn't think
> gcc-4.4.5 worked properly on 64 bit without a few patches?

Yes, but debian tends to build almost everything.  For some reason,
I've turned off ipv6.  Unlike many kernel bugs, this one is completely
reproducible.

I would say gcc-4.4.6 or a snapshot latter than 2010-12-22 is needed
for kernel builds.  asm in delay slot patch is key patch.  As this was
discussed on list, I'm a bit surprised that this wasn't picked up if
that's the problem.

I'm doing a build based on debian's config with my toolchain to see
if it has the same problem.

There may be a toolchain issue wrt CONFIG_FRAME_POINTER (frame pointer
optimization).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
