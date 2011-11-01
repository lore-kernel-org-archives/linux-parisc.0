From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Tue, 1 Nov 2011 10:19:54 +0100
Message-ID: <20111101091954.GB27751@glitch>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
 <CADZpyizJwcEFNLZyhd74wDyFvrgNpD6j+2cRhjR7ZkL0xTWAgA@mail.gmail.com>
 <BLU0-SMTP13C59771871C90183AFBCB97D10@phx.gbl>
 <2746859.nK5NlKbf2R@donald.sf-tec.de>
 <BLU0-SMTP8183F951B80BB9F5455EB297D10@phx.gbl>
 <CADZpyizsC-eSgCSyK52-Ns12z+mWUpFB8JH2dC2C7J_3EnGR5Q@mail.gmail.com>
 <BLU0-SMTP39F6756368C783FB821D4297D60@phx.gbl>
 <4EAF562A.2070407@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@bell.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4EAF562A.2070407@systemhalted.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 31, 2011 at 10:15:06PM -0400, Carlos O'Donell wrote:
> On 10/30/2011 9:36 PM, John David Anglin wrote:
> > I've been wondering how much is left to install to glibc head?
> 
> I've pushed out almost all of glibc-ports into upstream.
> 
> There are probably a half-dozen patches against glibc proper for which I'm writing up submissions and making sure I don't impact x86 fast path.
> 
> Submitting patches to core glibc isn't like any other project :-)

glibc or eglibc?

cheers,
Domenico
