Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD6FE482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 12:10:53 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Andreas Thienemann <andreas@thienemann.net>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problems with glibc
References: <Pine.LNX.4.10.10104201906260.21140-100000@gate.ixs.com>
From: Jes Sorensen <jes@linuxcare.com>
Date: 20 Apr 2001 20:10:50 +0200
In-Reply-To: Andreas Thienemann's message of "Fri, 20 Apr 2001 19:10:43 +0200 (CEST)"
Message-ID: <d3itjzfnmd.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Andreas" == Andreas Thienemann <andreas@thienemann.net> writes:

Andreas> Has anyone ever experienced a similar problem? This segfault
Andreas> is reproducable and it's the first time that happened. gcc
Andreas> did compile correct, the same with the kernel itself.
Andreas> Therefore I'd guess that glibc is at fault here.  This
Andreas> happened while building the glibc on the hppa box (with the
Andreas> baseplus-20010404 nfsroot).  Building the cross-compiler
Andreas> toolchain which does include building glibc was successful
Andreas> though.

You don't see it when cross compiling because this is only run when
building natively. The sunrpc stuff is the first place where the newly
generated dynamic linker is exercised, your cross compiled binaries
are unlike to work either. The can be either a glibc (most likely
ld.so) or due to a change in syscall or compiler ABI behavior.

Jes
