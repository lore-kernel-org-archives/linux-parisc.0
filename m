Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id B69BE48DE
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Mar 2002 09:40:36 -0700 (MST)
Date: Sat, 9 Mar 2002 11:41:13 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Duraid Madina <duraid@fl.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430
Message-ID: <20020309114113.B7582@systemhalted>
References: <20020309082810.CD8FF4835@dsl2.external.hp.com> <000001c1c750$8d5f7900$022a17ac@simplex>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000001c1c750$8d5f7900$022a17ac@simplex>; from duraid@fl.net.au on Sat, Mar 09, 2002 at 08:54:55PM +1100
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
> > Have you tried begging, trading, or buying some cycles on a 
> > Superdome with some 100GBs of RAM instead of waiting for 
> > weeks to see your jobs run to completion?
> 
> Really, my code should be pretty efficient (it takes weeks to run anyway
> ;) with the setup I've described above, but the killer is: I'm a
> University student ("I knew it!" I hear you all say ;) and as such, my
> code is perpetually in the "hmm, I wonder what'd happen if.." state. So
> "some cycles" would become "some more cycles" faster than you could say
> "where's all my RAM gone?!"
> 
> 	Duraid
>

This is a very similar problem that we had when calculating prime
alternating knots[1]. Essentially what was done was to use MPI[2] 
and a fast network connection, such that you could have _other_ 
computers holding data in RAM/SWAP.

Parallelize parallelize parallelize.

It's really easy to learn MPI and it's great for those big problems
that you may not be able to do with a 64-bit box :)

a. Get a 100MBit/1GBit switch and NIC's.
b. Get some more boxes (borrow/lie/cheat/steal)
c. Tie them together.

This is what I do for a hobby :) ... and yes I'm a student aswell.
It's nice to see that people like Bell and Nortel are willing to 
donate expensive gear for projects like yours or mine[3] :)

c. 

[1] http://baldric.uwo.ca/article.php3?section=baldric&article=knots
[2] http://www-unix.mcs.anl.gov/mpi/mpich/
[2] http://www.lam-mpi.org/
[3] http://www.baldric.uwo.ca/~carlos/pdisplay.html
