Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC548482A
	for <parisc-linux@parisc-linux.org>; Sat, 30 Mar 2002 08:46:28 -0700 (MST)
Date: Sat, 30 Mar 2002 10:47:24 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Will Newton <will@misconception.org.uk>
Cc: parisc-linux@parisc-linux.org, debian-hppa@debian.org
Message-ID: <20020330104724.A16468@systemhalted>
References: <E16qeEE-0000jh-00.2002-03-28-18-02-27@mail6.svr.pol.co.uk> <20020328143202.I12094@systemhalted> <E16qkq2-0008AG-00.2002-03-29-01-05-55@mail7.svr.pol.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E16qkq2-0008AG-00.2002-03-29-01-05-55@mail7.svr.pol.co.uk>; from will@misconception.org.uk on Fri, Mar 29, 2002 at 01:07:07AM +0000
Subject: [parisc-linux] Re: Fwd: Re: Any hppa gurus?
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

> 
> So, are the first four floats/doubles in an arg list always passed in 
> registers?
> 
> How about func(int, float, int, double, int, float)?
> 
>

A float fits into a single fr register.
A double fits into two fr registers (fr7 (uses fr6),fr5 (uses fr4)) 


	int    gr26 - fr7    ===
	===    gr25 - fr6    ===
	int    gr24 - fr5    float
	===    gr23 - fr4    ===

I wonder what happens if the call was int,int,float... and if that
would make a difference :)

/me goes to check

Hrmm...

        int    gr26 - fr7    ===
        int    gr25 - fr6    float
        ===    gr24 - fr5    === 
        ===    gr23 - fr4    ===

Not sure why that doesn't happen in the first example. Though 
I am no guru at this :)

Any help from more knowledgable parties would be helpful.

c.
