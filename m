Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (unknown [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id BB7994829
	for <parisc-linux@parisc-linux.org>; Wed, 11 Dec 2002 15:44:16 -0700 (MST)
Date: Wed, 11 Dec 2002 17:44:04 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Bdale Garbee <bdale@gag.com>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ["CSA Test Drive" <TestDrive@compaq.com>] FW: Some issues
Message-ID: <20021211224404.GC15219@systemhalted>
References: <87wumggsyl.fsf@rover.gag.com> <200212112203.gBBM3BRZ021171@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212112203.gBBM3BRZ021171@hiauly1.hia.nrc.ca>
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

> > 2) The Debian HPPA box (spe170) seems to have alpha quality
> > software.  Specifically, the FCNV,UDW,DBL instruction is
> > apparently trapped, at least for certain input operand
> 
> I tried the program and I confirm the incorrect result under
> hppa-linux.  The same code under hpux generates the correct
> result.  The problem might be the wrong rounding mode is set
> by glibc.  I believe that there was a recent fix for this.

I fixed fesetround() so it wouldn't make a mess of the RM mask. Though
it does not appear that rounding is related to the problem.

> I see no indication that the code traps on a PA8700.  I think
> you would get a report in kern.log if the insn trapped due to
> an unimplemented trap.  You might have the floating point
> exception enables on causing traps on your machine.

The code _seems_ to trap on a PA8600. Though I won't say anything until
I enable debugging in the trap handler and rerun the test.

c.
