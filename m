Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 918EF4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 08:03:38 -0700 (MST)
Date: Mon, 11 Nov 2002 10:03:47 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org, jbailey@nisa.net
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111150347.GA8848@systemhalted>
References: <200211110345.gAB3jgdF001254@hiauly1.hia.nrc.ca> <200211110426.gAB4QDnH001302@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211110426.gAB4QDnH001302@hiauly1.hia.nrc.ca>
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
> Nope, we need it.  Sparc uses library calls like "_Q_add" for the basic
> operations on quad values.
> 
> Dave

We need it or else we have to fall back on completely software emulated
quad arithmetic. Though the framework for replacing all those function
calls is available.

Note that GMP was included in the libc tree at one point, but recently
it's rotted away and Roland was recently removing the last bits in
2002-09-20. I'm not sure what ever came of this? It looks like GMP 2.0
was pushed into the tree in '96 as a generic method for doing unlimited
precision math?

I've only just realized how usefull having extremely descriptive 
Changelog's can be :)

c.
