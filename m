Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74FEE482E
	for <parisc-linux@parisc-linux.org>; Mon, 28 Jul 2003 14:37:56 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19hEkj-0005kR-Q4; Mon, 28 Jul 2003 21:37:53 +0100
Date: Mon, 28 Jul 2003 21:37:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <tausq@debian.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030728203753.GF3840@parcelfarce.linux.theplanet.co.uk>
References: <20030725063739.GA13017@systemhalted> <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk> <20030728203041.GH22976@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030728203041.GH22976@tausq.org>
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

On Mon, Jul 28, 2003 at 01:30:41PM -0700, Randolph Chung wrote:
> Why not add a flag to syscall() which indicates whether this is a "fast"
> syscall or a "slow" syscall, and based on this, decide whether to do all
> the register spilling, etc when entering the kernel?  Then we can
> implement the atomic ops as additional "syscalls"....
> 
> I would think that there is at least some amount of logic that needs to
> be there everytime you enter/exit the kernel, irregardless of whether
> you are doing a "fast syscall" (i.e. no need to save the processor
> state, etc) or a regular one... i would hope we don't need to have two
> copies of that logic.
> 
> Carlos had some concerns that this means fast syscalls (or regular ones
> perhaps) will always incur a mispredicted branch and/or extra stack
> manipulations that may not be needed..... but i'm not yet convinced that
> there is enough overhead to make this a problem. what do others think?

I don't think enough syscalls are "fast" to make this worth doing.
Most of the things people are talking about for lightweight syscalls are
things that could/should be done in userspace ... except that you need to
be privileged to use them.  So the optimum way to solve them is to have a
special calling convention and todo the absolute minimum amount of work.
Setting cr26 is a great example because we would do it in userspace if
the architecture let us.

Does anyone have a better definition for lightweight syscall?  How about
"Cannot sleep, called frequently, must be fast"?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
