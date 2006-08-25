From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Bug#342545: qt-x11-free FTBFS
Date: Thu, 24 Aug 2006 20:56:40 -0400 (EDT)
Message-ID: <200608250056.k7P0ueLs024447__17693.4578609236$1416624156$gmane$org@hiauly1.hia.nrc.ca>
References: <20060824002245.GL7375@mauritius.dodds.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@debian.org,
 342545@bugs.debian.org,
 chrsmrtn@debian.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: vorlon@debian.org (Steve Langasek)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20060824002245.GL7375@mauritius.dodds.net> from "Steve Langasek" at Aug 23, 2006 05:22:45 pm
Resent-Message-ID: <ou6Pk.A.W3G.7Fl7EB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> That would be wonderful if you, or another hppa porter, could track down
> where the bug lies.  libgcc2 is almost certainly the wrong package, since
> nothing should be *using* libgcc2 in a fresh build of qt-x11-free; it may be
> a bug in libgcc4 instead, but I think that's yet to be determined.  In the
> meantime, I think it's best to reassign this back to qt-x11-free.

This might be a nan bug.  There is one GCC nan fix that's only
installed on the trunk:

2006-05-24  John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>

	PR target/27627
	* pa/pa-modes.def: Use mips_single_format, mips_double_format and
	mips_quad_format formats instead of ieee_single_format,
	ieee_double_format and ieee_quad_format formats, respectively.

However, I think the real bug is here:

> > 0x40cb2150 in negNan () at tools/qlocale.cpp:131
> > 131                 *((const double *) le_neg_nan_bytes));

PA-RISC requires strict alignment and it's highly likely that
the pointer le_neg_nan_bytes isn't aligned to an eight byte
boundary.  You could see the faulting insn by disassembling
around 0x40cb2150 to be sure.  The nan problem fixed by the
above change would cause a SIGFPE instead of a SIGBUS.

I'm fairly certain we have a bug in handling unaligned fixups
for doubles in the kernel.  This caused a problem for libffi.
This depends on whether the kernel is 32/64 bits.

As Kyle pointed out, unaligned fixups by the kernel are expensive
and they should be avoided.  tools/qlocale.cpp appears to be a
qt-x11-free routine, so I agree that the reassignment was correct.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
