Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id D36554829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 08:56:53 -0600 (MDT)
Date: Mon, 5 Aug 2002 10:55:38 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19 tree merged in.
Message-ID: <20020805145538.GA31773@systemhalted>
References: <1028503560.977.15.camel@beavis> <20020805123404.GW7040@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020805123404.GW7040@charite.de>
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
> For me, it doesn't even BUILD!
> 
> (I build it on the box itself 712/80, gecko):
> 

Please include a list of the following:

1. Compiler version.
2. Binutils version.
3. Last time you ran "apt-get update; apt-get dist-upgrade;".
4. Running kernel version.
5. How you got the kernel source tree.
	- Did you 'cvs co' ontop of a 2.4.18 tree?
6. What steps you took to compile the kernel.
	- Did you try runnig 'make mrproper' first?
7. Full output of all the steps.

c.
