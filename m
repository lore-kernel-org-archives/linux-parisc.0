Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA27191
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 18:37:12 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 15 Oct 2000 00:38:26 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA04923;
	Sun, 15 Oct 2000 11:38:13 +1100
Date: Sun, 15 Oct 2000 11:38:12 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Brian Poole <raj@cerias.purdue.edu>
cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles following the 'recipe'
In-Reply-To: <Pine.SOL.4.10.10010141706560.22986-100000@basm.cerias.purdue.edu>
Message-ID: <Pine.LNX.4.21.0010151131050.4815-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 14 Oct 2000, Brian Poole wrote:

> On 14 Oct 2000, David Huggins-Daines wrote:
> > Another thing - though 'hppa1.1-linux' works, you should use
> > 'hppa-linux' as the target instead.

The only thing this affects is later compiles of eg. the kernel, which
have Makefiles set up to expect a cross-compiler called hppa-linux-gcc

> > You should configure gcc with:
> > 
> > ../gcc/configure --target=hppa-linux --prefix=$DEST --enable-languages=c
> > 
> > If you want a cross-compiler for C++, you must build a cross-glibc
> > (using --prefix=$DEST/hppa-linux - important!) and then rebuild with
> > --enable-languages=c,c++.
> > 
> > I thought the recipe had been updated (I *clearly* remember helping
> > write a functional one a while ago).  Are you sure this is a recent
> > version of it?
> 
> This is off of http://thepuffingroup.com/parisc/recipe.html which says
> page was last modified 09/30/2000. Guess this puppy is a bit out of date
> despite what the page says because everything I've been doing is off that 
> one. I noticed it building the Java, etc, but assumed that was just the
> way things were supposed to go. Any idea what you did with that functional
> one? ;)
> 
> I'll try recompiling with the above stated configure and see if I get any
> better luck. 

Bung your includes into ${DEST}/${TARGET}/include, as that is the 
directory where a cross-compiler expects to find them (as you
found from the gcc -v).  That's the real fix to your problem.  Sorry I
didn't think of it earlier.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
