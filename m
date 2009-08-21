From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Reproducible random python crash.
Date: Fri, 21 Aug 2009 10:59:18 -0400
Message-ID: <119aab440908210759g5cdc0f8dwbf1fed9554b3a836@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.ang
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle, Helge, John, James,

Could I get each of you to follow this recipe and tell me if python
crashes or hangs randomly during the execution of the last step?

Recipe:
mkdir -p ~/python-test
cd ~/python-test
apt-get update
apt-get build-dep xmms2
apt-get source xmms2
cd xmms2_0.6DrMattDestruction
./waf configure --nocache --prefix=/usr --with-mandir=/usr/share/man
--with-perl-archdir=/usr/lib/perl5 --with-perl-binary=/usr/bin/perl
--with-ruby-archdir=/usr/lib/ruby/1.8/hppa-linux
--with-ruby-libdir=/usr/lib/ruby/1.8 --without-optionals=python
--without-plugins=mac

Running the last step on a 2.6.26-1-parisc64-smp kernel results in
random behaviour ranging from sigsegv, sigill, sigtrap, and a hang.
Given that each of you might run it on a different kernel, I was
hoping to see if the behaviour is the same across different kernels.

Thanks!

Cheers,
Carlos.
