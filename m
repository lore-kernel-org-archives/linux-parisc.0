Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4590F482E
	for <parisc-linux@parisc-linux.org>; Mon, 28 Jul 2003 14:30:38 -0600 (MDT)
Date: Mon, 28 Jul 2003 13:30:41 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030728203041.GH22976@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030725063739.GA13017@systemhalted> <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk>
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

> I'd say we should keep doing stuff on our existing gateway page until we
> exhaust it.  We've got plenty of space -- 248 instruction slots left before
> 0xE0, and a lot of space left after the syscall handler.
> 
> On a related subject, fast gettimeofday is always a popular idea.  I'm not

Why not add a flag to syscall() which indicates whether this is a "fast"
syscall or a "slow" syscall, and based on this, decide whether to do all
the register spilling, etc when entering the kernel?  Then we can
implement the atomic ops as additional "syscalls"....

I would think that there is at least some amount of logic that needs to
be there everytime you enter/exit the kernel, irregardless of whether
you are doing a "fast syscall" (i.e. no need to save the processor
state, etc) or a regular one... i would hope we don't need to have two
copies of that logic.

Carlos had some concerns that this means fast syscalls (or regular ones
perhaps) will always incur a mispredicted branch and/or extra stack
manipulations that may not be needed..... but i'm not yet convinced that
there is enough overhead to make this a problem. what do others think?

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
