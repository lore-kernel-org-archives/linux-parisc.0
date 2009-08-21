From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Reproducible random python crash.
Date: Fri, 21 Aug 2009 15:30:21 -0400 (EDT)
Message-ID: <20090821193022.85A6B4E09@hiauly1.hia.nrc.ca>
References: <119aab440908211201qe0b96ddg2fdb0b9d8be026d1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	James.Bottomley@hansenpartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	deller@gmx.de, kyle@mcmartin.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440908211201qe0b96ddg2fdb0b9d8be026d1@mail.gmail.com> from "Carlos O'Donell" at Aug 21, 2009 03:01:42 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >> On 2.6.31-rc2-00010-g22a5b0c-dirty (kyle's 4 CPU PA8800) I get a hang
> >> and segfaults, the segfault is reproducible the hang happens every
> >> once in a while.
> >
> > Do you have Grant's last patch installed? =A0Although it's early yet
> > to say for sure, I think it may have fixed the random segv problem
> > on gsyprf11 with 2.6.30.5.
> 
> Which patch is this?

http://article.gmane.org/gmane.linux.ports.parisc/2047

Since I wrote, I had one segv with 2.6.30.5 in the GCC libjava
testsuite.  However, I think things are improved.  I have managed to
get through most of a GCC build and check with a SMP kernel.

I tried to follow your recipe on gsyprf11, but the source for 0.5
was dounloaded.  I didn't have any trouble with the configure command
with this version.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
