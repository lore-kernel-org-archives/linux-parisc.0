From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: X won't start with VisEG and 2.6.22.19
Date: Wed, 6 Aug 2008 07:11:19 +0200
Message-ID: <20080806071119.22b6a21f@bleh.bxl.tuxicoman.be>
References: <488DFD62.4080307@hp.com>
	<20080728171500.GB16059@parisc-linux.org>
	<488F777E.6090405@hp.com>
	<1217363136.6103.68.camel@localhost.localdomain>
	<488F842F.3040000@hp.com>
	<1217369386.6103.73.camel@localhost.localdomain>
	<20080731051524.GC18732@colo.lackof.org>
	<4891F5C0.8010307@hp.com>
	<20080801233142.GC26550@colo.lackof.org>
	<7d01f9f00808040159ud7f1afw8e0ee77760bc9c68@mail.gmail.com>
	<20080806014207.GA2590@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave@hiauly1.hia.nrc.ca, Thibaut VARENE <T-Bone@parisc-linux.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	Parisc List <linux-parisc@vger.kernel.org>, deller@gmx.de
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080806014207.GA2590@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi Dave,

This has been introduced in latest Xorg. When it modify the fb device,
Xorg query the kernel again to make sure changes are the expected ones.
Apparently, stifb doesn't return what it was expecting.

You'll find the Xorg code in hw/xfree86/fbdevhw/fbdevhw.c,
fbdevHWSetMode().


Cheers,
  Guy


On Tue, 5 Aug 2008 21:42:08 -0400
John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:

> > > It wasn't and the default debian kernel didn't boot either.
> > > I've set the default kernel to jda's 2.6.22.19 patched kernel.
> > 
> > Is there a source tarball of that, or a list of applied patches? I
> > would very much like to use that "homebrew" kernel on my cluster as
> > well, until newer kernels are proven reliable enough...
> 
> I should mention that I've had a problem with starting X with lenny
> and 2.6.22.  This has been a problem for sometime.  I've tried
> simplifying the xorg.conf file and adding the mode helper to the
> kernel, but I haven't found the magic incantation that works.
> 
> Dave


-- 
Guy Martin
Gentoo Linux - HPPA port lead
