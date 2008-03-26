From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: GCC 4.3 and PLABEL32 issues.
Date: Wed, 26 Mar 2008 14:14:16 -0400 (EDT)
Message-ID: <20080326181417.7D8254F00@hiauly1.hia.nrc.ca>
References: <20080326123741.GH16721@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, dave.anglin@nrc.ca,
	linux-parisc@vger.kernel.org, aurel32@debian.org
To: matthew@wil.cx (Matthew Wilcox)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080326123741.GH16721@parisc-linux.org> from "Matthew Wilcox" at Mar 26, 2008 06:37:41 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I thought Mozilla also used the low bits of pointers for special cases

Effectively, all code that has to deal with the underlying details
of the function pointer implementation is affected.  This includes
unwind code, and code to dynamically load libraries and plugins.

> ... and the kernel even has macros to return 'either a pointer or an
> error code' (PTR_ERR, ERR_PTR, IS_ERR).  Although the kernel probably
> wouldn't trip this, as I can't think of any function which returns a
> function-pointer-or-error (and besides the test isn't 'are the bottom
> bits set', but 'if you cast this pointer back to an unsigned long, is it
> greater than -4095'.

The PLABEL bit is defined in the runtime and only affects the runtime.
I think the only time the kernel would need to care about this is for
signal handlers.  In the runtime, page 0 is reserved to catch invalid
pointer accesses.  I'm sure the kernel has to be aware of this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
