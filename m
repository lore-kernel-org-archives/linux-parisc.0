Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id E93D4482A
	for <parisc-linux@parisc-linux.org>; Wed, 27 Mar 2002 22:05:45 -0700 (MST)
Date: Thu, 28 Mar 2002 00:06:40 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Peter Lavender <plaven@bigpond.net.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] performance?
Message-ID: <20020328000640.B12094@systemhalted>
References: <20020326224358.B28171@piglet> <20020326154444.D26865@parcelfarce.linux.theplanet.co.uk> <20020327180626.C28130@piglet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020327180626.C28130@piglet>; from plaven@bigpond.net.au on Wed, Mar 27, 2002 at 06:06:26PM +1100
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
> The p90 system is an old stock install of redhat 6.0 with very little
> done to the kernel.. it was recompiled with certain drivers built into
> the kernel but that's about it.
> 
> [pete@piglet brad]$ g++ --version
> egcs-2.91.66
> 
> The program is fairly simple in what it does.  
>

This is the crux of the problem. IA32 glibc and kernel are sprinkled
with copious amounts of hand tuned and optimized assembly. We are
nowhere near that level yet :)

What is it that your program does?

Like the beowulf.org people say:
	"Your application is always the best benchmark." 

Cheers,
Carlos.
