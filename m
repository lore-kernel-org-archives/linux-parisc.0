From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [alpha, hppa] GCC-4.3 as the default compilers for lenny?
Date: Wed, 26 Mar 2008 14:35:07 -0400 (EDT)
Message-ID: <20080326183508.563B34F29@hiauly1.hia.nrc.ca>
References: <20080326164612.GC24944@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, carlos@systemhalted.org,
	aurelien@aurel32.net, doko@cs.tu-berlin.de,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, debian-release@lists.debian.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080326164612.GC24944@colo.lackof.org> from "Grant Grundler" at Mar 26, 2008 10:46:12 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Mar 26, 2008 at 10:20:35AM -0600, Grant Grundler wrote:
> > Another gcc problem report:
> > 
> > That past weekend I built the latest parisc-2.6-25-rc6 kernel from
> > Kyle's tree using gcc-4.1, gcc-4.2, and gcc-4.3. All three kernels
> > booted but the networking only worked for gcc-4.1 kernel.
> 
> Sorry, I just realized I didn't mention the gcc versions are whatever is
> currently in "Debian testing" for parisc.

I would look carefully to see if the newer compilers generate warnings
that need fixing.

I've been using 4.1 for my recent builds.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
