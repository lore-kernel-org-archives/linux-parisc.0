Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp4ve.mailsrvcs.net (smtp4vepub.gte.net [206.46.170.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 237174A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 23:10:38 -0700 (MST)
Received: from neuronet.pitt.edu (adsl-151-201-239-223.pittpa.adsl.bellatlantic.net [151.201.239.223])
	by smtp4ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id GAA1502073
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 06:15:43 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3A935BDC.E2475A98@neuronet.pitt.edu>
Date: Wed, 21 Feb 2001 01:10:36 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Cannot build 02/18/2001 glibc
References: <Pine.LNX.4.21.0102191946290.23583-100000@front.linuxcare.com.au>
		  <3A91479E.9C9EB68A@neuronet.pitt.edu> <20010220175938.6DE7B37C9D@carmen.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart wrote:
> 
> "Rafael E. Herrera" writes...
> 
> > Alan Modra wrote:
> > >
> > > On Mon, 19 Feb 2001, Rafael E. Herrera wrote:
> > >
> > > > checking for assembler line separator... *** You need a newer assembler
> > > > to compile glibc
> > > >[snip]
> > > >  /usr/i486-suse-linux/bin/as -V -Qy -v -o conftest.o conftest.s
> > >
> > > Oops, this is an x86 assembler.
> > >
> > > > The binaries called and the version numbers are shown. Do I need to
> > > > upgrade the assembler or is it a PATH misconfiguration? Thanks.
> > >
> > > You need the hppa-linux assembler installed and available on your PATH.
> >
> > The PATH needs to include both of these entries:
> >
> > PATH=~/palinux/bin:~/palinux/hppa-linux/bin:$PATH
> >
> > I had just first one before.
> 
> No, you don't want hppa-linux/bin in there because then the build will only
> use the cross-compiler and will fail if it needs to build any i386
> binaries(like intermediate build tools etc.). As long as you have --host and
> --build set right then the build will do the right thing.

If I use these to build glibc library:

export MACH=i386-linux
export DEST=~/parisk/palinux
export ROOT=~/parisk
PATH=~/parisk/palinux/bin:$PATH

$ROOT/source/glibc/configure --prefix=$DEST/hppa-linux --build=$MACH \
--host=hppa-linux --target=hppa-linux \
--with-headers=$ROOT/source/linux/include --disable-profile \
--without-cvs --enable-add-ons

I get the same error reported initially. 'configure' does not use/find
the cross compiler. From a previous post, If I use this instead:

HOSTCC=gcc CC=hppa-linux-gcc $ROOT/source/glibc/configure
--prefix=$DEST/hppa-linux --build=$MACH \
--host=hppa-linux --target=hppa-linux \
--with-headers=$ROOT/source/linux/include --disable-profile \
--without-cvs --enable-add-ons

Configure doesn't fail and one can start building. I did not have this
problem a couple of weeks ago when I first tried this, I used snapshots
(from early february, before the newest were available -- they were zero
length) that allowed me to build a kernel image  and boot my machine. I
run into other problems, but I'll post questions about them later if I
still have them with these updated sources.

I've looked briefly at the main configure script and compared it to the
last revision, but cannot figure out why it uses the x86 assembler.
Perhaps the mantainer can resolve this.

Thanks
-- 
     Rafael
