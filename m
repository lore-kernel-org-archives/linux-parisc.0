Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 482EC482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 01:29:55 -0600 (MDT)
Date: Tue, 1 Jul 2003 09:29:50 +0200
Message-ID: <3ED71F6D0000BB03@ocpmta7.freegates.net>
In-Reply-To: <20030630163918.GD14971@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] byte swapping redux
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Grant,

> For the record, here are the toolchain versions I'm using:
> grundler@ios:~$ ld -v
> GNU ld version 2.14.90.0.1 20030505 Debian GNU/Linux
> grundler@ios:~$ gcc -v
> Reading specs from /usr/lib/gcc-lib/hppa-linux/3.2.3/specs
> Configured with: ../src/configure -v
> --enable-languages=c,c++,f77,objc,ada --prefix=/usr
> --mandir=/usr/share/man --infodir=/usr/share/info
> --with-gxx-include-dir=/usr/include/c++/3.2 --enable-shared
> --with-system-zlib --enable-nls --without-included-gettext
> --enable-__cxa_atexit --enable-clocale=gnu --enable-objc-gc hppa-linux
> Thread model: posix
> gcc version 3.2.3
> grundler@ios:~$ 

Ok, and so is it the same pb with binutils 2.13.90 (if you have the opportunity
to test it)?

> > which Dave fixed in upstream a time ago but (I don't know why) not yet
> > included in debian dpkg.
> 
> Dave isn't responsible for the debian package...find the maintainer.

I will try to find some time to open a pr near debian maintainer ;-)

Thanks,
    Joel

PS: The disk I used to test 64bits kernel on teh N class is broken :(, so
awaiting a spare part and rebuild a system, here I will go to build the kernel
2.4.21-pa0 and 2.4.21-pa1 (in 32bits mode) then objdump all object and diff
them in the hope to find the pb

---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
