Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep01-mail.bloor.is.net.cable.rogers.com (fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F1CD4845
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Apr 2003 10:07:39 -0600 (MDT)
Date: Sat, 26 Apr 2003 12:08:29 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: "Boehm, Hans" <hans_boehm@hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Program counter from sigcontext, constructors
Message-ID: <20030426160829.GE8269@systemhalted>
References: <75A9FEBA25015040A761C1F74975667D01442052@hplex4.hpl.hp.com> <200304252137.h3PLb16r014226@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304252137.h3PLb16r014226@hiauly1.hia.nrc.ca>
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

> > spe170> cc -fPIC -g constr.c
> > spe170> ./a.out
> > Segmentation fault
> 
> I'm unable to duplicate this on gsyprf11.  I tried several gcc versions.
> I'm using glibc 2.3.1-15.  ld is version 2.13.90 20030210.
> 

Which versions did you try? :)

bash-2.05b$ gcc-3.0 -fPIC -g test-fpic.c; ./a.out
Segmentation fault

GNU ld version 2.13.90.0.18 20030121 Debian GNU/Linux

Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0.4/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,objc
--prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared
--with-gnu-as --with-gnu-ld --with-system-zlib --enable-long-long
--enable-nls --without-included-gettext --disable-checking
--enable-threads=posix --with-cpp-install-dir=bin --enable-objc-gc
hppa-linux
Thread model: posix
gcc version 3.0.4

Crashes under 3.0.4, looks like the possible PIC register bug we saw
with the double printf. I recommend you move to a newer gcc if possible.
I spent a few minutes looking at assembler output and %r19 looks to low
to be valid...

c.
