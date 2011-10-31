From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Mon, 31 Oct 2011 10:41:10 +0100
Message-ID: <20111031094110.GA29821@glitch>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
 <CADZpyizJwcEFNLZyhd74wDyFvrgNpD6j+2cRhjR7ZkL0xTWAgA@mail.gmail.com>
 <BLU0-SMTP13C59771871C90183AFBCB97D10@phx.gbl>
 <2746859.nK5NlKbf2R@donald.sf-tec.de>
 <BLU0-SMTP8183F951B80BB9F5455EB297D10@phx.gbl>
 <CADZpyizsC-eSgCSyK52-Ns12z+mWUpFB8JH2dC2C7J_3EnGR5Q@mail.gmail.com>
 <BLU0-SMTP39F6756368C783FB821D4297D60@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP39F6756368C783FB821D4297D60@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Oct 30, 2011 at 09:36:05PM -0400, John David Anglin wrote:
> 
> I integrated Guy's patch into debian 2.13-10 today and I was going to do
> a build, but then I discovered it builds using 4.4.  So, I patched
> 4.4 with the
> above change, and will rebuild 2.13 when it's done.  Hopefully, this
> will
> fix the udev bug which is blocking many python builds.  I'm
> interested to
> see if the glibc testsuite results will be better.

I would like to redo the exercise on my j5600, are you building Debian
packages? Could you please share the sources? Thank you.

Regards,
Domenico
