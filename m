From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [hppa] binutils will not build shared libraries with external deps?
Date: Wed, 4 Jun 2003 14:23:39 -0400 (EDT)
Message-ID: <200306041823.h54INeaO023223__48913.3252449848$1416622497$gmane$org@hiauly1.hia.nrc.ca>
References: <20030602230949.GB17437@ozlabs.au.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: tausq@debian.org, bug-binutils@gnu.org,
	binutils@sources.redhat.com, parisc-linux@parisc-linux.org,
	debian-gcc@lists.debian.org
To: amodra@bigpond.net.au (Alan Modra)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030602230949.GB17437@ozlabs.au.ibm.com> from "Alan Modra" at Jun 3, 2003 09:09:49 am
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> On Mon, Jun 02, 2003 at 05:10:38PM -0400, John David Anglin wrote:
> > tmpdir/sh1p.o(.text+0x0): In function `shlib_mainvar':
> > /home/dave/binutils-2.14.90/src/ld/testsuite/ld-elfvsb/sh1.c:32: undefined refer
> > ence to `mainvar'
> > ...
> > FAIL: visibility (hidden)
> 
> Fixing this one probably requires porting some of the recent changes
> I made for x86 and ppc to hppa.  See SYMBOL_REFERENCES_LOCAL and
> SYMBOL_CALLS_LOCAL.

Nope.  This was caused by the previous bug and the change to using
gcc as the driver program to run the newly built linker.  Using `-B'
doesn't override the GCC configure option `--with-ld='.  The same
problem occurs with using gcc to run the newly build assembler
(`-B' doesn't override `--with-as=').  I think we need to revert
to the previous technique for running these tools in the ld
testsuite.

To work around this problem, I installed the newly built tools.
This fixed most of the ld FAILS but we are still left with the
following:

Running /home/dave/binutils-2.14.90/src/ld/testsuite/ld-elfvsb/elfvsb.exp ...
FAIL: visibility (hidden_undef_def)
FAIL: visibility (hidden_undef_def) (PIC main)
FAIL: visibility (hidden_weak)
FAIL: visibility (hidden_weak) (PIC main)
FAIL: visibility (protected_weak)
FAIL: visibility (protected_weak) (PIC main)
Running /home/dave/binutils-2.14.90/src/ld/testsuite/ld-elfweak/elfweak.exp ...
FAIL: ELF weak func first DSO
FAIL: ELF weak func last DSO
FAIL: ELF weak data first DSO
FAIL: ELF weak data last DSO
FAIL: ELF weak data first DSO common
FAIL: ELF weak data last DSO common

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
