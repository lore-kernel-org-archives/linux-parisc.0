Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA19774
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 15:37:55 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 25 Aug 2000 21:37:52 -0000
To: parisc-linux@thepuffingroup.com
Cc: law@cygnus.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 25 Aug 2000 17:36:53 -0400
Message-ID: <87lmxlowei.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Broken floating-point varargs
List-ID: <linux-parisc.vger.kernel.org>

Hi,

The variadic function code in GCC for HPPA is slightly broken for
floating point arguments.  This only affects the first and second
arguments, as all other ones will be passed on the stack.

The problem is that if a function uses va_start(), GCC emits a
prologue which stores the first four argument words to their
respective stack slots (sp-36 .. sp-48).  Unfortunately it does this
by simply copying general purpose registers 26 to 23 (arg0-arg3) to
these slots, even if some of the first four argument words are (parts
of) floating point values and thus reside in floating point registers.

See hppa_builtin_saveregs() in gcc/config/pa/pa.c for the code in
question.

It looks like we could fix this by checking the parameters and saving
from floating point argument registers instead, I'm just not sure how :-)

I'm wondering whether or not this manifests itself on HP/UX - would it
have something to do with (gack) argument relocation?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
