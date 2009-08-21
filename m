From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Reproducible random python crash.
Date: Fri, 21 Aug 2009 11:43:48 -0400
Message-ID: <119aab440908210843s3018469oe63680871da83685@mail.gmail.com>
References: <119aab440908210759g5cdc0f8dwbf1fed9554b3a836@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <119aab440908210759g5cdc0f8dwbf1fed9554b3a836@mail.gmail.com>
Resent-Message-ID: <zKuM4o5EnGB.A.6UG.EDsjKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Fri, Aug 21, 2009 at 10:59 AM, Carlos
O'Donell<carlos@systemhalted.org> wrote:
> Could I get each of you to follow this recipe and tell me if python
> crashes or hangs randomly during the execution of the last step?
>
> Recipe:
> mkdir -p ~/python-test
> cd ~/python-test
> apt-get update
> apt-get build-dep xmms2
> apt-get source xmms2
> cd xmms2_0.6DrMattDestruction
> ./waf configure --nocache --prefix=/usr --with-mandir=/usr/share/man
> --with-perl-archdir=/usr/lib/perl5 --with-perl-binary=/usr/bin/perl
> --with-ruby-archdir=/usr/lib/ruby/1.8/hppa-linux
> --with-ruby-libdir=/usr/lib/ruby/1.8 --without-optionals=python
> --without-plugins=mac
>
> Running the last step on a 2.6.26-1-parisc64-smp kernel results in
> random behaviour ranging from sigsegv, sigill, sigtrap, and a hang.
> Given that each of you might run it on a different kernel, I was
> hoping to see if the behaviour is the same across different kernels.

On 2.6.31-rc2-00010-g22a5b0c-dirty (kyle's 4 CPU PA8800) I get a hang
and segfaults, the segfault is reproducible the hang happens every
once in a while.

Cheers,
Carlos.
