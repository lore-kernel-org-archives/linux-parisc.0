Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8EEE64A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 20:56:43 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA13350;
	Fri, 9 Feb 2001 14:56:37 +1100
Date: Fri, 9 Feb 2001 14:56:37 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target root
 file system
In-Reply-To: <3A83226E.A3A77F70@dot.at>
Message-ID: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 8 Feb 2001, Christoph Plattner wrote:

> After the glibc builts perfect, I have a problem in setting up the root
[snip]
> with page fault or with "cannot find libc.6.so". Only the root of the
[snip]

"with page fault" is possibly due to the glibc bug I mentioned in
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-February/011686.html

"cannot find libc.so.6" is a different problem, a result of
cross-compiling glibc with --prefix different to final install location.
Let's see if I can explain the problem...

Suppose you want to cross-compile the toolchain and glibc from an
i686-linux system, and you have chosen --target=hppa-linux.  Further
suppose you decide to install to /usr/ on your host x86 system (This 
does work safely, despite various recipes recommending /usr/parisc,
or /opt/parisc).  Now when cross-compiling glibc, you obviously _don't_
want to install glibc on your host to /usr, as the glibc you create is an
hppa-linux binary, which doesn't run very well on x86-linux!  So the
proper install destination for glibc is given by --prefix=/usr/hppa-linux.
This is also the root of directories where your hppa-linux cross-tools
will look first for libraries and system header files etc.  If you chooes
some other prefix (ie. not <compiler prefix>/<compiler target>) then
you'll have problems cross compiling.

However, trying to install the glibc that works for a cross-compiler
tool-chain to your target system, at a different location, fails
miserably because shared libraries specify where to look for their
"interpreter" (dynamic linker).  Your cross-compiled glibc will be looking
for /usr/hppa-linux/lib/ld.so.1, while a native glibc will look for
/lib/ld.so.1.  Also, a cross-compiled dynamic linker knows to look under
/usr/hppa-linux/ for libraries and ld.so.cache.  On the other hand, you
probably want your libraries in their normal locations so that you don't
accidentally use the wrong library.

Of course, it's very useful to be able to install your cross-compiled
glibc to your target :-), and hopefully the above explanation suggests one
way around the problems:
 - Install your glibc to a temp dir on your nfs server
   eg. "make install_root=/var/tmp/install"
 - Move files from /var/tmp/install to /tftpboot/<proper locataion>
   It helps if you know what <proper location> is!  Compile glibc native
   for x86 and install to another temp dir if you don't know.
 - Make relative symbolic links in /tftpboot/.../usr/hppa-linux/lib/ to
   the shared libs you installed to /tftpboot/.../lib/
 - ln -s ../../etc /tftpboot/.../usr/hppa-linux/etc too
 - What else?  Oh yeah, /usr/lib/libc.so and some of the files installed
   to /usr/bin/ are text files, and some have paths to    /usr/hppa-linux.
   Edit them.

It would be nice if you could cross-compile glibc with --prefix=/usr, but
last time I tried this, quite some time ago, it failed because
/usr/include/ was being used for headers.  Maybe there's an easy way
around this.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
