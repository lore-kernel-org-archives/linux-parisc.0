Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C6AB4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 08:47:20 -0700 (MST)
Message-Id: <200211111547.gABFlEr3001820@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 11 Nov 2002 10:47:13 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org, jbailey@nisa.net
In-Reply-To: <20021111150347.GA8848@systemhalted> from "Carlos O'Donell" at Nov 11, 2002 10:03:47 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> We need it or else we have to fall back on completely software emulated
> quad arithmetic. Though the framework for replacing all those function
> calls is available.

As Willy mentioned, no PA processors actually implement quad arithmetic
at this time although it is part of the PA 2.0 architecture.  So, we
have to use software emulation and there is no point at this time
in adding the quad arithmetic ops to pa.md definition.  The simplest
approach is to use the libcall interface already implemented for hpux
(see pa/long_double.h).

> Note that GMP was included in the libc tree at one point, but recently
> it's rotted away and Roland was recently removing the last bits in
> 2002-09-20. I'm not sure what ever came of this? It looks like GMP 2.0
> was pushed into the tree in '96 as a generic method for doing unlimited
> precision math?

While GMP is a useful package, it doesn't emulate IEEE 754 arithmetic.
That's what we need here.  There's a floating point emulator in gcc/real.c
but I think the HP library would be superior.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
