Return-Path: <mwood@its.uct.ac.za>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDA2F484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Dec 2003 00:29:12 -0700 (MST)
Date: Mon, 8 Dec 2003 09:29:06 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: Steve Bromwich <lists@fop.ns.ca>
Subject: Re: [parisc-linux] Processes stuck in D state on 715/100XC with
	2.4.22-pa17
Message-ID: <20031208072906.GA27759@marmite.its.uct.ac.za>
References: <3FB265EC00003DBD@ocpmta3.freegates.net>
	<Pine.LNX.4.58.0311190913310.1125@brain.fop.ns.ca>
	<3FBE7C6A.3010104@tiscali.be>
	<Pine.LNX.4.58.0311212145230.21213@brain.fop.ns.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0311212145230.21213@brain.fop.ns.ca>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi

Been going through old mail and saw this thread.

One thing I noticed that the others did not seem to is that you seem to
be under the impression that the TOC and "ser pim" thing have to be done
while the machine is having the problem.  I have never used the TOC
button or "ser pim" before, but I believe how it works is that when the
machine is running (or when you press the TOC button or something) it
writes stuff to some sort of flash area.  The next time you boot, you
can interrupt the boot sequence and type "ser pim" and get the debugging
output.

I hope that helps.

-- 
Michael Wood <mwood@its.uct.ac.za>
