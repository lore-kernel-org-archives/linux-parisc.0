Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA28799
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 21:52:26 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 15 Oct 2000 03:53:40 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA08696;
	Sun, 15 Oct 2000 14:53:30 +1100
Date: Sun, 15 Oct 2000 14:53:30 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Brian Poole <raj@cerias.purdue.edu>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles following the 'recipe'
In-Reply-To: <Pine.SOL.4.10.10010141951540.22986-100000@basm.cerias.purdue.edu>
Message-ID: <Pine.LNX.4.21.0010151437500.4815-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 14 Oct 2000, Brian Poole wrote:

> Hmm.. seems to be never ending problems here.. I made all recommended
> changes and now the compile of gcc errors out with compilation errors..
> 
> specifically in gcc.c (beginning path is cut off to save my fingers)

I'm not sure what this one is due to, but since it's during the compile of
gcc itself rather than gcc libraries, then it's likely something to do
with the include setup on your system.  ie. This problem likely isn't
anything to do with parisc gcc.  I suspect you will have problems
compiling other programs too.  Do you have a links /usr/include/linux and
/usr/include/asm pointing to kernel includes?  ie. something like the
following:

$ ls -l /usr/include/{linux,asm}
lrwxrwxrwx   1 root     root           24 Oct 25  1999 /usr/include/asm ->
../src/linux/include/asm
lrwxrwxrwx   1 root     root           26 Oct 25  1999 /usr/include/linux
-> ../src/linux/include/linux

$ grep rusage /usr/include/linux/*
/usr/include/linux/resource.h: * Definition of struct rusage taken from
BSD 4.3 Reno
/usr/include/linux/resource.h:struct    rusage {

> gcc.c: In function `execute':
> gcc.c:2559: `prus' has incomplete type
> gcc.c:2560: `RUSAGE_CHILDREN' undeclared (first use in this function)
> (warns that each undeclared is only warned about once)
> gcc.c:2561: invalid use of undefined type `struct rusage'
> (repeats ~10 times, diff line numbers)
> gcc.c: At top level:
> gcc.c:204: storage size of `rus' isn't known
> gcc.c:204: storage size of `prus isn't known
> make[1]: *** [gcc.o] Error 1
> make[1]: Leaving directory `/d0/parisc-build/gcc-build/gcc'

--
Linuxcare.  Support for the Revolution.
