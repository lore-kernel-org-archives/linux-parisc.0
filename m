Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D1054848
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Apr 2003 11:33:54 -0600 (MDT)
Message-Id: <200304261733.h3QHXo9P001332@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructors
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sat, 26 Apr 2003 13:33:49 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: hans_boehm@hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030426160829.GE8269@systemhalted> from "Carlos O'Donell" at Apr 26, 2003 12:08:29 pm
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

> Which versions did you try? :)
> 
> bash-2.05b$ gcc-3.0 -fPIC -g test-fpic.c; ./a.out
> Segmentation fault

gcc version 3.2.3 20030316 (Debian prerelease)
gcc version 3.3 20030419 (prerelease)
gcc version 3.4 20030115 (experimental)

> Crashes under 3.0.4, looks like the possible PIC register bug we saw
> with the double printf. I recommend you move to a newer gcc if possible.
> I spent a few minutes looking at assembler output and %r19 looks to low
> to be valid...

This is a bug in 3.0.4.  If you look at the assembler output for the
testcase, you will see the following:

	.section	.ctors,"aw"
	.long	my_start

This is incorrect.  The code should be:

	.section	.ctors,"aw",@progbits
	.align	4
	.word	P%my_start

Using a plabel constructor causes $$dyncall to correctly load the
pic register for the call to my_start.  This is necessary because
the startup file crtbegin.o is not compiled as pic code and the
code in __do_global_ctors_aux clobbers the pic register.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
