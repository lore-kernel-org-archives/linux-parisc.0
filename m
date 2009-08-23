From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Reproducible random python crash.
Date: Sun, 23 Aug 2009 17:21:15 -0400 (EDT)
Message-ID: <20090823212115.E00014E7A@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org,
	James.Bottomley@hansenpartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	deller@gmx.de, kyle@mcmartin.ca
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <no.id> from "John David Anglin" at Aug 23, 2009 04:52:21 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I booted 2.6.30.5 from gsyprf11 because I had one random segv and
> one command hang while running the GCC testsuite.  I suspect that some
> hangs are due to dropped signals.  I'm tempted to try the sequence
> with 2.6.22.19.

SMP 2.6.22.19 also fails with random segvs and hangs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
