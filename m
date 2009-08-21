From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Reproducible random python crash.
Date: Fri, 21 Aug 2009 10:01:57 -0600
Message-ID: <1250870517.7363.104.camel@mulgrave.site>
References: <119aab440908210759g5cdc0f8dwbf1fed9554b3a836@mail.gmail.com>
	 <119aab440908210843s3018469oe63680871da83685@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440908210843s3018469oe63680871da83685@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2009-08-21 at 11:43 -0400, Carlos O'Donell wrote:
> On Fri, Aug 21, 2009 at 10:59 AM, Carlos
> O'Donell<carlos@systemhalted.org> wrote:
> > Could I get each of you to follow this recipe and tell me if python
> > crashes or hangs randomly during the execution of the last step?
> >
> > Recipe:
> > mkdir -p ~/python-test
> > cd ~/python-test
> > apt-get update
> > apt-get build-dep xmms2
> > apt-get source xmms2
> > cd xmms2_0.6DrMattDestruction
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

Same here on ion (2.6.31-rc6).  (no hang seen, just segfaults in python)

James


