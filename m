Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA26288
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 16:11:49 -0600
Date: Sat, 14 Oct 2000 17:12:55 -0500 (EST)
From: Brian Poole <raj@cerias.purdue.edu>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles following the 'recipe'
In-Reply-To: <87pul36q1z.fsf@linuxcare.com>
Message-ID: <Pine.SOL.4.10.10010141706560.22986-100000@basm.cerias.purdue.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 14 Oct 2000, David Huggins-Daines wrote:

> Brian Poole <raj@cerias.purdue.edu> writes:
> 
> > And I configured it as per the recipe with..
> > 
> > ../gcc/configure --target=hppa1.1-linux --prefix=$DEST --host=$MACH
> > --disable-nls --without-libc
> 
> --without-libc does nothing.  You also need --enable-languages=c, or
> else it will try to build ObjC, C++, Java, etc., all of which require
> you to have a built libc.
> 
> Another thing - though 'hppa1.1-linux' works, you should use
> 'hppa-linux' as the target instead.
> 
> You should configure gcc with:
> 
> ../gcc/configure --target=hppa-linux --prefix=$DEST --enable-languages=c
> 
> If you want a cross-compiler for C++, you must build a cross-glibc
> (using --prefix=$DEST/hppa-linux - important!) and then rebuild with
> --enable-languages=c,c++.
> 
> I thought the recipe had been updated (I *clearly* remember helping
> write a functional one a while ago).  Are you sure this is a recent
> version of it?

This is off of http://thepuffingroup.com/parisc/recipe.html which says
page was last modified 09/30/2000. Guess this puppy is a bit out of date
despite what the page says because everything I've been doing is off that 
one. I noticed it building the Java, etc, but assumed that was just the
way things were supposed to go. Any idea what you did with that functional
one? ;)

I'll try recompiling with the above stated configure and see if I get any
better luck. 


thanks,

-b
