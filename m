Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id A42C0482B
	for <parisc-linux@parisc-linux.org>; Fri, 25 Jul 2003 00:39:21 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19fwCy-0005Mg-00
	for <parisc-linux@parisc-linux.org>; Fri, 25 Jul 2003 02:37:40 -0400
Date: Fri, 25 Jul 2003 02:37:40 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@parisc-linux.org
Message-ID: <20030725063739.GA13017@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Generic light-weight syscall.
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

pa,

Any thoughts about how one should implement some type of lightweight
syscall for our glibc to use?

We already have the makings of a simple system for SET_THREAD_SELF (e.g.
seting cr27, the thread register, from userpsace), and I want to extend
this to:

exchange_and_add (volatile uint32_t *mem, int val)
atomic_add (volatile uint32_t *mem, int val)
compare_and_swap (volatile long int *p, long int oldval, long int newval)

o---> libc 
 --> exchange_and_add 
  ==> Params into kernel
   ==> disable interrupts on the current processor
    ==> take a semaphore to keep other cpu's out
    ==> do work 
    ==> release semaphore
   ==> reenable i-bit
  --> back into userspace and done.

This _must_ be very very fast, and appear atomic to userspace.

Perhaps adding other pages instead of 0xE0 for set_thread_self might be
the simplest way to do this? The area after the linux gateway page
perhaps? Which seems to be the start of the next 4k page? Would this be
possible? e.g. branch to 0x1000 (not 0x100 which is the current syscall
branch).

c.
