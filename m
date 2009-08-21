From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Reproducible random python crash.
Date: Fri, 21 Aug 2009 12:19:48 -0400 (EDT)
Message-ID: <20090821161949.67BA04E7B@hiauly1.hia.nrc.ca>
References: <119aab440908210843s3018469oe63680871da83685@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	James.Bottomley@hansenpartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	deller@gmx.de, kyle@mcmartin.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440908210843s3018469oe63680871da83685@mail.gmail.com> from "Carlos O'Donell" at Aug 21, 2009 11:43:48 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > ./waf configure --nocache --prefix=/usr --with-mandir=/usr/share/man
> > --with-perl-archdir=/usr/lib/perl5 --with-perl-binary=/usr/bin/perl
> > --with-ruby-archdir=/usr/lib/ruby/1.8/hppa-linux
> > --with-ruby-libdir=/usr/lib/ruby/1.8 --without-optionals=python
> > --without-plugins=mac
> >
> > Running the last step on a 2.6.26-1-parisc64-smp kernel results in
> > random behaviour ranging from sigsegv, sigill, sigtrap, and a hang.
> > Given that each of you might run it on a different kernel, I was
> > hoping to see if the behaviour is the same across different kernels.
> 
> On 2.6.31-rc2-00010-g22a5b0c-dirty (kyle's 4 CPU PA8800) I get a hang
> and segfaults, the segfault is reproducible the hang happens every
> once in a while.

Do you have Grant's last patch installed?  Although it's early yet
to say for sure, I think it may have fixed the random segv problem
on gsyprf11 with 2.6.30.5.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
