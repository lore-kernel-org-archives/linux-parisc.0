Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89C5C482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 07:48:24 -0600 (MDT)
Message-Id: <m14x7qP-001VltC@bame.riverrock.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3 make check status 
In-Reply-To: Message from Matthew Wilcox <matthew@wil.cx>
   of "Sat, 05 May 2001 03:34:57 BST." <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk>
References: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 08 May 2001 07:48:05 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> 
> I'm not sure people actually ran make check against glibc 2.2.1, so I don't
> know how this compares.  Maybe 2.2.3 just has more tests than 2.2.1 did...

make check for 2.2.1 with the large file changes should only have failed
some of the fp tests.

>  * all the tests in math/ fail.  pb knows what these problems are.

If all the tests fail that's a problem. In 2.2.1 the fp  tests passed except
the ones where glibc computed something like trig functions, and those tests
were off in their least-significant bits.
