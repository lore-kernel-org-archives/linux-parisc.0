Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DB3A4829
	for <parisc-linux@parisc-linux.org>; Fri, 10 Jan 2003 11:08:30 -0700 (MST)
Reply-To: <jim.hull@hp.com>
From: "Jim Hull" <jim.hull@hp.com>
To: "'Randolph Chung'" <randolph@tausq.org>,
	"'John David Anglin'" <dave@hiauly1.hia.nrc.ca>
Cc: <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Re: floating point exception error
Date: Fri, 10 Jan 2003 10:08:29 -0800
Message-ID: <003101c2b8d3$477c8bb0$6763f40f@cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <20030110075441.GD31470@tausq.org>
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

Randolph wrote:

> i looked at this some more.. it's not that the fcnv instruction is not
> implemented by the processor, but we seem to be falling into 
> one of the overflow/underflow cases... if you adjust the value being 
> converted (say remove one of the zeros), the program works without
trapping.
> 
> page 10-9 of the pa20 arch manual gives the conditions under which a
> floating point conversion op will cause an unimplemented exception.
> however my reading of the text is that an exception is only generated
if
> the overflow/underflow exceptions are enabled. i've tried explicitly 
> calling feclearexcept(FE_ALL_EXCEPT) before doing the fp op but it
still 
> causes the unimplemented exception trap.
> The kernel debugs seem to indicate the O/U exceptions are not set as 
> well....

Actually, the important architectural statement is this one, on p. 10-8:

  If an implementation chooses not to execute an instruction, the
  instruction signals an unimplemented exception.  An unimplemented
  exception always causes a delayed trap on a later floating-point
  instruction.  It does not change the Status Register Flag bits and
  cannot be disabled.

What p. 10-9 is describing are the conditions under which the processor
is *required* to "go unimplemented" (i.e., to take an unimplemented
exception).  But what p. 10-8 says is that the processor is *allowed* to
"go unimplemented" on any FP instruction at any time for any reason.

A totally unrealistic, but still allowed, implementation would be for
all multiply-add instructions to "go unimplemented" on Tuesdays, and all
multiply-subtract instructions to do so on Thursdays.  A more realistic
example would be for a processor to "go unimplemented" for certain hard
corner-case combinations of operands and/or rounding modes.

In the particular case of the fcnv-unsigned-to-float instruction being
discussed in this thread, all PA-8xxx processors "go unimplemented" if
the MSB is 1 in the source operand.  This explains why the trap
disappears when you "remove one of the zeros" from the operand.

What it does not explain is why the original message reported a
difference between a PA-8600 and a PA-8700.  According to every internal
HP processor document and PA-RISC FP designer I've been able to track
down, this area of the design hasn't been changed since the original
PA-8000, so there shouldn't be any differences in behavior.

Can someone repeat the experiment on PA-8600 and a PA-8700 machine that
are configured identically (kernel, glibc, test program, etc.)?

 -- Jim
    HP PA-RISC/IPF Processor Architect
