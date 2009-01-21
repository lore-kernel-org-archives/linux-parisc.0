From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 13:13:16 +0100
Message-ID: <200901211313.17394.arnd@arndb.de>
References: <1232496257.3123.19.camel@localhost.localdomain> <200901210924.23484.arnd@arndb.de> <20090121113853.GB1579@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Helge Deller <deller@gmx.de>, David Miller <davem@davemloft.net>,
	jaswinder@kernel.org, mingo@elte.hu, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Kyle McMartin <kyle@mcmartin.ca>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090121113853.GB1579@uranus.ravnborg.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wednesday 21 January 2009, Sam Ravnborg wrote:
> Could we add a new symbol for this?
> We know we are going to use this in several places so a simpler varia=
nt
> would be more readable.
>=20
> Something like:
>=20
> #ifdef __64BIT
> ...
> #endif
>=20
> When we define __64BIT we would use the =A0__BITS_PER_LONG =3D=3D 64 =
check.

I would prefer using the __BITS_PER_LONG =3D=3D 64 check directly, beca=
use
it gives you a warning when __BITS_PER_LONG is undefined, whereas the
#ifdef check gets easily fooled by include order problems. Note that
this is not a problem in the kernel for CONFIG_* symbols which are
always defined before the first #include.

	Arnd <><
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
