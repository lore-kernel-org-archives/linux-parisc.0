From: Luk Claes <luk@debian.org>
Subject: Re: HPPA transition from linuxthreads to nptl.
Date: Sat, 21 Feb 2009 16:14:04 +0100
Message-ID: <49A01A3C.4040609@debian.org>
References: <119aab440902210606y4d7995cbu65f4ed1d7a660104@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Debian HPPA Port List <debian-hppa@lists.debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440902210606y4d7995cbu65f4ed1d7a660104@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos O'Donell wrote:
> debian-hppa, linux-parisc,
> 
> I've been working on the linuxthreads to nptl transition over
> the past week and I have had promising results. I managed
> to debug several critical issues, and no blockers remain in
> the implementation of compat symbols to fix the ABI transition.
> 
> This implementation is the first ports target to attempt to
> override symbols in the nptl add-on, and as such the initial
> implementation has a lot of code duplication which I hope
> to reduce via future patches to libc proper. There were aslo
> several stumbling blocks in being the first.
> 
> At present I have an initial implementation complete, along
> with a testsuite to prove the implementation is correct.
> Currently I am debugging the testsuite, because some of
> the expected tests are not passing.
> 
> I will keep the list updated on my progress.

Thanks for the update. Please do share the code soon so other people can
help test and improve it.

Cheers

Luk
