Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 169E54829
	for <parisc-linux@parisc-linux.org>; Fri, 10 Jan 2003 00:50:15 -0700 (MST)
Date: Thu, 9 Jan 2003 23:54:41 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20030110075441.GD31470@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021211224404.GC15219@systemhalted> <200212112305.gBBN5Bdj021432@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212112305.gBBN5Bdj021432@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: floating point exception error
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

In reference to a message from John David Anglin, dated Dec 11:
> > The code _seems_ to trap on a PA8600. Though I won't say anything until
> > I enable debugging in the trap handler and rerun the test.
> 
> The code doesn't seem to trap on a A500 which I believe is a PA8500.
> I think we need to look at bits 0..1 of the coprocessor configuration
> register to determine instruction validity.  See table 8-6 on page 8-11.
> I can look at what the HP compiler does.  Up to now, we have assumed
> that all PA8000 machines have the same instruction set.

i looked at this some more.. it's not that the fcnv instruction is not
implemented by the processor, but we seem to be falling into one of the
overflow/underflow cases... if you adjust the value being converted (say
remove one of the zeros), the program works without trapping.

page 10-9 of the pa20 arch manual gives the conditions under which a
floating point conversion op will cause an unimplemented exception.
however my reading of the text is that an exception is only generated if
the overflow/underflow exceptions are enabled. i've tried explicitly 
calling feclearexcept(FE_ALL_EXCEPT) before doing the fp op but it still 
causes the unimplemented exception trap.
The kernel debugs seem to indicate the O/U exceptions are not set as 
well....

puzzled,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
