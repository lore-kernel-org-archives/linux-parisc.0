Return-Path: <carlos@baldric.uwo.ca>
Received: from fep03-mail.bloor.is.net.cable.rogers.com
	(fep03-mail.bloor.is.net.cable.rogers.com [66.185.86.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F19B486E
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 14 Feb 2004 11:22:46 -0700 (MST)
Date: Sat, 14 Feb 2004 13:23:21 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
Message-ID: <20040214182319.GA8542@baldric.uwo.ca>
References: <20040211162702.GI990@baldric.uwo.ca>
	<402A4CA500001B4D@ocpmta2.freegates.net>
	<20040213194906.GA6760@baldric.uwo.ca>
	<20040214001729.GA4727@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040214001729.GA4727@colo.lackof.org>
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

> > Aggressive inlining, and inlining mistakes might cause the function to 
> > disapper. Unless you can produce a *small* testcase the gcc team will
> > not look at the bug. You can't say "glibc doesn't build with gcc-3.5"
> > ... well I guess you can, but nobody will have a clue how to fix the
> > issue.
> 
> And he should say *something*.
> Pointing at the problem is a first step towards fixing it.
> Don't wait until you have a "small" test case to point out a problem
> since one might never (have time to) find one.
> 
> Even though I fix very few bugs these days, I'm grateful for
> every bug report.

I was too harsh, sorry for that, you should really submit a bug report
saying that glibc 2.3.3 doesn't build with gcc-3.5 on hppa-linux. It's
the truth, and you don't know why. The best you can do is list the 
steps you used to recreate the problem.

Thanks for setting me straight Grant! :)

c.
