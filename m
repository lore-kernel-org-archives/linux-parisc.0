Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA27770
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 18:58:18 -0600
Date: Sat, 14 Oct 2000 19:59:25 -0500 (EST)
From: Brian Poole <raj@cerias.purdue.edu>
To: Alan Modra <alan@linuxcare.com.au>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles following the 'recipe'
In-Reply-To: <Pine.LNX.4.21.0010151131050.4815-100000@front.linuxcare.com.au>
Message-ID: <Pine.SOL.4.10.10010141951540.22986-100000@basm.cerias.purdue.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 15 Oct 2000, Alan Modra wrote:
> 
> Bung your includes into ${DEST}/${TARGET}/include, as that is the 
> directory where a cross-compiler expects to find them (as you
> found from the gcc -v).  That's the real fix to your problem.  Sorry I
> didn't think of it earlier.
> 
Hmm.. seems to be never ending problems here.. I made all recommended
changes and now the compile of gcc errors out with compilation errors..

specifically in gcc.c (beginning path is cut off to save my fingers)
gcc.c: In function `execute':
gcc.c:2559: `prus' has incomplete type
gcc.c:2560: `RUSAGE_CHILDREN' undeclared (first use in this function)
(warns that each undeclared is only warned about once)
gcc.c:2561: invalid use of undefined type `struct rusage'
(repeats ~10 times, diff line numbers)
gcc.c: At top level:
gcc.c:204: storage size of `rus' isn't known
gcc.c:204: storage size of `prus isn't known
make[1]: *** [gcc.o] Error 1
make[1]: Leaving directory `/d0/parisc-build/gcc-build/gcc'

sighs.. maybe I'll just leave parisc linux alone for a few months again
and see how it is doing again later ;)


-b
