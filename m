Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob03.one.net.au (mail-ob03.one.net.au [61.12.0.163])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D083482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Apr 2001 23:16:31 -0600 (MDT)
Received: Received: [from squeak.local (async134-ade-isp-4.nas.one.net.au [203.101.93.135])
	by mail-ob03.one.net.au  with SMTP id f3F5GM313473
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Apr 2001 15:16:22 +1000 (EST)]
From: amodra@one.net.au
Date: Sun, 15 Apr 2001 15:47:43 +0930
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 build problem
Message-ID: <20010415154649.F25145@squeak.one.net.au>
Reply-To: 200104150436.WAA30928@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 14, 2001 at 10:36:25PM -0600, Grant Grundler wrote:
> amodra@one.net.au wrote:
> > True, but it's not recommended.  The reason being that non-PIC code in
> > a shared lib will mean lib pages with relocations can't be shared between
> > processes should the library be loaded at a different virtual addresses.
> 
> Well, I guess either x86 doesn't have that problem,

It does.

> no one has noticed it, or no one cares (OpenGL fans?).

Possibly :-(  As Ulrich mentioned, it's fairly easy to see if a shared lib
can't actually be shared.  "readelf -d libwhatever.so | grep DT_TEXTREL"

> Under build-env/xc/lib/GL/glu Imakefiles
> all have the following construct: (eg libtess/Imakefile)
> 
> 	NormalLibraryTarget(tess, $(OBJS))
> 		rm -f unshared; ln -sf . ./unshared
> 
> The result is only .a's get built and the libGLU.so is globbed together
> from those. The last step fails for __hppa__ since the .o's are non-PIC.

I suppose you could build the .a lib with -fPIC as a workaround.

-- 
Alan Modra
