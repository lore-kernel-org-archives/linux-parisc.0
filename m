Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA06368
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 14:16:13 -0600
Message-Id: <200010112021.NAA07074@milano.cup.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] __hp9000s700 predefined 
In-reply-to: Your message of "Wed, 11 Oct 2000 15:44:13 PDT."
             <200010111944.PAA27137@hiauly1.hia.nrc.ca>
Date: Wed, 11 Oct 2000 13:21:33 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Summary ----------
Ok. It looks like we are in agreement.
I'm going to remove __hp9000s[78]00 from pa-linux*.h files.

grant

Full Reply -------------

"John David Anglin" wrote:
> You probably know better than I but I think PA1.0 is the "portable" default
> for most libraries under 10.X.

It's definitely not under 10.20. PA1.1 is the minimum.
I think PA1.0/CIO support was completely dropped after
10.01 or 10.10 releases.

> I believe that gcc also defines _PA_RISC2_0
> for PA2.0.  This is not used under hpux 10.X.  However, it is used under 11
> in setjmp.h and varargs.h.  I also see _PA_RISC1_0 there, so gcc probably
> should be defining it as well (at least for hpux).

Agreed. 10.X doesn't use _PA_RISC2_0 since it has to run on PA1.1 HW
and only supports narrow mode on PA2.0 platforms. Any differences
in the processor architectures are handled with runtime checks.
(like boot time patching of inline spinlocks).

_PA_RISC1_0 is cruft in HPUX 11. It's definitely not supported
and no maniac is going that change that.

> 
> Although parisc-linux may not run on PA1.0 hardware, you never know what some
> software maniac will do in the future.

I don't think the proposed change will prevent anyone from *attempting*
to port parisc-linux to PA1.0 architecture. <shudder>.

But this digresses from the original question about __hp9000s[78]00.

...
> > John, is there something specific you are concerned about which
> > can't be handled by the above predefined symbols?
> 
> I was just being cautious about __hp9000s[7-8]00.  I looked at some of
> the uses in the hpux 10.X headers, and for usage in gcc and binutils.  I
> don't see any obvious reason why these two symbols need to be defined
> for linux.

Ok. I was just going on my (limited) knowledge of the platforms
and how linux configuration works.

> I believe that the compiler only should predefine symbols that are necessary
> for the control of code generation.

Agreed. That's why we wanted it removed.

...
> There appears to be some model dependence
> in the floating point implementations from one pa machine to another.  If
> this can't all be hidden in the kernel, some further specification of the
> hardware might be needed for floating point.  For example, __i686__ is
> defined on the Pentium Pro and is used in bits/mathinline.h.

HPUX hides it all in the kernel somehow...and __hp9000s[7-8]00 won't
help with this problem anyway.

thanks for your insight,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
