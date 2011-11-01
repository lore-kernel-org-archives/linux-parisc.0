From: Domenico Andreoli <cavok@debian.org>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Tue, 1 Nov 2011 10:15:00 +0100
Message-ID: <20111101091500.GA27751@glitch>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
 <CADZpyizJwcEFNLZyhd74wDyFvrgNpD6j+2cRhjR7ZkL0xTWAgA@mail.gmail.com>
 <BLU0-SMTP13C59771871C90183AFBCB97D10@phx.gbl>
 <2746859.nK5NlKbf2R@donald.sf-tec.de>
 <BLU0-SMTP8183F951B80BB9F5455EB297D10@phx.gbl>
 <CADZpyizsC-eSgCSyK52-Ns12z+mWUpFB8JH2dC2C7J_3EnGR5Q@mail.gmail.com>
 <BLU0-SMTP39F6756368C783FB821D4297D60@phx.gbl>
 <20111031094110.GA29821@glitch>
 <BLU0-SMTP23C76900AA581465CC639797D60@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP23C76900AA581465CC639797D60@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 31, 2011 at 07:26:56PM -0400, John David Anglin wrote:
> On 31-Oct-11, at 5:41 AM, Domenico Andreoli wrote:
> 
> >I would like to redo the exercise on my j5600, are you building Debian
> >packages? Could you please share the sources? Thank you.
> 
> Attached are the hppa libc6 patches that I'm using.  The
> local-stack-grows-up.diff patch needs
> to be removed first, then the patches applied in order of date using
> quilt.
> 
> The last change resolves the udev bug.
> 
> I will send you offline the eglibc_2.13-10.dsc  and the
> eglibc_2.13-10.diff.gz.  The
> eglibc_2.13.orig.tar.gz file should still be available.

I'll give it a ride as soon as I can, thank you.

cheers,
Domenico
