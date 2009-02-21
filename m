From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: HPPA transition from linuxthreads to nptl.
Date: Sat, 21 Feb 2009 09:06:28 -0500
Message-ID: <119aab440902210606y4d7995cbu65f4ed1d7a660104@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

debian-hppa, linux-parisc,

I've been working on the linuxthreads to nptl transition over
the past week and I have had promising results. I managed
to debug several critical issues, and no blockers remain in
the implementation of compat symbols to fix the ABI transition.

This implementation is the first ports target to attempt to
override symbols in the nptl add-on, and as such the initial
implementation has a lot of code duplication which I hope
to reduce via future patches to libc proper. There were aslo
several stumbling blocks in being the first.

At present I have an initial implementation complete, along
with a testsuite to prove the implementation is correct.
Currently I am debugging the testsuite, because some of
the expected tests are not passing.

I will keep the list updated on my progress.

Cheers,
Carlos.
