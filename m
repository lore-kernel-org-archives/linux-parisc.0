Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob03.one.net.au (mail-ob03.one.net.au [61.12.0.163])
	by dsl2.external.hp.com (Postfix) with ESMTP id 906DC482A
	for <parisc-linux@parisc-linux.org>; Sat, 14 Apr 2001 04:54:51 -0600 (MDT)
Received: Received: [from squeak.local (async119-ade-isp-3.nas.one.net.au [203.101.88.120])
	by mail-ob03.one.net.au  with SMTP id f3EAsl311084
	for <parisc-linux@parisc-linux.org>; Sat, 14 Apr 2001 20:54:48 +1000 (EST)]
From: amodra@one.net.au
Date: Sat, 14 Apr 2001 21:25:57 +0930
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] xfree86 build problem
Message-ID: <20010414212557.E16364@squeak.one.net.au>
References: <200104132221.QAA09052@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200104132221.QAA09052@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Fri, Apr 13, 2001 at 04:21:16PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 13, 2001 at 04:21:16PM -0600, Grant Grundler wrote:
> 1) error.o was built with:
> gcc -c -O2 -g -ansi -pedantic -Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs  -I../include    -I../../../../include   -I../../../../include/GL  -I../../../.. -I../../../../exports/include  -Dlinux  -D_POSIX_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_SVID_SOURCE -D_GNU_SOURCE -DX_LOCALE   -DFUNCPROTO=15 -DNARROWPROTO   -DNDEBUG  error.c
>    Is the -fPIC missing here?

Yes (or error.o shouldn't be included in the shared lib)

>    If so, why does "file" say it's relocatable?

Because it is. :)  Relocatable files don't have to be PIC.

> 2) c++ isn't returning the error reported by collect2
>    Fortunately the build soon dies since the expected product
>    doesn't exist. Known problem?

Are you sure about this statement?  It might just be "make" (the presense
of those `+'s is ringing bells with me but I don't recall the exact
signifigance.)

Alan
