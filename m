Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 440C04A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 00:43:17 -0700 (MST)
Sender: drepper@cygnus.com
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile   system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au>
	<3A8FA3D8.19E69EF6@dot.at> <3A94C3B5.EF59259C@neuronet.pitt.edu>
	<3A94CEF9.F171DE3F@alcatel.at> <3A974D1F.3BBB87C8@neuronet.pitt.edu>
	<m3wvagiojx.fsf@otr.mynet.cygnus.com>
	<3A976261.EEA18B66@neuronet.pitt.edu>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 23 Feb 2001 23:42:56 -0800
In-Reply-To: "Rafael E. Herrera"'s message of "Sat, 24 Feb 2001 02:27:29 -0500"
Message-ID: <m3k86gil1b.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Rafael E. Herrera" <raffo@neuronet.pitt.edu> writes:

> export MACH=i386-linux
> export DEST=/usr
> export ROOT=~/parisk
> 
> HOSTCC=gcc CC=hppa-linux-gcc $ROOT/source/glibc/configure \
> --prefix=$DEST --build=$MACH \
> --host=hppa-linux --target=hppa-linux \
> --with-headers=$ROOT/source/linux/include --disable-profile \
> --without-cvs --enable-add-ons

This looks OK (though providing HOSTCC shouldn't be necessary) and
--build, --host, and --target have no effect.  The configure script
will pick up all it has to know from the CC value.

> make MAKE="make -j 10" user-defined-trusted-dirs=/lib

Providing make isn't necessary.  Also, the `user-defined-trusted-dirs'
is not needed.  Just run

   make -j10

> make install user-defined-trusted-dirs=/lib \
>  install_root=/tmp/glibc

Again, loose the `user-defined-trusted-dirs'.  Also, is /tmp/glibc
where the nfsroot is picked up?  If not, just install in the nfsroot
directory.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
