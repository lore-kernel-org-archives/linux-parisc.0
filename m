Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 52A114A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 03:28:58 -0700 (MST)
Sender: plattner@dns2.dot.at
Message-ID: <3A8FA3D8.19E69EF6@dot.at>
Date: Sun, 18 Feb 2001 11:28:40 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile
 system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello again !

I have found the method working here.

The GLIBC must be built with the line:

	make user-defined-trusted-dirs=/lib 

This adds the `/lib' to the internal trusted search path, which is
defined in the
generated files ./elf/trusted-dirs.{st,h}. After this the normal
installation to the
configured prefix (in my case /usr/parisc/hppa-linux)

	make install user-defined-trusted-dirs=/lib

and the installation to the NFS root directory can be done by repeating
install with

	make install user-defined-trusted-dirs=/lib
install_root=/tftpboot/apollo/root

On the workstation (booted from the palinux-0.5 root file system) I
mounted my new
NFS root to /mnt and used the command
	
	ldconfig -v -r /mnt

And after that I booted from tne new root, and the error was, that there
was no inittab
and no process left......

So I have success !!!! (I know, that there is nothing to boot further,
except the init
itself !!)

Now a further question. How to build successfully a `bash', with other
tools (expect
strace) I have not so big problems.

The `bash' built process has problems in `configure' in a cross compiled
environment.
It tries some functions via C examples, and they have difficulties to
determine the
result of a compile option, as this is not native....

I tried with 

	HOSTCC=gcc CC=hppa-linux-gcc ../configure --host=hppa-linux \
		 --prefix=/usr/parisc/hppa-linux 

Configure stops with:

checking for working alloca.h... yes
checking for alloca... yes
checking whether getpgrp takes no argument... configure: error: cannot
check getpgrp if cross compiling

How to build a bash (I am always interested in building from the scratch
(hobby)) !

With friendly regards

	Christoph P.

Alan Modra wrote:
> 
> On Thu, 8 Feb 2001, Christoph Plattner wrote:
> 
> > After the glibc builts perfect, I have a problem in setting up the root
> [snip]
> > with page fault or with "cannot find libc.6.so". Only the root of the
> [snip]
> 
> "with page fault" is possibly due to the glibc bug I mentioned in
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-February/011686.html
> 
> "cannot find libc.so.6" is a different problem, a result of
> cross-compiling glibc with --prefix different to final install location.
> Let's see if I can explain the problem...
> 
> Suppose you want to cross-compile the toolchain and glibc from an
> i686-linux system, and you have chosen --target=hppa-linux.  Further
> suppose you decide to install to /usr/ on your host x86 system (This
> does work safely, despite various recipes recommending /usr/parisc,
> or /opt/parisc).  Now when cross-compiling glibc, you obviously _don't_
> want to install glibc on your host to /usr, as the glibc you create is an
> hppa-linux binary, which doesn't run very well on x86-linux!  So the
> proper install destination for glibc is given by --prefix=/usr/hppa-linux.
> This is also the root of directories where your hppa-linux cross-tools
> will look first for libraries and system header files etc.  If you chooes
> some other prefix (ie. not <compiler prefix>/<compiler target>) then
> you'll have problems cross compiling.
> 
> However, trying to install the glibc that works for a cross-compiler
> tool-chain to your target system, at a different location, fails
> miserably because shared libraries specify where to look for their
> "interpreter" (dynamic linker).  Your cross-compiled glibc will be looking
> for /usr/hppa-linux/lib/ld.so.1, while a native glibc will look for
> /lib/ld.so.1.  Also, a cross-compiled dynamic linker knows to look under
> /usr/hppa-linux/ for libraries and ld.so.cache.  On the other hand, you
> probably want your libraries in their normal locations so that you don't
> accidentally use the wrong library.
> 
> Of course, it's very useful to be able to install your cross-compiled
> glibc to your target :-), and hopefully the above explanation suggests one
> way around the problems:
>  - Install your glibc to a temp dir on your nfs server
>    eg. "make install_root=/var/tmp/install"
>  - Move files from /var/tmp/install to /tftpboot/<proper locataion>
>    It helps if you know what <proper location> is!  Compile glibc native
>    for x86 and install to another temp dir if you don't know.
>  - Make relative symbolic links in /tftpboot/.../usr/hppa-linux/lib/ to
>    the shared libs you installed to /tftpboot/.../lib/
>  - ln -s ../../etc /tftpboot/.../usr/hppa-linux/etc too
>  - What else?  Oh yeah, /usr/lib/libc.so and some of the files installed
>    to /usr/bin/ are text files, and some have paths to    /usr/hppa-linux.
>    Edit them.
> 
> It would be nice if you could cross-compile glibc with --prefix=/usr, but
> last time I tried this, quite some time ago, it failed because
> /usr/include/ was being used for headers.  Maybe there's an easy way
> around this.
> 
> Alan Modra
> --
> Linuxcare.  Support for the Revolution.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
