From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [alpha, hppa] GCC-4.3 as the default compilers for lenny?
Date: Sat, 22 Mar 2008 22:56:02 +0100
Message-ID: <18405.32882.347691.983065@gargle.gargle.HOWL>
References: <18405.27903.317733.531002@gargle.gargle.HOWL>
	<119aab440803221402w2bfe5a7le9499e4eb6e0e3c1@mail.gmail.com>
	<18405.30165.498589.795298@gargle.gargle.HOWL>
	<119aab440803221450v1387e168l8423d74237057fa3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, "Aurelien Jarno" <aurel32@debian.org>,
	debian-release@lists.debian.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440803221450v1387e168l8423d74237057fa3@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos O'Donell writes:
> On Sat, Mar 22, 2008 at 5:10 PM, Matthias Klose <doko@cs.tu-berlin.de> wrote:
> > Carlos O'Donell writes:
> >  > >   - gij/gcj shows bus errors on hppa (either 4.2 or 4.3).
> >  >
> >  > Has gij/gcj ever worked on hppa-linux?
> >
> >  at least the gij/gcj before adding support for generics (1.5) did
> >  work.  Now that a working runtime is required for the compiler makes
> >  things different. Please try to run a random HelloWorld program using
> >  the interpreter.
> 
> I'm not at all interested in gij/gcj. Why do we require that all
> languages be functional for a gcc release? This is a difficult goal to
> meet.

I'll let the release team answer this question. IMO we should require
a port to support some kind of java runtime.  Is there any chance to
get the IcedTea Zero port working for hppa, or get the hpux java
support be ported to OpenJDK?

> As the hppa-linux libc-ports maintainer I *am* interested in seeing
> the list of regressions you have and commenting on them.

Please wait for the feedback from Aurelian.

> Also note that the hppa-linux list is "linux-parisc@vger.kernel.org"

thanks for the hint.

  Matthias
