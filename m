Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE4904829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 14:38:26 -0600 (MDT)
Date: Fri, 20 Sep 2002 16:37:24 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: Istvan Gyenes <frts@simba.sch.bme.hu>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350
Message-ID: <20020920203724.GD24622@systemhalted>
References: <20020920194820.GC24622@systemhalted> <Pine.LNX.4.44.0209201301220.20374-100000@garibaldi.apptechsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0209201301220.20374-100000@garibaldi.apptechsys.com>
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
> For me, the last kernel that didn't crash on my J5000 in smp mode while
> doing apt-get update was kernel-image-2.4.17-32-smp_23.1_hppa.deb
> 
> I wouldn't recommend using it, however...

If I _wasn't_ using my A500 for contiual binutils/glibc/gcc 
builds, I'd be testing out the SMP problems :)

When running an SMP kernel and doing multiple compiles, the 
box was rather unsuable e.g. random process death.

As Randolph noted to me on IRC, it looks like fixing the mmap
issues we have would be a step in the right direction. When I
get my current projects completed (glibc fixing)... I want to
look at this :) then again, maybe I'll be doing glibc work for
the rest of my usefull days ;)

We also fail many of the LTP tests having to do with
signals, mmap'ing, and direct IO.

c.
