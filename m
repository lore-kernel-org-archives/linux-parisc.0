Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D06F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Apr 2002 07:40:58 -0600 (MDT)
Date: Thu, 11 Apr 2002 14:40:49 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] some bugs 
In-Reply-To: <20020410155841.19DE2482A@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0204111432080.16418-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, 10 Apr 2002, Grant Grundler wrote:

> "M. Grabert" wrote:
> > But perhaps it's only a h/w issue (incompatibility with switch and
> > network card?).
>
> Possibly. Perhaps just unplugging the cable, wait 5 seconds (or so)
> and plug it back in should force a re-negotiation. Not a great work
> around but perhaps a start.

doesn't work. As somebody other mentioned, no re-negotiation will
work for some strange reason. It was also suggested to set up the
lan configuration in pdc to "100Mbit"; Well, it was already set
to 100Mbit, so I changed it to "Autodetect". Now it seems to work
and re-negotiation also works!

> > Well, yes, maybe, because it's 'mount' specific. But why is it working
> > with the 32bit kernel? I thought this kind of things should be
> > platform-independent ...
>
> I agree - I doubt this is a mount command problem.
> It might be an issue with our 32-bit syscall wrappers in the 64-bit kernels.

I didn't investigate this any further ...

[...]

STIfb support seems to work, I think I was just hallucinating
(or the serial cable was loose). At least it doesn't hang the C240.

The power button works now with 2.4.18-pa16-64! Great work.
Modules also work! I don't see any difference now between in the
behaviour of the 32bit and 64bit version of the kernel ;)

Thanks alot,
   Happy max
