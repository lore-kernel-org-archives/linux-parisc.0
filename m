Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp5ve.mailsrvcs.net (smtp5vepub.gte.net [206.46.170.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E1CB4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 22:56:57 -0700 (MST)
Sender: raffo@bellatlantic.net
Message-ID: <3A974D1F.3BBB87C8@neuronet.pitt.edu>
Date: Sat, 24 Feb 2001 00:56:47 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile
 system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au> <3A8FA3D8.19E69EF6@dot.at> <3A94C3B5.EF59259C@neuronet.pitt.edu> <3A94CEF9.F171DE3F@alcatel.at>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Christoph Plattner wrote:
> 
> First of all, the make install has to be done twice !
> 
> One time for the tool chain to find the things like crt?.o, libs, etc..
> For this the builtin tree is defined (given by --prefix).
> 
>         make install user-defined-trusted-dirs=/lib
> 
> The second time install it to the nfs root file system
> 
>         make install user-defined-trusted-dirs=/lib \
>           install_root=/tftpboot/nfsroot
> 
> For the target the `/lib' is the builtin search path, for the
> cross tool chain the '/usr/parisc/hppa-linux/lib' (in my case).
> 
> AND A VERY IMPORTANT POINT: You have to run `ldconfig'. I tried
> this on the target machine (apollo 720) by booting from the
> NFS-ROOT of palinux-0.5 (I copied the contents of the CD to a
> path exported by NFS). After booting I mounted my new NFSROOT to
> `/mnt' and run
>         ldconfig -v -r /mnt
> 
> After that I could boot from the new root file system starting the
> `init' process (but nothing else....)

export MACH=i386-linux
export DEST=~/parisk/palinux
export ROOT=~/parisk

HOSTCC=gcc CC=hppa-linux-gcc $ROOT/source/glibc/configure \
--prefix=$DEST/hppa-linux --build=$MACH \
--host=hppa-linux --target=hppa-linux \
--with-headers=$ROOT/source/linux/include --disable-profile \
--without-cvs --enable-add-ons
make MAKE="make -j 10" user-defined-trusted-dirs=/lib
make install user-defined-trusted-dirs=/lib
make install user-defined-trusted-dirs=/lib \
 install_root=/tmp/glibc

Then copied all the new files onto a second copy of nfsroot.
Booted the original, mounted the second under /mnt and run:

	parisc:/etc# ldconfig -v -r /mnt

and I got this:

ldconfig: Can't open configuration file /mnt//etc/ld.so.conf: No such
file or directory

I rebooted with the second nfsroot and got a login prompt. However, I
can't run ldconfig again and I get this error msg.:

parisc:/etc# ldconfig -v       
ldconfig: Can't open configuration file
/usr1/users/raffo/parisk/palinux/hppa-linux/etc/ld.so.conf: No such file
or directory
/usr1/users/raffo/parisk/palinux/hppa-linux/lib:
ldconfig: Can't open directory
/usr1/users/raffo/parisk/palinux/hppa-linux/lib: No such file or
directory
ldconfig: Can't create temporary cache file
/usr1/users/raffo/parisk/palinux/hppa-linux/etc/ld.so.cache~: No such
file or directory

I I create those directories and a ld.so.conf, it works, but the files
are out of place. Maybe if it were possible to configure and install the
files in the x86 machine under a pseudo /, it would install properly.
Would 'chroot' work here?

-- 
     Rafael
