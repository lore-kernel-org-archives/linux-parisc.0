Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA05714
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Feb 2000 22:01:51 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id XAA15540
	for parisc-linux@thepuffingroup.com; Mon, 14 Feb 2000 23:02:26 -0500
Date: Mon, 14 Feb 2000 23:02:26 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000214230226.P9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] new binutils/gcc
List-ID: <linux-parisc.vger.kernel.org>


As some of you may have noticed, we now have new binutils and gcc in CVS.
If you previously checked out binutils and/or egcs, you should probably
delete them and get a fresh checkout.  Thanks to Cygnus, this is the
ELF-supporting toolchain.  Thanks to Sammy, this includes sufficient
support for 32-bit ELF to link a kernel.  I've asked him to hold off for
a few days on checking in the kernel changes until everyone has the new
toolchain installed and we have depots/rpms/debs/whatever available.

If you're too impatient or want to hack the toolchain, here's my experience
with it so far on HPUX 11:

install GNU flex.  ld won't build with hpux lex, alas.
install GNU bison.  gcc doesn't even attempt to use yacc.

cvs co binutils
mkdir binutils-build
cd binutils-build
./binutils/configure --target=hppa1.1-linux --prefix=/home/willy/gcc \
	--host=hppa-hpux --disable-nls
make
make install

PATH=/home/willy/gcc/bin:$PATH

cvs co gcc
mkdir gcc-build
cd gcc-build
./gcc/configure --target=hppa1.1-linux --prefix=/home/willy/gcc \
	--host=hppa1.1-hpux --disable-nls
make

and then it dies while making libgcc2.a.  I'll look at it more tomorrow,
but this may save some people some time.
