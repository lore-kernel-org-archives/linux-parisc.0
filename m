Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id F24C3482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Nov 2002 14:38:13 -0700 (MST)
Date: Mon, 18 Nov 2002 21:38:22 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] next issues ...
In-Reply-To: <200211172126.gAHLQRxs018282@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.44.0211172143030.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, 17 Nov 2002, John David Anglin wrote:

> > that fast *waeehhh* someone missed that last zero at 715/100(0) 8-(
>
> Yes, full bootstrap and check is close to 24 hours on 100MHz machines.

*grmml* failed again in; this time in parse.o

running
../gcc/configure --enable-nls=no --with-gnu-ld \
	--enable-languages=c,c++,objc --disable-libgcj
now

failed too this night...

running

../gcc/configure -v --enable-languages=c,c++,f77,objc --prefix=/usr --infodir=/share/info \
        --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib \
        --enable-long-long --enable-nls --without-included-gettext --disable-checking \
        --enable-threads=posix --with-cpp-install-dir=bin --enable-objc-gc hppa-linux

now. really lokks better ... *grmml*


> > no bash, nowhere, never, not as dflt ! 2> /dev/null ;-))

meant:

bz@apollo:~> echo $SHELL
/usr/bin/tcsh

> What's /bin/sh?

a symlink ;-)  could be (a|k|z|...)sh too but is a bash at the moment...

*_will_* be a sh(1) some day but it's not yet stable and fully usable...

bz@apollo:~/sh> uname
Linux
bz@apollo:~/sh> ./sh -c 'echo BSD rulez \:-\)'
BSD rulez :-)

bz@apollo:~/sh> strings ./sh | egrep -E '(BSD|Berkeley)'
$FreeBSD: src/bin/sh/arith.y,v 1.13 2002/02/02 06:50:45 imp Exp $
$FreeBSD: src/bin/sh/arith_lex.l,v 1.17 2002/02/02 06:50:46 imp Exp $
$FreeBSD: src/usr.bin/printf/printf.c,v 1.26 2002/09/04 23:29:05 dwmalone Exp $
@(#)yaccpar     1.9 (Berkeley) 02/21/93
@(#)history.c   8.1 (Berkeley) 6/4/93
@(#)tokenizer.c 8.1 (Berkeley) 6/4/93

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
