Return-Path: <ja2morri@csclub.uwaterloo.ca>
Received: from perpugilliam.csclub.uwaterloo.ca
	(perpugilliam.csclub.uwaterloo.ca [129.97.134.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC31C48F1
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Mar 2004 07:57:58 -0700 (MST)
Sender: ja2morri@perpugilliam.csclub.uwaterloo.ca
To: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
References: <404EC2E70000349C@ocpmta2.freegates.net>
From: James Morrison <ja2morri@csclub.uwaterloo.ca>
Date: 16 Mar 2004 09:57:56 -0500
In-Reply-To: <404EC2E70000349C@ocpmta2.freegates.net>
Message-ID: <kfhsmg8et57.fsf@perpugilliam.csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


"Joel Soete" <soete.joel@tiscali.be> writes:

> > Are you running make check after make install?
> >
> Yes, but as mentioned in the original build env and not in the chrooted env
> as it seems I would had to do.
> 
> hth,
>     Joel

 Humm, this seems backwards to me.  I wonder if make install mangles some
variables to look at the newly installed versions of ld.so, etc.  Anyway,
I'll be quiet for a while since I don't have a build on hand to check stuff
out.

Jim
