Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95CAF482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 08:24:59 -0600 (MDT)
Message-Id: <200308111424.h7BEOv14017589@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
To: grundler@parisc-linux.org (Grant Grundler)
Date: Mon, 11 Aug 2003 10:24:57 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030811043457.GA5653@dsl2.external.hp.com> from "Grant Grundler" at Aug 10, 2003 10:34:57 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Did you do the build with one of my private builds of GCC?  They were built
with dwarf2 exception support and don't have these symbols in libgcc_s.so.1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
