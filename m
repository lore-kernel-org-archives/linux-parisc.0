Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA23603
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 14:09:25 -0600
Date: Sat, 14 Oct 2000 15:10:26 -0500 (EST)
From: Brian Poole <raj@cerias.purdue.edu>
To: Alan Modra <alan@linuxcare.com.au>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles following the 'recipe'
In-Reply-To: <Pine.LNX.4.21.0010141708500.10656-100000@front.linuxcare.com.au>
Message-ID: <Pine.SOL.4.10.10010141453400.22986-100000@basm.cerias.purdue.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Alan Modra wrote..
> Can you show the command line that failed here? If you followed the

Sure. The exact command that this output came from was..

make -j2 LIBGCC2_INCLUDES=-I$DEST/include

And I configured it as per the recipe with..

../gcc/configure --target=hppa1.1-linux --prefix=$DEST --host=$MACH
--disable-nls --without-libc

which according to configure configured gcc as..

../gcc/configure
--with-gcc-version-trigger=/home/raj/parisc/gcc/gcc/version.c
--target=hppa1.1-linux --prefix=/usr/parisc --host=i386-linux
--disable-nls --without-libc --norecursion

> recipe, then you should have configured gcc with --prefix=$DEST, and have 
> $DEST/include/errno.h on your system.

Indeed, I noted this myself, was wondering why it had not found headers
that I should have. The errno.h header is in fact in $DEST/include,
checked then and just checked again.

However doesn't prefix indicate where it is installing to, and not where
it is reading from for it's includes, or am I missing something? 


Thanks for the help,

-b
