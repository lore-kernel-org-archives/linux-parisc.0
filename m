Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA04466
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 13:45:35 -0600
Message-Id: <200010111944.PAA27137@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] __hp9000s700 predefined
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 11 Oct 2000 15:44:13 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200010111654.JAA06726@milano.cup.hp.com> from "Grant Grundler" at Oct 11, 2000 09:54:56 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> "John David Anglin" wrote:
> ...
> > These are needed for user apps as well as the kernel.  They allow cpp
> > to process files based on the machine features of the version of gcc used
> > for the compilation (e.g.: PA 1.0, 1.1, or 2.0; 32 or 64 bit; s700 or s800).
> 
> o PA 1.1 vs PA 2.0 can be handled with -D_PA_RISC1_1.
>   Since neither HPUX 10.X, HPUX 11.X, nor parisc-linux supports PA1.0,
>   I don't know or care that is going to work (apologies to the
>   folks who made spectrum happen).

You probably know better than I but I think PA1.0 is the "portable" default
for most libraries under 10.X.  I believe that gcc also defines _PA_RISC2_0
for PA2.0.  This is not used under hpux 10.X.  However, it is used under 11
in setjmp.h and varargs.h.  I also see _PA_RISC1_0 there, so gcc probably
should be defining it as well (at least for hpux).

Although parisc-linux may not run on PA1.0 hardware, you never know what some
software maniac will do in the future.  The gcc infrastructure to generate
PA1.0 code is there and works.  Thus, I don't buy the argument that this
capability shouldn't be supported under linux simply because you don't
want the symbol defines to support it in the namespace.  Kernel support
and building the appropriate libs are more of an issue.  Take a look
at the IDs in unistd.h and magic.h.  There are IDs for 1.0, 1.1, 1.2 and
2.0.

> o s700 vs s800 is an artifact of HP's workstation vs server divisions.
>   ie an artifact of how HP was organized. With HPUX 11, HP no longer ships
>   different binaries for workstations vs servers (to many customers
>   relief since we now only have one patch stream per release).
> 
> o As I noted before, linux enable/disables specific functionality and
>   HW support with either CONFIG_XXX or runtime checks.
> 
> John, is there something specific you are concerned about which
> can't be handled by the above predefined symbols?

I was just being cautious about __hp9000s[7-8]00.  I looked at some of
the uses in the hpux 10.X headers, and for usage in gcc and binutils.  I
don't see any obvious reason why these two symbols need to be defined
for linux.

I believe that the compiler only should predefine symbols that are necessary
for the control of code generation.  Neither CONFIG_XXX or runtime checks
will help you for this since gcc only has a limited capability to change
its code generation at runtime.  There appears to be some model dependence
in the floating point implementations from one pa machine to another.  If
this can't all be hidden in the kernel, some further specification of the
hardware might be needed for floating point.  For example, __i686__ is
defined on the Pentium Pro and is used in bits/mathinline.h.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
