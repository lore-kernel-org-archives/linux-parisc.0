Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5C6D4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 06:45:00 -0600 (MDT)
Date: Thu, 29 Aug 2002 08:42:43 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
Message-ID: <20020829124243.GB5456@systemhalted>
References: <3D53B3B700008549@ocpmta1.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D53B3B700008549@ocpmta1.be.tiscali.com>
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

Joel,

> I need to go back to kernel 2.4.18-pa61 and evms-1.0.1 (see problem in ml:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2002-August/017368.html
> with last 1.1.0 evsm release)

Why do you need to regress versions?
 
> Kernel build and operate correctly. I so recompile tools with -ggdb gcc
> option. Then I use ddd to try to debug problem.

What did you recompile with "-g"?

> So I first run without break and got from console:
> evms_vgscan(7998): unaligned access to 0x0002aaae at ip=0x4020a0e3

The unaligned handler took care of it, everything should still
be okay.

> Accepted but when 'continue' is launch:
> warning: Cannot insert breakpoint 2:
> Cannot access memory at address 0x4020a0e3
> What do I wrong or what should I better do?

AFAIK we are using software breakpoints in gdb, which means that
at certain times we _can't_ insert a breakpoint. 

I'm still unclear about the issues here. What's wrong with evms?
It dies from a SIGBUS (unaligned handler failed)? SIGSEGV? 
Operates incorrectly?

c.
 
