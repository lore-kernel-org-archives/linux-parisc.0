From: "H. Peter Anvin" <hpa@kernel.org>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 09:57:28 -0800
Message-ID: <49776208.8050704@kernel.org>
References: <1232496257.3123.19.camel@localhost.localdomain> <200901210924.23484.arnd@arndb.de> <20090121113853.GB1579@uranus.ravnborg.org> <200901211313.17394.arnd@arndb.de> <20090121172837.GA4386@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
	David Miller <davem@davemloft.net>, jaswinder@kernel.org,
	mingo@elte.hu, x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090121172837.GA4386@uranus.ravnborg.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sam Ravnborg wrote:
> 
> It gives the warning only if you add -Wundef which IIRC is not default
> with -Wall. And using the "__BITS_PER_LONG == 64" the risk of gitting
> the expression wrong is much higher than the simpler variant where
> you only write:
> 
>     __64BIT
> 
> But I have no strong feelings for it.
> 

It's not the default, but it would be nice if we could start using it.

	-hpa
