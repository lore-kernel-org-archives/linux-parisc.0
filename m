Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA12959
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 16:32:52 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by cosrel2.hp.com (Postfix) with ESMTP id 6EAB7656
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 16:32:37 -0600 (MDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 393AB4FF58
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 17:32:15 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id PAA20329 for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 15:32:21 -0700 (PDT)
Message-Id: <200004142232.PAA20329@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cross compiling glibc 
In-reply-to: Your message of "Fri, 14 Apr 2000 10:18:30 PDT."
             <Pine.LNX.4.21.0004141013240.5167-100000@sammyville.sammy.net>
Date: Fri, 14 Apr 2000 15:32:21 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Sam Creasey wrote:
> Hopefully this procedure will work for you:
> 
> 
> (checkout glibc)
> cd glibc
> mkdir hppa1.1-linux
> cd hppa1.1-linux
> 
> ../configure --disable-shared --disable-profile --enable-static-nss
> --build=i686-linux --host=hppa1.1-linux --disable-sanity-checks

So far so good. But since I wanted to build under HP-UX I had to change
a few things on the configure line:

../configure --disable-shared --disable-profile --enable-static-nss \
    --build=hppa1.1-hpux --host=hppa1.1-linux --disable-sanity-checks \
    --with-headers=/opt/puffin/include

/opt/puffin/include contains the linux headers files the Mathew Wilcox
tar'd and placed on puffin.external.hp.com.


> make

And then the make died for two different reasons:
1) can't use HP-UX sed. I pulled the sources from the
   porting center and installed them under /opt/puffin/

2) perl. HP-UX 11 ships with perl 4. glibc wants perl5.
   Pulled perl-5.005_03-1.hpux-11.0.depot.gz from puffin.external.hp.com
   and it got quite a bit further

3) I also removed "csu" from sysd-sorted directory list.
   Mathew told me to. So I did. This has to be done *after*
   running ./configure script.

and then the make completed.

> 
> (yes, the entire make should actually happen right now -- though
> nss/makedb still won't compile without the binutils fix I just checked
> in).
> 
> make install install_root=/raid/hp/root MAKEINFO=

Since my NFS root isn't on my build machine, I used
    make install install_root=/linux/root MAKEINFO=

with the plan on recursively copying that over to the nfs root.
For some reason I had to remove "csu" from sysd-sorted again.
Probably just forgot too while retrying something...

thanks Sammy!
grant

> 
> This runs in install into the root for my 712's NFS mount.
> The MAKEINFO= is important, it keeps it from trying to build the manuals,
> which doesn't work without the addon.
> 
> Hope it goes as smoothly for anyone else.
> 
> -- Sam

Grant Grundler
Unix Development Lab
+1.408.447.7253
