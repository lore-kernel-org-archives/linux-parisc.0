Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from patty.levels.unisa.edu.au (patty.levels.unisa.edu.au [130.220.36.156])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5053482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 18:49:18 -0600 (MDT)
Date: Sat, 5 May 2001 10:19:05 +0930 (CST)
From: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
In-Reply-To: <20010505010032.N32445@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.30.0105051006540.7087-100000@mullet.itr.unisa.edu.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 5 May 2001, Matthew Wilcox wrote:

> OK, got it.  the first time we call _setjmp, everything is fine.
> But when we return to it through longjmp, the `rp' which got stored has
> changed, and now its the rp for the last function we called.

Oh horrible.  Yes, the stack frame that sysdeps/generic/bsd-_setjmp.c is
using to load rp is no longer valid.  Oh well, the comment in
generic/bsd-_setjmp.c should have warned us, which leads to another
question.  Why was this added to gcc/config/pa/pa-linux.h?

/* Sibcalls, stubs, and elf sections don't play well.  */
#undef FUNCTION_OK_FOR_SIBCALL
#define FUNCTION_OK_FOR_SIBCALL(x) 0

Seems a bit drastic to me.  The correspnding define in pa.h should be OK
for us.

-- 
Alan Modra
