From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Reproducible random python crash.
Date: Fri, 21 Aug 2009 16:58:26 -0400 (EDT)
Message-ID: <20090821205827.D0C384E09@hiauly1.hia.nrc.ca>
References: <119aab440908211315t2c4bc5a3tbe69e2d17a9ee6c1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	James.Bottomley@hansenpartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	deller@gmx.de, kyle@mcmartin.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440908211315t2c4bc5a3tbe69e2d17a9ee6c1@mail.gmail.com> from "Carlos O'Donell" at Aug 21, 2009 04:15:35 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I should have mentioned you need unstable sources (not unstable debs)
> in your sources.list.
> e.g. deb-src ftp://ftp.ca.debian.org/debian/ unstable main contrib non-free
> Does that help?

Yes.  segvs and hangs on gsyprf11.  Think the hangs occur when
rerunning configure.  I looked at one segv and it appeared r19
was corrupt causing a branch to never-never-land.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
