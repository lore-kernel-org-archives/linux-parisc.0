Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E844482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 15:01:36 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18xa0Y-0000hn-N6; Mon, 24 Mar 2003 22:01:30 +0000
Date: Mon, 24 Mar 2003 22:01:30 +0000
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Glibc 2.3.2 failures and possible fixes?
Message-ID: <20030324220130.GP31008@parcelfarce.linux.theplanet.co.uk>
References: <20030324213508.GA8436@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030324213508.GA8436@systemhalted>
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

On Mon, Mar 24, 2003 at 04:35:08PM -0500, Carlos O'Donell wrote:
> math/test-fenv.out
> math/test-float.out
> math/test-double.out
> math/test-ifloat.out
> 
> - We've had the math test failures for a while, would you like it if I
>   tried building glibc with gcc head? It's been so long I've forgotten
>   if this was really the delayed fp stuff that I fogot to implement :}
>   Will get around to testing this more near the end of April.

I think this is the mismatch in sizeof(long double) problem again.

> elf/vismain.out
> elf/neededtest.out
> elf/neededtest2.out
> elf/neededtest3.out
> elf/neededtest4.out
> elf/circleload1.out
> 
> - These have been around for a while, any idea about how to fix them?

They've certainly been around since I was hacking on glibc ...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
