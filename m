Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 281B4482A
	for <parisc-linux@parisc-linux.org>; Wed, 17 Oct 2001 21:39:05 -0600 (MDT)
Date: Wed, 17 Oct 2001 23:40:38 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: randolph@tausq.org, parisc-linux@parisc-linux.org
Subject: [randolph@tausq.org: [parisc-linux] glibc update]
Message-ID: <20011017234038.C1060@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

R,

>1. the glibc i uploaded is actually built with a fairly old binutils
>(version 2.11.90.0.7-2.0.1). There could well be many binutils bug fixes 
>since then, but at least for this case it lets us build glibc without 
>the segfaults we see with the newer binutils

I'll see about giving it a try on my 712/60 and 715/50's

>2. the newest binutils (2.11.92.0.5-3), also in incoming, doesn't appear
>to address the glibc build issue as i originally thought. we still get
>ld.so segfaults as Carlos has observed earlier. Perhaps someone (Carlos,
>Alan, Rob?) can look at the binutils changes since then can see what
>broke?

Eventually I'll get that assembly trace done.

>3. with the glibc build (using old binutils) some of the linuxthreads
>tests are failing. in particular there's one case where it seems to get
>into a deadlock. i left it running overnight and it's still stuck ... 
>i don't know if this has always been broken though.

This reminds me, in general I keep forgetting to add the location of
/xxx/glibc-2.2.4/hppa-linux/obj to LD_LIBRARY_PATH. This nips some of
the tests in the bud since ld goes looking for the wrong library.

>Build logs for #3 and #2 above can be found at:
>#3: http://people.debian.org/~tausq/glibc.build.log2
>#2: http://people.debian.org/~tausq/glibc.build.log5

Have you tried running the tests by hand and seeing what the output is?

What is the output of running:
/home/randolph/gcc-3.0/glibc-2.2.4/hppa-linux/obj/math/test-fenv.out

c.
