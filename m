Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA12642
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 16:17:48 -0600
Message-Id: <200010112215.SAA01540@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] __hp9000s700 predefined
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 11 Oct 2000 18:15:03 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200010112021.NAA07074@milano.cup.hp.com> from "Grant Grundler" at Oct 11, 2000 01:21:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> "John David Anglin" wrote:
> > You probably know better than I but I think PA1.0 is the "portable" default
> > for most libraries under 10.X.
> 
> It's definitely not under 10.20. PA1.1 is the minimum.
> I think PA1.0/CIO support was completely dropped after
> 10.01 or 10.10 releases.

Don't think so under 10.20.  We're talking about code generation here,
not device support.  The HP cc compiler uses the +DAarchitecture option
to control generation of code for a particular version of the PA-RISC
architecture.  It also specifies which version of the math library to
use when -lm is specified.  The directory /usr/lib/pa1.1 under 10.20
still has different versions for libcl.[a,sl] and libm.a.  As I noted
before, there is a complete list of models and architectures in
/opt/langtools/lib/sched.models.

I tried different code generation options with the HP cc compiler
under 10.20 and 11.  The HP cc compiler sets LPATH (at least if it is not
defined) to /usr/lib/pa1.1:/usr/lib:/opt/langtools/lib: for PA1.1 and PA2.0
models.  The default for PA1.0 models is /usr/lib:/usr/ccs/lib, according
to the ld man page.  Here are the HP cc predefines for 808, 735 and 700
models under 10.20:

-D__hp9000s700 -D__hp9000s800 -D__hppa -D__hpux -D__unix -e -D_PA_RISC1_0 -D__CLASSIC_C__

-D__hp9000s700 -D__hp9000s800 -D__hppa -D__hpux -D__unix -e -D_PA_RISC1_1 -D__CLASSIC_C__

-D__hp9000s700 -D__hp9000s800 -D__hppa -D__hpux -D__unix -e -D_PA_RISC1_1 -D__CLASSIC_C__

The _PA_RISC1_1 define for the 700 changes to a _PA_RISC2_0 define under 11.
Under 11, only a remnant of the pa1.1 library remains for old link scripts.
The same libraries appear to be used for PA1.0 to PA2.0.  This leads me
to conclude that the libraries must all be PA1.0 compatible.  HP cc uses the
.LEVEL directive to tell the assembler which object format to generate.

> > There appears to be some model dependence
> > in the floating point implementations from one pa machine to another.  If
> > this can't all be hidden in the kernel, some further specification of the
> > hardware might be needed for floating point.  For example, __i686__ is
> > defined on the Pentium Pro and is used in bits/mathinline.h.
> 
> HPUX hides it all in the kernel somehow...and __hp9000s[7-8]00 won't
> help with this problem anyway.

The +FP cc option can be used to control floating operation.  10.20 also has
fpgetround and friends for runtime control.  11.0 has fenv.h, and fegetround
and friends.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
