Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id ECAB6482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 08:10:25 -0600 (MDT)
Date: Mon, 11 Aug 2003 10:07:46 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030811140745.GB17081@systemhalted>
References: <20030811043457.GA5653@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030811043457.GA5653@dsl2.external.hp.com>
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

Grant,

> The basic problem is glxinfo (C program) links against libGLU.so
> (C++ built library). But glxinfo fails to link using gcc:
> ...
> gcc -o glxinfo -g -O -ansi -pedantic -Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs -Wundef     -L../../exports/lib glxinfo.o -lGLU -lGL -lXext -lX11  -lpthread -lm -Wl,-rpath-link,../../exports/lib
> ../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Resume@GCC_3.0'
> ../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.0'
> /usr/bin/../lib/libstdc++.so.5: undefined reference to `_Unwind_SjLj_RaiseException@GCC_3.0'
> ../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_3.0'
> /usr/bin/../lib/libstdc++.so.5: undefined reference to `_Unwind_SjLj_Resume_or_Rethrow@GCC_3.3'
> collect2: ld returned 1 exit status
> ...

All of those should resolve to /lib/libgcc_s.so, which gcc should
include for you.
 
> Is libGLU.so getting built wrong?  (ie resolved in libGLU.so directly)
> Or should C programs not use C++ built libs? (How can the author know?)
> Or is this a bug in gcc/binutils? (not picking up libgcc_eh.a)

Doesn't look like it. It looks more like gcc broke.

> This might be a generic problem since a few other libs on
> my box have _Unwind_SjLj_Resume (for example) unresolved:
> 
> libasprintf.a
> libgmpxx.a
> libncurses++.a

That's fine, but they should be linked against /lib/libgcc_s.so.
Run ldd on them, followed by 'readelf -a <lib>' and you'll see that 
that libgcc_s.so provides the symbols as GLOBAL DEFAULT and versioned 
correctly.

c.
