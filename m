Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CADD64829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 Jan 2003 10:51:33 -0700 (MST)
Message-Id: <200301161751.h0GHpVQX002526@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc 3.0 error
To: jsoe0708@tiscali.be
Date: Thu, 16 Jan 2003 12:51:30 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
In-Reply-To: <3E1AAEFA0000190A@ocpmta6.freegates.net> from "jsoe0708@tiscali.be" at Jan 16, 2003 03:34:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> /usr/bin/ld: .libs/libTKernel.la-478.o(.text.1+0x37798): cannot reach 00000387__ZNSolsEPFRSoS_E+0,
> recompile with -ffunction-sections
> /usr/bin/ld: .libs/libTKernel.la-478.o(.text.1+0x37798): cannot handle R_PARISC_PCREL17F

> As it is a very long job (more then 12h) what would it be better:
> 1) simply following advise: "recompile with -ffunction-sections"

Compiling with -ffunction-sections will not fix this problem.  This is a
problem with the linker and the part of the error message about recompiling
with -ffunction-sections is bogus.  The clue is the offset value which
is within limits.  You have hit a compilation with many small functions
and the stub group section has overflowed.

Before you trash the build, try using the ld option --stub-group-size
to set the maximum size of a group of input sections that can be handled
by one stub section.  If the link is done with gcc, add something like
"-Wl,--stub-group-size,-225000" to LDFLAGS.  You want the stub group
size as large as possible but it can't be larger than 240000.  Negative
values cause stubs to be located before their branches.  Positive
stub group sizes allows to two groups of input sections, one before
and one after each stub section (ld --help).

GCC uses pc relative branches for calls if the distance to the beginning
of the translation unit is less than 240000.  It doesn't know how big
the translation unit is at the time this decision is made, so using
positive stub group values may cause problems.

There was a bug in GCC's distance calculation under linux.  This is
fixed in 3.2.2 and later.  3.2.2 is not released yet.  3.3 is coming
soon (Feb. 15?).

> 2) upgrade directly to gcc-3.2

Won't fix the above.

If you using a PA 2.0 machine, you could use the -mpa-risc-2-0 option.
This increases the branch range to 22 bits and the maximum size of the
stub group section.

I would recommend using 3.3 for C++ builds but this is for other
reasons.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
