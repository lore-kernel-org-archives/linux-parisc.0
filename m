Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFFDD4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Nov 2002 18:50:03 -0700 (MST)
Date: Sun, 10 Nov 2002 20:49:35 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, tausq@debian.org,
	jbailey@nisa.net
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111014935.GB13575@systemhalted>
References: <20021111012129.A29998@parcelfarce.linux.theplanet.co.uk> <200211110132.gAB1WK8T004703@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211110132.gAB1WK8T004703@hiauly1.hia.nrc.ca>
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
> Paul Bame was working on getting HP to release their long double library
> code.  I haven't heard what the status is.  If he gets the code, then it
> should be relatively straight forward to integrate into libgcc and use
> the same code as for hpux.  Can glibc handle 128-bit long doubles as
> that's the size long doubles will be if we get the code?
> 
> There are two tests in the libstdc++-v3 suite that fail because of this.
> However, there can't be much in the way of real world code that actually
> uses long doubles.
> 

It looks we have the framework. The glibc tree has sysdeps/ieee754/ldbl-128 
which looks to be used by hppa and sparc64. The code was last touched by
Jakub Jelinek in 2002-09-09 (cleaning up some cruft). ldlb-128 does get
parsed as one of the generic-dirs in Make-dist. For all intents and
purposes we have soft-emulated support :)

c.
