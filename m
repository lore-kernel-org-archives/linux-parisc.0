Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA05813
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Feb 2000 12:45:25 -0700
Received: (from neufeld@localhost)
	by vorlon.dynacan.org (8.9.3/8.9.3) id NAA12763
	for parisc-linux@thepuffingroup.com; Fri, 11 Feb 2000 13:38:30 -0500
Date: Fri, 11 Feb 2000 13:38:30 -0500
From: Christopher Neufeld <Christopher.Neufeld@dynacan.org>
Message-Id: <200002111838.NAA12763@vorlon.dynacan.org>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Some PA-RISC 2.0 Gotchas
List-ID: <linux-parisc.vger.kernel.org>

On Feb 11,  9:52am, Stan Sieler wrote:
> 
>> - There are some places in the kernel where the implicit assumption that
>> longs == ints will break!
>
>My pet peeve...
>
>Code should almost *never* use "short", "int", or "long" ... 
>but instead, "int32" and "int64" (or whatever) should be used.  
>
   The types are "int32_t", "int64_t", etc. These are codified in the C99
standard which was finally ratified late last year. The previous
standard, C89, did not define these types, and so portable code could not
use them, short of a person rewriting the typedefs in the program's
header files for each new architecture/compiler.

   There are many circumstances where one wants to use those particular
K&R types. "int", for example, is intended to be implemented in the
machine's natural word size. While not required by the standard, the
recommendation allows you to expect that code using ints will probably be
at least as quick as code using other integer types (neglecting "real
world" impacts like memory bandwidth and cache size). If you look in a
C99-compliant <stdint.h> header file you'll see that there are types like
"int_fast16_t" which are mapped not to an integer of size 16, but to an
integer of the natural word size of the machine (on x86 that means that
int_fast16_t and int_fast32_t are both typedef-ed to int, and on a 64 bit
architecture int_fast16_t is typedef-ed to a 64 bit integer).

   In any case, I agree that the assumption that longs and ints can be
mutually cast without loss of information is a nasty one which breaks
often. Another bad one is the idea that an integer can always hold a
pointer. I've heard that these are common blights in GNU code, though
I've never tried to verify that.

   Oh, in case people are interested, and don't know, the document which
is going to become the ISO C99 standard, n869, is available at:

http://anubis.dkuug.dk/JTC1/SC22/WG14/www/docs/n869/

good reading, a bit low on plot development.


-- 
 Christopher Neufeld		   Christopher.Neufeld@dynacan.org
 Home page:  http://caliban.physics.utoronto.ca/neufeld/
 "Don't edit reality for the sake of simplicity"
