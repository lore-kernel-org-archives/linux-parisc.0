Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA08399
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 19:16:10 -0600
From: Helge Deller <deller@gmx.de>
Date: Fri, 27 Oct 2000 03:17:37 +0200
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@thepuffingroup.com
To: Kailashnath V Rampure <kailasr@webcash.com>, taggart@carmen.fc.hp.com
References: <5.0.0.25.0.20001026163140.00aed760@mail.webcash.com>
In-Reply-To: <5.0.0.25.0.20001026163140.00aed760@mail.webcash.com>
Subject: Re: [parisc-linux] Make palo problem
MIME-Version: 1.0
Message-Id: <00102703173703.00370@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Friday 27 October 2000 02:58, Kailashnath V Rampure wrote:

> > 
>     * I have down loaded the latest prebuilt cross-compiler  and untared it 
> the a directory by name DEST
>     * I have downloaded the Latest linux  and palo files from the cvs. the 
> after uncompresing them I run the following command from the ~/linux 
directory
>     * Changed the line in Palo/Makefile  for my system IP Address
>     * exported PATH=$DEST/bin:$PATH
>     * the cd ~/linux
>     * make oldconfig
>     * make dep
>     * make clean
>     * make palo
> If so the I am getting the following error after running make palo
> cd palo && make
> make[2]: Entering directory `/cvs/palo/palo'
> make[2]: Nothing to be done for `all'.
> make[2]: Leaving directory `/cvs/palo/palo'
> cd ipl && make
> make[2]: Entering directory `/cvs/palo/ipl'
> echo "char *bld_info = \"`whoami`@`hostname` `date`\";" > build.c
> hppa-linux-gcc -I. -I../lib -I../include -O2 -fwritable-strings 
> -mdisable-fpregs -Wall -c -o build.o build.c
> rm -f build.c
> hppa-linux-ld -N --Ttext 0x500000 -e '$START$' -o iplelf crt0.o ipl.a 
> build.o `hppa-linux-gcc -print-libgcc-file-name`
> ipl.a: could not read symbols: Archive has no index; run ranlib to add one
> make[2]: *** [iplelf] Error 1
> make[2]: Leaving directory `/cvs/palo/ipl'
> make[1]: *** [makeipl] Error 2
> make[1]: Leaving directory `/cvs/palo'
> make: *** [palo] Error 2
> 

you need to go to /palo/ipl and do  "hppa-linux-ranlib ipl.a". Then go back 
to /linux and do a "make palo" again.

This is a common problem, in which I also run every time if /palo changes. 
Matt/Paul: can't we fix this in the Makefile ?

Helge.
