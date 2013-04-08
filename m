From: Kurt Fitzner <kurt.fitzner@gmail.com>
Subject: Re: Did Squeeze ever make it to HPPA?
Date: Mon, 08 Apr 2013 08:54:16 -0300
Message-ID: <5162AFE8.2070808@gmail.com>
References: <514C43F3.4040206@gmail.com> <514E2703.9000507@gmx.de> <BLU0-SMTP73FA3D9E15C0195C11D97097D50@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: debian-hppa@lists.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP73FA3D9E15C0195C11D97097D50@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 23/03/2013 7:53 PM, John David Anglin wrote:
> I would really recommend going with the packages at
> ftp://ftp.parisc-linux.org/debian-ports/unstable
> instead of the squeeze packages on debian-ports.org.  The dependencies
> are somewhat broken for
> the stuff on debian-ports.org and great care is needed in installing
> these packages.  For example,
> the udev package on debian-ports is a bootstrap breaker.  It might be
> that we could fill in the squeeze
> port but it would be a fair bit of work.

I've spent some time over the last couple weeks trying to work out an
upgrade path to the the unstable packages on parisc-linux.org, but am
having a very hard time.  Trying to go from Debian 5 directly to a
mostly (but not totally) complete post-6 Wheezy without having through
intermediary steps seems to be beyond aptitude (or me) to resolve.  I
can handle missing packages, but the number of broken packages aptitude
says there will be at the end of an upgrade is daunting.  And I've only
got one HPPA box which leaves me a little on the chicken side with
respects to playing.

I must admit to being less than an expert on Debian's packaging system,
mostly because it has always "just worked", but I am wondering if my
problems are stemming from the current unstable packages being set as
superceding packages that no longer exist in between what I have and them.

What I think I really need is a snapshot of what was unstable the day
Lenny was officially dropped.  Does this exist anywhere?

Thanks,

     Kurt.

