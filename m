Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 405DC4877
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 11:47:40 -0600 (MDT)
Date: Fri, 12 Jul 2002 09:56:16 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: gcc@gcc.gnu.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problem building gcc-3.2 (cvs head) on hppa-linux
Message-ID: <20020712165616.GA8724@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020712072703.GA8838@tausq.org> <200207121344.g6CDi4vc017066@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200207121344.g6CDi4vc017066@hiauly1.hia.nrc.ca>
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

> Yes.  This is one of the manifestations of the the long call bug
> in 3.0.4.  You need to use "-O2" in STAGE1_CFLAGS to work around
> it or use gcc 3.1 later as a bootstrap compiler.  You will have
> the same problem if you try to rebuild 3.0.x.  There is a silent
> miscompilation of expr.c if I remember correctly.

with gcc-3.1 as bootstrapping compiler:

$ gcc -v
Reading specs from /home/tausq/opt/gnu/lib/gcc-lib/hppa-linux/3.1.1/specs
Configured with: /home/tausq/src/gcc-20020708/configure --prefix=/home/tausq/opt/gnu --host=hppa-linux --build=hppa-linux --target=hppa-linux --enable-shared --disable-nls --enable-languages=c
Thread model: single
gcc version 3.1.1 20020708 (prerelease)


gcc -DIN_GCC -DCROSS_COMPILE   -g  -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long  -DHAVE_CONFIG_H  -o cc1 \
        c-parse.o c-lang.o attribs.o c-errors.o c-lex.o c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-common.o c-format.o c-semantics.o c-objc-common.o libcpp.a  main.o libbackend.a   ../libiberty/libiberty.a
/usr/bin/ld: libbackend.a(expr.o)(.text+0x3f660): cannot reach 000002bc_integer_zerop+0, recompile with -ffunction-sections
/usr/bin/ld: libbackend.a(expr.o)(.text+0x3f660): cannot handle R_PARISC_PCREL17F for integer_zerop
/usr/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status

i'll do a bit more digging later

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
