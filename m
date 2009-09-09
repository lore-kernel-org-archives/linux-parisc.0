From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Wed, 9 Sep 2009 11:16:49 -0400 (EDT)
Message-ID: <20090909151650.551584FC6@hiauly1.hia.nrc.ca>
References: <119aab440909090739s1f7af068s65bb4d389b626a4d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909090739s1f7af068s65bb4d389b626a4d@mail.gmail.com> from "Carlos O'Donell" at Sep 9, 2009 10:39:30 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The strace problem is a compiler flaw.
> 
> This is the problem:
> * Strace examines the applications syscall.
> * Strace extracts, via PTRACE, application addresses, addresses that
> don't exist in the strace address space (and should not exist).
> * Strace compares extracted address to a constant SIG_ERR.
> * Compiler generates a call to __c_f_f_c, which dereference the
> extracted address and strace faults.
> 
> Strace and the application have completely different address spaces,
> and __c_f_f_c can't assume that an address is in the current address
> space.

Unfortunately, this is necessary to canonicalize function pointers.

> The solution is to detect that a comparison between two pointers is a
> comparison between pointer and small constant, and avoid calling
> __c_f_f_c for both.

__c_f_f_c would have to be passed both pointers to detect comparisons
with small constants, or the GCC middle-end would have to detect
comparisons with constants and avoid canonicalization in that case.

> The workaround is to cast both long. I tested this and it works. I'll
> submit this to debian as the fix.

This is simplest fix.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
