From: "H. Peter Anvin" <hpa@kernel.org>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 08:44:56 -0800
Message-ID: <49775108.7040200@kernel.org>
References: <1232496257.3123.19.camel@localhost.localdomain> <200901210924.23484.arnd@arndb.de> <20090121113853.GB1579@uranus.ravnborg.org> <200901211313.17394.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
	David Miller <davem@davemloft.net>, jaswinder@kernel.org,
	mingo@elte.hu, x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
To: Arnd Bergmann <arnd@arndb.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200901211313.17394.arnd@arndb.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Arnd Bergmann wrote:
> 
> I would prefer using the __BITS_PER_LONG == 64 check directly, because
> it gives you a warning when __BITS_PER_LONG is undefined, whereas the
> #ifdef check gets easily fooled by include order problems. Note that
> this is not a problem in the kernel for CONFIG_* symbols which are
> always defined before the first #include.
> 

I fully agree with this.  It actually *is* a problem for CONFIG_*
symbols too, since people typo them all the time.

	-hpa
