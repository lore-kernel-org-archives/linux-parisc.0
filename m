Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 169B34A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 01:34:26 -0700 (MST)
Sender: christoph.plattner@alcatel.at
Message-ID: <3A94CEF9.F171DE3F@alcatel.at>
Date: Thu, 22 Feb 2001 09:34:01 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile
 system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au> <3A8FA3D8.19E69EF6@dot.at> <3A94C3B5.EF59259C@neuronet.pitt.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

First of all, the make install has to be done twice !

One time for the tool chain to find the things like crt?.o, libs, etc..
For this the builtin tree is defined (given by --prefix).

	make install user-defined-trusted-dirs=/lib

The second time install it to the nfs root file system

	make install user-defined-trusted-dirs=/lib \
	  install_root=/tftpboot/nfsroot

For the target the `/lib' is the builtin search path, for the
cross tool chain the '/usr/parisc/hppa-linux/lib' (in my case).

AND A VERY IMPORTANT POINT: You have to run `ldconfig'. I tried
this on the target machine (apollo 720) by booting from the
NFS-ROOT of palinux-0.5 (I copied the contents of the CD to a
path exported by NFS). After booting I mounted my new NFSROOT to
`/mnt' and run 
	ldconfig -v -r /mnt

After that I could boot from the new root file system starting the
`init' process (but nothing else....)

Another test to do is to use host's ldconfig fore that work:

	ldconfig -v -r /tftpboot/apollo/root

or something like this...

Cheers
	Christoph P.


"Rafael E. Herrera" wrote:
> 
> Christoph Plattner wrote:
> >
> > I have found the method working here.
> >
> > The GLIBC must be built with the line:
> >
> >         make user-defined-trusted-dirs=/lib
> >
> > This adds the `/lib' to the internal trusted search path, which is
> > defined in the generated files ./elf/trusted-dirs.{st,h}. After
> > this the normal installation to the configured prefix (in my
> > case /usr/parisc/hppa-linux)
> >
> >         make install user-defined-trusted-dirs=/lib
> >
> > and the installation to the NFS root directory can be done by repeating
> > install with
> >
> >         make install user-defined-trusted-dirs=/lib
> > install_root=/tftpboot/apollo/root
> >
> > On the workstation (booted from the palinux-0.5 root file system) I
> > mounted my new NFS root to /mnt and used the command
> >
> >         ldconfig -v -r /mnt
> 
> I'd like to summarize the previously discussed procedure to build glibc
> on the target machine to install in the nfsroot tree.
> 
> Assume the evironment vars for the build tree are
> 
> MACH=i386-linux
> DEST=/mnt/parisc
> ROOT=/mnt
> (The NFS root exported from the directory /tftpboot/nfsroot)
> 
> # The configuration command would be:
> # (--prefix seems to be ignored when using install_root later)
> 
> HOSTCC=gcc CC=hppa-linux-gcc $ROOT/source/glibc/configure \
> --prefix=$DEST --build=$MACH --host=hppa-linux \
> --target=hppa-linux --with-headers=$ROOT/source/linux/include \
> --disable-profile --without-cvs --enable-add-ons
> 
> # The build command
> 
> make user-defined-trusted-dirs=/lib
> 
> # the install command
> 
> make install user-defined-trusted-dirs=/lib \
> install_root=/tftpboot/nfsroot
> 
> Sadly, the boot process stops when init starts. Any comments?
> --
>      Rafael
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
