Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1BA424829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 13:49:28 -0600 (MDT)
Date: Fri, 20 Sep 2002 15:48:20 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Istvan Gyenes <frts@simba.sch.bme.hu>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350
Message-ID: <20020920194820.GC24622@systemhalted>
References: <20020919224609.DF1314829@dsl2.external.hp.com> <Pine.OSF.4.33.0209201006420.5180-100000@simba.sch.bme.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.OSF.4.33.0209201006420.5180-100000@simba.sch.bme.hu>
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

> Thanks I'll try that!
> 
> Another question: If 2.4.19 SMP not enough stable where can I find the
> latest stable smp kernel source?
> 
> Thanks,
> 
> Steve

Nothing up this sleeve, nothing up this sleeve...
<carlos pulls a stable smp kernel out of his hat>

Tada! ;)

I'm not quite certain that we ever had a stable
SMP kernel. While an older kernel might seem to 
give you SMP stability, it does so at the cost of 
speed and the introduction of old bugs.

If you can find some test cases for Non-SMP vs.
SMP stability, then we'll be a step in the right 
direction.

c.
