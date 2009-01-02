From: Detlef Riekenberg <wine.dev@web.de>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 02 Jan 2009 20:05:44 +0100
Message-ID: <1230923144.5811.11.camel@p4.lan>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
	 <20081231105425.9ccac21d.akpm@linux-foundation.org>
	 <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain>
	 <20081231.141408.60544902.davem@davemloft.net>
	 <20090102115547.GB3027@elte.hu>
	 <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain>
	 <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain>
	 <20090102175737.GA5818@uranus.ravnborg.org>
	 <20090102182248.GC10072@elte.hu>
	 <20090102182915.GA6143@uranus.ravnborg.org>
	 <20090102183353.GF10072@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Sam Ravnborg <sam@ravnborg.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Miller <davem@davemloft.net>, akpm@linux-foundation.org,
	rdreier@cisco.com, ian.campbell@citrix.com,
	jeremy.fitzhardinge@citrix.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	dave@hiauly1.hia.nrc.ca, Dan Kegel <dank@kegel.com>
To: Ingo Molnar <mingo@elte.hu>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102183353.GF10072@elte.hu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Ingo Molnar wrote:
> * Sam Ravnborg <sam@ravnborg.org> wrote:
 
> > > what type of cross-build breakage do they cause?
> > 
> > The default gcc made by demo-alpha with crosstool is version 4.1.0:
> > 
> >  /opt/crosstool/gcc-4.1.0-glibc-2.3.6/alpha-unknown-linux-gnu/bin/alpha-unknown-linux-gnu-gcc --version
> > alpha-unknown-linux-gnu-gcc (GCC) 4.1.0
> > Copyright (C) 2006 Free Software Foundation, Inc.
> > This is free software; see the source for copying conditions.  There is NO
> > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> ah, ok. I build cross-compilers from scratch, so i have 4.3.3-pre:
> 
>  phoenix:~/linux/linux> /opt/crossgcc/cross/bin/alpha-linux-gcc -v
>  [...]
>  gcc version 4.3.3 20081123 (prerelease) (GCC) 
> 
> 	Ingo

I forwarded the thread to Dan Kegel to make him aware, that the used gcc
version in crosstools makes problems.


-- 
 
Bye bye ... Detlef



