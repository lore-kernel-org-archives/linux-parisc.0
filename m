Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D290B4830
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 10:57:12 -0600 (MDT)
Message-Id: <200404231657.i3NGvBAP004762@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
To: James.Bottomley@steeleye.com (James Bottomley)
Date: Fri, 23 Apr 2004 12:57:10 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <1082728316.2017.18.camel@mulgrave> from "James Bottomley" at Apr
	23, 2004 09:51:56 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> It has a .level 2.0w (with the appropriate #ifdefs) at the top.

The .level 2.0w should come before any actual assembly code.  If the
includes define any assembly code this could be a problem.  The assembler
isn't very smart about changing levels.

> Now, if you look at an objdump of the .o, it shows:
> 
> 000000000000205c <syscall_do_resched>:
>     205c:	e8 40 00 00 	b,l 2064 <syscall_do_resched+0x8>,rp
> 			205c: R_PARISC_PCREL17F	schedule
>     2060:	37 dd 3f e1 	ldo -10(sp),ret1
>     2064:	e8 1f 1b ed 	b,l 1e60 <syscall_check_bh>,r0
>     2068:	08 00 02 40 	nop
> 
> I suppose this means gas thinks it has to emit short relocations.

Yes.  The code is using "bl".  It looks as if the assembler is
generating a 17-bit branch (sub-opcode 0) when it sees a "bl"
even when generating PA 2.0w code.  This would appear to be
wrong although I haven't checked what the HP assembler does.
Can you use "b,l" for PA 2.0 code?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
