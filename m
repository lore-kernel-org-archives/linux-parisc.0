Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 362E54A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 12:53:15 -0700 (MST)
Sender: plattner@dns2.dot.at
Message-ID: <3A9C0588.F2C47418@dot.at>
Date: Tue, 27 Feb 2001 20:52:40 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Ulrich Drepper <drepper@cygnus.com>
Cc: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile   
 system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au>
		<3A8FA3D8.19E69EF6@dot.at> <3A94C3B5.EF59259C@neuronet.pitt.edu>
		<3A94CEF9.F171DE3F@alcatel.at> <3A974D1F.3BBB87C8@neuronet.pitt.edu>
		<m3wvagiojx.fsf@otr.mynet.cygnus.com>
		<3A976261.EEA18B66@neuronet.pitt.edu> <m3k86gil1b.fsf@otr.mynet.cygnus.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

To add some "light" here in the discussion.

The `user-defined-trusted-dirs=/lib' is exactly the "key" in the 
discussion. It tells the online running library loader (file
./elf/ld-load.c)
where to search the libraries. 

When building a cross tool chain and having the library install in
/usr/parisc/hppa-linux/lib, then the cross tool chain will search
there, but also the running programs, because this path is hard-coded
in the ld-load.c loader executable.

No my idea was, to give a "second search path" for the loader. So
the loader will search in /usr/parisc/hppa-linux/lib, will fail and
retry in /lib (as defined in `user-defined-trusted-dirs=/lib'). So also
the running binary on the target machine will access the glibc in /lib.

With friendly regards
	Christoph P.

PS: Of course the way of using --prefix=/usr and installing with 
install_root != /usr is a way, but lets say it, it is a HACK !!

The problems I have with many tools, is that they are not prepared
for cross-compiling very well. I need some evenings for bigger 
packages.


Ulrich Drepper wrote:
> 
> "Rafael E. Herrera" <raffo@neuronet.pitt.edu> writes:
> 
> > export MACH=i386-linux
> > export DEST=/usr
> > export ROOT=~/parisk
> >
> > HOSTCC=gcc CC=hppa-linux-gcc $ROOT/source/glibc/configure \
> > --prefix=$DEST --build=$MACH \
> > --host=hppa-linux --target=hppa-linux \
> > --with-headers=$ROOT/source/linux/include --disable-profile \
> > --without-cvs --enable-add-ons
> 
> This looks OK (though providing HOSTCC shouldn't be necessary) and
> --build, --host, and --target have no effect.  The configure script
> will pick up all it has to know from the CC value.
> 
> > make MAKE="make -j 10" user-defined-trusted-dirs=/lib
> 
> Providing make isn't necessary.  Also, the `user-defined-trusted-dirs'
> is not needed.  Just run
> 
>    make -j10
> 
> > make install user-defined-trusted-dirs=/lib \
> >  install_root=/tmp/glibc
> 
> Again, loose the `user-defined-trusted-dirs'.  Also, is /tmp/glibc
> where the nfsroot is picked up?  If not, just install in the nfsroot
> directory.
> 
> --
> ---------------.                          ,-.   1325 Chesapeake Terrace
> Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
> Red Hat          `--' drepper at redhat.com   `------------------------
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
