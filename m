Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4697F482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 09:05:30 -0600 (MDT)
Date: Tue, 28 Aug 2001 11:06:14 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828110614.A30657@megatonmonkey.net>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk> <20010828003952.M28978@megatonmonkey.net> <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk> <20010828071743.A1289@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828071743.A1289@megatonmonkey.net>; from carlos@megatonmonkey.net on Tue, Aug 28, 2001 at 07:17:43AM -0400
List-ID: <linux-parisc.vger.kernel.org>

> > 
> > I have no enthusiasm for working on glibc.  Please, someone, take it
> > off my hands.
> > 
> > -- 
> > Revolutions do not require corporate support.
> >

Wow, do I feel like a knuckle head :}

So after allowing myself to sip a good cup of straight black joe,
I think I found _the_ problem with my setup.

I use a makefile + perl to automate the download/setup/install of
the toolchain and associated files (atleast that's what I'm working 
on...)

I noticed the following error in my makefile:

 --prefix=$(DEST)/hppa-linux\
--with-headers=$(SRC)/linux/include \

Which is definately not a good thing! Since both get concatenated
into a single --prefix. My apologies Matthew, I did not want to waste
your time or mine on something so trivial. Sadly, when trying for the
eleventybazillionth time ... you might miss the _missing_ space in
the configure line.

Please forgive me... once I finish the setup, would you like me to send
the list a new ./toolchain/index.html for the site?

Some things I've noticed that I will add to index.html:

a) Must remember to set CC to hppa-linux-gcc (It hurts when you forget)
	= glibc's configure always seeks out gcc and there seems to
	= be no --with-cc=?? option
	= The wrong gcc also hurts because configure adds 
	= -isystem /your/local/gcc/include rather than the proper one.

b) Must remember to add $DEST/bin to path (needed for building gcc)
	= gcc is the first complainer since it needs hppa-linux-ar.

c) If not running debian, must run:

[glibc-2.2.4]sh ./debian/patches/glibc22-hppa.dpatctch -patch /your/hppa/glibc
(This patch touches some ia64 stuff?)

I wonder how many people build the toolchain from source?
I love this crosscompiler! Especially since our dual PIII box can still
compile the pants of any of our HPPA boxes (especially the 715/50's ;)

<Carlos looks back at the compile, still chugging, much father!>

OH MY GOD!
It compiled with 0 errors and 0 warnings...

I'm estatic!

I'm too frenetic to actually attempt to xc something and test out glibc :}


I'll bet you lied about the patch failing just to taunt me!
I bested you! ;)


Cheers,
Carlos.
