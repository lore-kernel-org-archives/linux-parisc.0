Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA08606
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 09:17:44 -0600
Received: from localhost (sammy@localhost)
	by sammyville.sammy.net (8.8.7/8.8.7) with ESMTP id KAA22335
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 10:18:30 -0400
Date: Fri, 14 Apr 2000 10:18:30 -0400 (EDT)
From: Sam Creasey <sammy@sammy.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0004141013240.5167-100000@sammyville.sammy.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] cross compiling glibc
List-ID: <linux-parisc.vger.kernel.org>



Ok, according to CVS, my tree is now entirely sync'd with the repository
for glibc.

And I just built glibc right "out of the box".

Hopefully this procedure will work for you:


(checkout glibc)
cd glibc
mkdir hppa1.1-linux
cd hppa1.1-linux

../configure --disable-shared --disable-profile --enable-static-nss
--build=i686-linux --host=hppa1.1-linux --disable-sanity-checks

make

(yes, the entire make should actually happen right now -- though
nss/makedb still won't compile without the binutils fix I just checked
in).

make install install_root=/raid/hp/root MAKEINFO=

This runs in install into the root for my 712's NFS mount.
The MAKEINFO= is important, it keeps it from trying to build the manuals,
which doesn't work without the addon.


Hope it goes as smoothly for anyone else.

-- Sam
