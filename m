Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13BB74829
	for <parisc-linux@parisc-linux.org>; Wed, 11 Dec 2002 15:03:18 -0700 (MST)
Message-Id: <200212112203.gBBM3BRZ021171@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] ["CSA Test Drive" <TestDrive@compaq.com>] FW: Some issues
To: bdale@gag.com (Bdale Garbee)
Date: Wed, 11 Dec 2002 17:03:11 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <87wumggsyl.fsf@rover.gag.com> from "Bdale Garbee" at Dec 11, 2002 02:13:06 pm
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

> 2) The Debian HPPA box (spe170) seems to have alpha quality
> software.  Specifically, the FCNV,UDW,DBL instruction is
> apparently trapped, at least for certain input operand

I tried the program and I confirm the incorrect result under
hppa-linux.  The same code under hpux generates the correct
result.  The problem might be the wrong rounding mode is set
by glibc.  I believe that there was a recent fix for this.

I see no indication that the code traps on a PA8700.  I think
you would get a report in kern.log if the insn trapped due to
an unimplemented trap.  You might have the floating point
exception enables on causing traps on your machine.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
