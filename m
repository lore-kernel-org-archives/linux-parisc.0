Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp5ve.mailsrvcs.net (smtp5vepub.gte.net [206.46.170.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id DEBA34A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 01:15:22 -0700 (MST)
Received: from neuronet.pitt.edu (adsl-151-201-241-66.pittpa.adsl.bellatlantic.net [151.201.241.66])
	by smtp5ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id IAA3714908
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 08:22:15 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3A976D8E.B7F9CF66@neuronet.pitt.edu>
Date: Sat, 24 Feb 2001 03:15:10 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile   
 system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au>
		<3A8FA3D8.19E69EF6@dot.at> <3A94C3B5.EF59259C@neuronet.pitt.edu>
		<3A94CEF9.F171DE3F@alcatel.at> <3A974D1F.3BBB87C8@neuronet.pitt.edu>
		<m3wvagiojx.fsf@otr.mynet.cygnus.com>
		<3A976261.EEA18B66@neuronet.pitt.edu> <m3k86gil1b.fsf@otr.mynet.cygnus.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

My last build hangs at init.

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

If I drop  --build, --host, and --target I get compilation errors, only
HOSTCC was unnecessary.

> > make MAKE="make -j 10" user-defined-trusted-dirs=/lib
> 
> Providing make isn't necessary.  Also, the `user-defined-trusted-dirs'
> is not needed.

dropped

>  Just run
>    make -j10

compiling now.

> > make install user-defined-trusted-dirs=/lib \
> >  install_root=/tmp/glibc
> 
> Again, loose the `user-defined-trusted-dirs'.  Also, is /tmp/glibc
> where the nfsroot is picked up?  If not, just install in the nfsroot
> directory.

No, it's an empty directory. I'm building in a remote machine, which is
much faster than this box. I tar the whole thing, ftp it and then unpack
it on top of the nfs root. We'll see, it'll take a few minutes.

By the way, I don't intend to use this build for cross compile other
packages, I just want to be able to install these in the nfs root. I
build the cross compile version with a --prefix that puts it out of the
way.

-- 
     Rafael
