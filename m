From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [alpha, hppa] GCC-4.3 as the default compilers for lenny?
Date: Sat, 22 Mar 2008 17:50:17 -0400
Message-ID: <119aab440803221450v1387e168l8423d74237057fa3@mail.gmail.com>
References: <18405.27903.317733.531002@gargle.gargle.HOWL>
	 <119aab440803221402w2bfe5a7le9499e4eb6e0e3c1@mail.gmail.com>
	 <18405.30165.498589.795298@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, "Aurelien Jarno" <aurel32@debian.org>,
	debian-release@lists.debian.org
To: "Matthias Klose" <doko@cs.tu-berlin.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <18405.30165.498589.795298@gargle.gargle.HOWL>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Mar 22, 2008 at 5:10 PM, Matthias Klose <doko@cs.tu-berlin.de> wrote:
> Carlos O'Donell writes:
>  > >   - gij/gcj shows bus errors on hppa (either 4.2 or 4.3).
>  >
>  > Has gij/gcj ever worked on hppa-linux?
>
>  at least the gij/gcj before adding support for generics (1.5) did
>  work.  Now that a working runtime is required for the compiler makes
>  things different. Please try to run a random HelloWorld program using
>  the interpreter.

I'm not at all interested in gij/gcj. Why do we require that all
languages be functional for a gcc release? This is a difficult goal to
meet.

As the hppa-linux libc-ports maintainer I *am* interested in seeing
the list of regressions you have and commenting on them.

Also note that the hppa-linux list is "linux-parisc@vger.kernel.org"

Cheers,
Carlos.
