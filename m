Return-Path: <carlos@baldric.uwo.ca>
Received: from fep04-mail.bloor.is.net.cable.rogers.com
	(fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08E15489F
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 13 Feb 2004 12:48:34 -0700 (MST)
Date: Fri, 13 Feb 2004 14:49:08 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
Message-ID: <20040213194906.GA6760@baldric.uwo.ca>
References: <20040211162702.GI990@baldric.uwo.ca>
	<402A4CA500001B4D@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <402A4CA500001B4D@ocpmta2.freegates.net>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> 00000000 <set_dp>:
>        0:	4b 54 00 48 	ldw 24(,r26),r20
>        4:	0e 88 10 9b 	ldw 4(,r20),dp
>        8:	e8 40 c0 00 	bv r0(rp)
>        c:	08 1a 02 5c 	copy r26,ret0
> 
> Should I log a pb near gcc team?

Aggressive inlining, and inlining mistakes might cause the function to 
disapper. Unless you can produce a *small* testcase the gcc team will
not look at the bug. You can't say "glibc doesn't build with gcc-3.5"
... well I guess you can, but nobody will have a clue how to fix the
issue.

Cheers,
Carlos.
