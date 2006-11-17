From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] 64-bit long double support.
Date: Thu, 16 Nov 2006 20:31:58 -0500
Message-ID: <119aab440611161731p47779d1hdc7e7dbd336eb23c__13115.5189279982$1416624215$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 "John David Anglin" <dave.anglin@nrc.ca>,
 libc-alpha@sources.redhat.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The HP-PARISC processor has no 128-bit hardware floating point
support. In HPUX the 128-bit long double support is all in software.
After years of trying we have come to the conclusion that the HPUX
128-bit long double support will never be released into the public.

It was the conclusion of the community that we would use 64-bit long
double, a type which would be identical to double.

The goal is to get `long double' fixed for hppa-linux. You might ask
what is broken?

1. GCC at one point assumed `long double' was 96-bits (fixed, 64-bits)
2. GLIBC at one point asumed `long double' was 128-bits (fixed, 64-bits)
3. GLIBC headers do not export `xxxxl' (long double) variants of the
math functions.
     = The fix is to undef __NO_LONG_DOUBLE_MATH in your own version
of mathdefs.h
4. GLIBC doesn't test `long double' support.
     = Hack up math/Makefile to have a finer control over building and
testing long doubles.

I have patches for 3, and 4. The patch for 3 will "turn on" 64-bit
`long double' math functions in our headers. The patch for 4 will
reveal that "lrintl" and "lroundl" are probably broken in some
rounding cases.

There was mention of using gcc to support "double double" and use 2x
64-bit doubles. Unfortunately I think this road would be paved with
lots of debugging, a new ABI, and more headaches for little reward.
Remember our goal "fix long double support."

Is there any opposition to checking in the fix for 3?
Speak now or forever hold your peace.

... or until Kyle writes the 128-bit long double support library,
makes it fast, and we transition our ABI (there are provisions for
this already).

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
