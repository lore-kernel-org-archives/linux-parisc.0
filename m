Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41C864829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 11:55:13 -0700 (MST)
Date: Wed, 15 Jan 2003 13:54:38 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	"FARINATI, LEANDRO" <leandro.farinati@hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64 userspace
Message-ID: <20030115185438.GC19253@systemhalted>
References: <9A0482A7BD2506488AD9417C93F3714F011A1AE6@xsp01.brazil.hp.com> <200301151840.h0FIeS9I018903@hiauly1.hia.nrc.ca> <20030115184636.M26554@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030115184636.M26554@parcelfarce.linux.theplanet.co.uk>
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

> > 1) Kernel -- design and implement 64-bit system calls.
> 
> Another piece of the kernelside puzzle is designing the VM layout for
> 64-bit processes.  Do we want to (as ia64 does) reserve parts of the address
> space for the kernel?  Map shared libraries in different quadrants from
> the user process?  Keep data in yet another quadrant?
> 
> It's a lot of work, and I'm not sure the will is there to make it happen.
> 

We are swamped with a 32-bit userspace, and 32/64-bit kernel, creating a
full 64-bit userspace is extremely difficult. I'm currently trying to
workout the bits to get a static 64-bit Glibc, though currently fixing
the 32-bit Glibc we have is time consuming enough.

c.
