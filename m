Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 600AD486A
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 21 Apr 2004 05:56:01 -0600 (MDT)
Date: Wed, 21 Apr 2004 07:55:22 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [PATCH] glibc-2.3.3 error with debian
	unstable	compiler...
Message-ID: <20040421115522.GH28094@baldric.uwo.ca>
References: <20040420193537.GB28094@baldric.uwo.ca>
	<40711E5600009DD2@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40711E5600009DD2@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> >What does tst-rndseek.out say? I don't see this error?
> grrr just a time out (I would have to put the 'export TIMEOUTFACTOR=4' in
> the root profile on my chroot disk :? )
> 
> GCONV_PATH=/Develop/parisc-linux/build/glibc/iconvdata LC_ALL=C   /Develop/parisc-linux/build/glibc/elf/ld.so.1
> --library-path /Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:/Develop/parisc-linux/build/glibc/nis:/Develop/p
> arisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
> /Develop/parisc-linux/build/glibc/stdio-common/tst-rndseek  > /Develop/parisc-linux/build/glibc/stdio-common/tst-rndseek.out
> Timed out: killed the child process

Yes, the default timeout is too short, add a TIMEOUTFACTOR of 5 or more.

c.
