From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc-3_3-branch] bootstrap failure on hppa-linux
Date: Fri, 27 Dec 2002 17:14:26 -0500 (EST)
Message-ID: <200212272214.gBRMEQeF002615__5432.44307996265$1416622056$gmane$org@hiauly1.hia.nrc.ca>
References: <15884.48522.342368.76461@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gcc@gcc.gnu.org, parisc-linux@lists.parisc-linux.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <15884.48522.342368.76461@gargle.gargle.HOWL> from "Matthias Klose" at Dec 27, 2002 09:52:26 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> $ gcc-3.2    -g -DIN_GCC   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long -fno-common  -DHAVE_CONFIG_H -o cc1 c-parse.o c-lang.o c-pretty-print.o attribs.o c-errors.o c-lex.o c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-common.o c-opts.o c-format.o c-semantics.o c-objc-common.o c-dump.o libcpp.a  main.o libbackend.a   ../libiberty/libiberty.a
> /usr/bin/ld: libbackend.a(expr.o)(.text+0x3f744): cannot reach 000002c9_$$dyncall+0, recompile with -ffunction-sections
> /usr/bin/ld: libbackend.a(expr.o)(.text+0x3f744): cannot handle R_PARISC_PCREL17F for $$dyncall

This bug is fixed in 3.3.  The principal problem is that gcc is not keeping
track of the total number of code bytes (total_code_bytes) in a translation
unit under hppa-linux.  With GAS under hpux, this isn't necessary.

Unfortunately, the 3.2 branch is only open for regression fixes.  As far
as I know, this never worked in any previous release (debian 3.0.4 has
the same problem).  Thus, the problem won't be fixed in the 3.2 branch.

I suspect that expr.o must be getting bigger.

You can also work around this by adding -O2 to your stage1 CFLAGS.

The problems with branches that can't reach their long branch stub still
aren't fully resolved.  It's possible to exceed the maximum number of
stubs per 240000 bytes of code.  Possibly, we need to make the maximum
branch distance for the R_PARISC_PCREL17F relocation a settable option.
Currently, it is hardcoded to 240000 bytes in gcc, gas and ld.  The hpux
compiler avoids the problem by not using the "bl" instruction for external
calls.  However, GNU ld doesn't currently support the relocations needed
for the HP sequences.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
