Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43A00482A
	for <parisc-linux@parisc-linux.org>; Sat, 19 May 2001 22:41:50 -0600 (MDT)
Sender: drepper@cygnus.com
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] elf/resolvfail
References: <20010520052242.L23718@parcelfarce.linux.theplanet.co.uk>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 19 May 2001 21:40:10 -0700
In-Reply-To: Matthew Wilcox's message of "Sun, 20 May 2001 05:22:42 +0100"
Message-ID: <m3wv7ciqfp.fsf@otr.mynet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox <matthew@wil.cx> writes:

> but i would have throught that RTLD_LAZY would mean that it didn't have to
> resolve foo immediately, only when it was used.  Can someone explain what's
> supposed to happen here?

Get a box with a working glibc and run

  LD_DEBUG=all /build/dir/elf/ld.so --library-path /build/dir:/build/dir/dlfcn /build/dir/elf/resolvfail


on both.  The output LD_DEBUG provides should help you.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
