Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82DAA4829
	for <parisc-linux@parisc-linux.org>; Tue, 14 Jan 2003 22:49:33 -0700 (MST)
Received: from carlos by systemhalted with local (Exim 3.36 #1 (Debian))
	id 18YgQo-0003es-00
	for <parisc-linux@parisc-linux.org>; Wed, 15 Jan 2003 00:49:42 -0500
Date: Wed, 15 Jan 2003 00:49:42 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@parisc-linux.org
Message-ID: <20030115054942.GK11375@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PARISC Userspace Updates 2003-01-14
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

A new year and a new look at our userspace. Spurred on by Willy's email
about Kernel developments, I wanted to recap some userspace movement in
the past while: 

--- Individual Maintainers ---

- John David Anglin (JDA) is spearheading gcc development for hppa
	= Developing the coolest locking primitive ever seen in glibc.
	= Spotted nasty lock mistakes in pthreads
	= Has gcc failing less and running faster.

- Carlos O'Donell took over Glibc development from Willy
	= Sent 90% of the glibc patches upstream
	 - Big thanks to Willy who did a _lot_ of the 
	   original work, and suffered through it's maintenance.
	= Fixed rounding mask bugs in glibc fp* code
	= SHMLBA bugs squashed
	= Synchronized sigcontext between kernel and glibc.
	= Going crazy on Glibc, and writing static 64-bit Glibc.
	= We saw 2.3.x released for HPPA :)
	= Mulling over cache coherency, ldcw, and D-cache move-in's.

- I think JDA took over binutils for HPPA too...

--- Currently Being worked On ---

- GNU Glibc

	= Preparing final 10% into a form that can be accepted
	  upstream.
	= Fixing locking primitives.
	= Trying to have zero failures in 'make check'
	= fraiseexcept is still a bugger with delayed exceptions?
	= EWOULDBLOCK emulation needs analysis.
	= setjmp/longjmp implementation needs testing.
	= Implementing *context() calls.
	= Make atomic ops atomic (atomicity.h)
	= Initial implementation of a static 64-bit Glibc is in 
	  the works.

- GNU Gdb

	= Initially maintained as a patch for GDB 5.2 in debian.
	= Not an offical GDB port yet...
	= Carlos is working on and off to work this into
	  GDB 5.3, since he agreed to do it for Drow.
	= Help appreciated.
	= Thanks for various people like Richard, JDA and Randolph
	  for fixing bugs.

- GNU Binutils

	= A mystery to me... and I actively read the mailinglist :)
	= I believe we have some symbol visibility bugs.

====

Things that could be done if anyone is thinking of a project, though
help on the above is much more appreciated.

- Prelink on HPPA, requiring some binutils/glibc changes
	= http://freshmeat.net/projects/prelink/?topic_id=253
- NTPL on HPPA, requiring gcc/binutils/glibc changes
	= http://people.redhat.com/drepper/nptl-design.pdf
	= http://people.redhat.com/drepper/tls.pdf

====

How other ports do it, I'm not sure. There's a lot of love in this
particular port :) Again, many thanks to all of the hardworking
individuals who help. 

Cheers,
Carlos.

p.s. Any glaring inconsistencies or lack of knowledge are mine and mine
     alone, so feel free to correct them.
