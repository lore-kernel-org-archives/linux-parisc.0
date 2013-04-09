From: Kurt Fitzner <kurt.fitzner@gmail.com>
Subject: Re: Did Squeeze ever make it to HPPA?
Date: Tue, 09 Apr 2013 10:27:19 -0300
Message-ID: <51641737.4030008@gmail.com>
References: <514C43F3.4040206@gmail.com> <514E2703.9000507@gmx.de> <BLU0-SMTP73FA3D9E15C0195C11D97097D50@phx.gbl> <5162AFE8.2070808@gmail.com> <5162D4D2.9010903@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: debian-hppa@lists.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5162D4D2.9010903@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08/04/2013 11:31 AM, John David Anglin wrote:

> 1) Build and install 3.9-rc5 or later from kernel.org.

Is it safe to jump from 2.6.26 to 3.9?  I haven't followed Linux kernel
development for quite a while, not since my SLS and Slackware days when
I'd roll my own kernel regularly, but I remember lots of things broke
when I wasn't careful (libc, anything navigating /proc, etc).

> Would you be willing to post what's missing and broken?  I can try and
> fill in what's missing.

Your warning about the packages on debian-ports.org had prompted me to
remove it from my sources, which in turn was making aptitude throw fits
when asked to calculate any sort of package upgrade.  I have since added
it back in, and (perhaps in conjunction with the packages you have
recently added) have been able to upgrade most of my tool chain now
(gcc, autoconf/make, libtool).

One package I can't seem to upgrade without losing half my system is
dpkg, which I will need in order to build any recent source packages.
I'm still trying to work out if there's anything missing, or if it's
just dependencies that aptitude can't sort out without help.  I may just
have to strip it down to its debian bolts and go from there.

    Kurt.


