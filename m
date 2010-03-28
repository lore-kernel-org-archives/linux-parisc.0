From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 15:31:46 -0400 (EDT)
Message-ID: <20100328193147.015054E77@hiauly1.hia.nrc.ca>
References: <20100328190701.20C0C516B@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org, deller@gmx.de,
	kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328190701.20C0C516B@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 28, 2010 03:07:00 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The bad value is stored here:
> 
> 0x0003f578 <fork+700>:	ldil L%7b800,r26
> 0x0003f57c <fork+704>:	b,l 0x35d74 <_IO_list_unlock>,rp
> 0x0003f580 <fork+708>:	stw r19,-414(r6)
> (gdb) p/x $r19
> $2 = 0x10101364

%r19 is clobbered by the clone syscall:

(gdb) disass 0x0003f44c 0x0003f458
Dump of assembler code from 0x3f44c to 0x3f458:
0x0003f44c <fork+400>:	be,l 100(sr2,r0),sr0,r31
0x0003f450 <fork+404>:	ldi 78,r20
0x0003f454 <fork+408>:	nop

Breakpoint 5, 0x0003f44c in fork ()
(gdb) p/x $r19
$6 = 0x0

Breakpoint 4, 0x0003f454 in fork ()
(gdb) p/x $r19
$7 = 0x10101364

Same value for %r19 is returned for both parent and child.

This is using application linked with -static (i.e., libc.a).  Probably,
shared lib is different.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
