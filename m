Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 529DA4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 18:36:16 -0700 (MST)
Date: Tue, 7 Jan 2003 20:34:58 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: grundler@dsl2.external.hp.com, jsoe0708@tiscali.be,
	markov@monmouth.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic when extracting large tar files
Message-ID: <20030108013458.GC22018@systemhalted>
References: <20030107091704.GC4093@dsl2.external.hp.com> <05456AF0-223D-11D7-950D-0030656F07A2@esiee.fr> <20030107201319.GA20757@systemhalted> <20030108002521.21a9c5e7.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030108002521.21a9c5e7.varenet@esiee.fr>
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

> > > FWIW, I experienced that bug too on the A500, had no time to chase it 
> > > down but I will look at it soon.
> > 
> > How big is the file? I routinely tar/untar _very_ large source archives
> > on my A500 and I see no problems. 

> About 700M gzipped.

I just unpacked 1234744157 Jan  7 19:33 src.tar.gz into a 4GB source
archive on an ext2 fs. The box didn't even blink. Running 2.4.19-pa22 
parisc64 non-SMP.

As it turns out Vlad's archive is on 14MB's but contains lots of very
small files. I'm trying to get a hold of this to test it out.

c.
