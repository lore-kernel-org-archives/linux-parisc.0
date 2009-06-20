From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sat, 20 Jun 2009 18:44:39 -0400 (EDT)
Message-ID: <20090620224440.203144EF8@hiauly1.hia.nrc.ca>
References: <20090619154324.GA26579@durotan.0x539.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: debian-hppa@lists.debian.org, kurt@roeckx.be,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: pkern@debian.org (Philipp Kern)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090619154324.GA26579@durotan.0x539.de> from "Philipp Kern" at Jun 19, 2009 05:43:24 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Jun 19, 2009 at 05:15:26PM +0200, Kurt Roeckx wrote:
> > Here is a list of packages that failed to build because of instability
> > on the buildds today:
> > package     | buildd   | error
> > qgit        | penalosa | make: *** [install] Segmentation fault
> > acpica-unix | peri     | make: *** [install] Segmentation fault
> 
> I had those random segfaults in make on paer too, until we switched to the
> UP kernel, at least from what I saw.

Based on my experience with building GCC, a recent UP kernel (e.g., 2.6.30)
will avoid the random segfault problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
