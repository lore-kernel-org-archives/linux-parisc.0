Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp4ve.mailsrvcs.net (smtp4vepub.gte.net [206.46.170.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 271D04A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 00:48:16 -0700 (MST)
Sender: raffo@bellatlantic.net
Message-ID: <3A94C3B5.EF59259C@neuronet.pitt.edu>
Date: Thu, 22 Feb 2001 02:45:57 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile
 system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au> <3A8FA3D8.19E69EF6@dot.at>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Christoph Plattner wrote:
> 
> I have found the method working here.
> 
> The GLIBC must be built with the line:
> 
>         make user-defined-trusted-dirs=/lib
> 
> This adds the `/lib' to the internal trusted search path, which is
> defined in the generated files ./elf/trusted-dirs.{st,h}. After
> this the normal installation to the configured prefix (in my
> case /usr/parisc/hppa-linux)
> 
>         make install user-defined-trusted-dirs=/lib
> 
> and the installation to the NFS root directory can be done by repeating
> install with
> 
>         make install user-defined-trusted-dirs=/lib
> install_root=/tftpboot/apollo/root
> 
> On the workstation (booted from the palinux-0.5 root file system) I
> mounted my new NFS root to /mnt and used the command
> 
>         ldconfig -v -r /mnt

I'd like to summarize the previously discussed procedure to build glibc
on the target machine to install in the nfsroot tree.

Assume the evironment vars for the build tree are

MACH=i386-linux
DEST=/mnt/parisc
ROOT=/mnt
(The NFS root exported from the directory /tftpboot/nfsroot)

# The configuration command would be:
# (--prefix seems to be ignored when using install_root later)
 
HOSTCC=gcc CC=hppa-linux-gcc $ROOT/source/glibc/configure \
--prefix=$DEST --build=$MACH --host=hppa-linux \
--target=hppa-linux --with-headers=$ROOT/source/linux/include \
--disable-profile --without-cvs --enable-add-ons

# The build command 

make user-defined-trusted-dirs=/lib

# the install command

make install user-defined-trusted-dirs=/lib \
install_root=/tftpboot/nfsroot

Sadly, the boot process stops when init starts. Any comments?
-- 
     Rafael
