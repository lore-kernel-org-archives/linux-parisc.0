Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4593482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 05:29:33 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f9BCBQG08023
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 08:11:26 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f9BBV1E07659
	for parisc-linux@lists.parisc-linux.org; Thu, 11 Oct 2001 07:31:01 -0400
Date: Thu, 11 Oct 2001 07:31:01 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011011073101.B5637@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Glibc 2.2.4-2 No Optimizations = No Compliation
List-ID: <linux-parisc.vger.kernel.org>

pa-list,

I was working on glibc once again last night.

With the hopes of compiling the library with less optimizations
and tracing through some saner PARISC assembly.

I've noticed that glibc-2.2.4/config.h.in (eventually becomes
config.h) throws an error if glibc is compiled wihtout 
optimizations.

"#error glibc cannot be compiled without optimizations"

Why?

I've trolled the glibc lists, and the faq, hunted through gcc
manuals and referance documentation... to no avail.

As of last year, Drepper made -02 the stable glibc 
compilation standard.

I've compiled glibc with -O1 and it looks like saner assembly.
I have yet to do a full trace through again.

I would like to compile with -O0, but I'm not quite sure of
the ramifications. 

Any reasons why I can't? Any ideas?

c.

Note: This is only for the sake of debugging :)
