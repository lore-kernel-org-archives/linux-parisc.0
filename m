From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HPPA and Squeeze
Date: Sun, 12 Jul 2009 10:52:08 -0400
Message-ID: <119aab440907120752m43ae8a10ld79cf7eac50ad78b@mail.gmail.com>
References: <20090602140734.GC26721@mx0.halon.org.uk>
	 <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org>
	 <20090615173102.GC2690@lackof.org>
	 <20090616062531.GA17957@xanadu.blop.info> <4A37EDB5.2020400@gmx.de>
	 <20090616191317.GG25535@hall.aurel32.net>
	 <119aab440906211555m116af57ekde6a9d75eae59a01@mail.gmail.com>
	 <20090712123054.GB31207@hall.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Lucas Nussbaum <lucas@lucas-nussbaum.net>,
	Helge Deller <deller@gmx.de>,
	Grant Grundler <grundler@parisc-linux.org>,
	HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	linux-parisc@vger.kernel.org
To: Aurelien Jarno <aurelien@aurel32.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090712123054.GB31207@hall.aurel32.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jul 12, 2009 at 8:30 AM, Aurelien Jarno<aurelien@aurel32.net> wrote:
> I have just included these patches in the eglibc-2.10 branch of our SVN,
> though currently the linuxthreads version is still built by default.
>
> I got the following regressions in the NPTL build compared to the
> linuxthreads build:
> | Encountered regressions that don't match expected failures:
> | tst-cancelx20.out, Error 1
> | tst-cancelx21.out, Error 1
> | tst-cancelx4.out, Error 1
> | tst-cancelx5.out, Error 1
> | tst-cleanupx4.out, Error 1

These are expected regressions

> | tst-cputimer1.out, Error 1
> | tst-cputimer2.out, Error 1
> | tst-cputimer3.out, Error 1
> | tst-mqueue3.out, Error 1

So are these.

> | tststatic2.out, Error 1
> | tststatic.out, Error 1

These are not.

> | tst-timer4.out, Error 1
> | tst-timer5.out, Error 1

These are.

> | tst-tls9-static.out, Error 1

This is not.

I'm building my own set of patches for debian-glibc, I'll tell you
what my results are when I finish today.

Cheers,
Carlos.
