Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep04-mail.bloor.is.net.cable.rogers.com (fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BF324852
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Apr 2003 15:23:52 -0600 (MDT)
Date: Sat, 26 Apr 2003 17:24:42 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: hans_boehm@hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Program counter from sigcontext, constructors
Message-ID: <20030426212442.GB14330@systemhalted>
References: <20030426160829.GE8269@systemhalted> <200304261733.h3QHXo9P001332@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304261733.h3QHXo9P001332@hiauly1.hia.nrc.ca>
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

> This is a bug in 3.0.4.  If you look at the assembler output for the
> testcase, you will see the following:
> 
> 	.section	.ctors,"aw"
> 	.long	my_start
> 
> This is incorrect.  The code should be:
> 
> 	.section	.ctors,"aw",@progbits
> 	.align	4
> 	.word	P%my_start
> 
> Using a plabel constructor causes $$dyncall to correctly load the
> pic register for the call to my_start.  This is necessary because
> the startup file crtbegin.o is not compiled as pic code and the
> code in __do_global_ctors_aux clobbers the pic register.

Good catch. I hadn't bothered looking at the .S!
Again the recommendation is going to be "Use a newer gcc" :)

c.
