From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Missing POSIX_MADV_* defines in bits/mman.h
Date: Wed, 24 May 2006 11:24:49 -0400
Message-ID: <119aab440605240824i84b0866x471036953efc8a01@mail.gmail.com>
References: <20060524013930.c0b80171.gmsoft@tuxicoman.be>
	 <200605240824.20762.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 "Guy Martin" <gmsoft@tuxicoman.be>
To: "Helge Deller" <deller@gmx.de>
Return-Path: <patofiero@gmail.com>
In-Reply-To: <200605240824.20762.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On 5/24/06, Helge Deller <deller@gmx.de> wrote:
> Thanks for noticing!
>
> But your patch misses at least the "new" madvise() parameters as well:
> /* common/generic parameters */
> #define MADV_REMOVE     9               /* remove these pages & resources=
 */
> #define MADV_DONTFORK   10              /* don't inherit across fork */
> #define MADV_DOFORK     11              /* do inherit across fork */
>
> See: http://cvs.parisc-linux.org/linux-2.6/include/asm-parisc/mman.h?view=
=3Dmarkup

Helge,

Be careful that these are the non-POSIX definitions. They also need to
be added to glibc. I'll do that right now.

Cheersr,
Carlos.
