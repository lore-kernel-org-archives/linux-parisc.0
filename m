Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA10528
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Sep 2000 12:55:53 -0600
Message-Id: <200009291856.OAA09635@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] floating point exception error
To: dhd@linuxcare.com (David Huggins-Daines)
Date: Fri, 29 Sep 2000 14:56:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <87hf6znjc7.fsf@ottawa.linuxcare.com> from "David Huggins-Daines" at Sep 29, 2000 02:28:40 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> David Huggins-Daines <dhd@linuxcare.com> writes:
> 
> > So it looks like we are either not managing to set up %fr0 properly on
> > process startup or we are mangling it in the kernel or libc somewhere
> > along the way.  I'll investigate further today.
> 
> GAR!  So the problem is obvious.  Not only is GCC emitting the wrong
> comparison condition (<> vs. !=), but log(-8.0) is returning a
> signalling NaN on GNU/Linux, and a quiet one on HP/UX:

The difference between <> and != is an `*' in the unordered column
(<> has the *).  The * is supposed to indicate that the instruction
causes an invalid operation exception if its operands are unordered.
This occurs when at least one operand is a NaN.  However, if at least
one operand is a signaling NaN, a compare instruction always causes
an invalid operation exception.  Thus, the <> form should cause
an exception for any NaN.  Isn't this what you want?

The hpux man page doesn't specify the type of NaN returned by log().
There are several versions of log under: milli.a, pa1.1/libm, libm.
This may affect the return.  The milli.a log function is probably
faster but may not meet all the standards.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
