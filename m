Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20B38482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Nov 2002 09:12:05 -0700 (MST)
Date: Mon, 18 Nov 2002 11:12:15 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021118161215.GE2729@systemhalted>
References: <20021111211624.GC9704@systemhalted> <200211172154.gAHLseba018429@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211172154.gAHLseba018429@hiauly1.hia.nrc.ca>
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

> It occurred to me these might be a gcc problem on PA1 machines.  These
> machines don't have fneg and negation is currently implemented as the
> product with -1.  This may cause invalid operation to be set if the
> value is a signaling NaN.
> 
> A better way to do the negation is to toggle the sign bit but this is
> inefficient as the value needs to be copied from a FPR to a GPR and
> back again.
> 
> A quick check would be to run the tests with "-mpa-risc-2-0" and see
> if this makes any difference.
> 

Interesting. I shall add this to my list of checks todo once I get glibc
2.3.1 out the door. Everything is setup, I'm just running into some
package integration problems (e.g. failing to restart certain services
causes the dpkg -i to fail).

My todo includes:

- Follow our discussion on delayed exceptions and try a few
  implementations of trap barriers

- Examine if -1*NaN is causing failures in the fp glibc tests.

- Implement atomic_add, echange_and_add, and compare and swap, which are
  required in atomicity.h

- Make some progress implementing *context() calls in glibc (SAPDB needs
  them).

- Take a closer look at our setjump/longjmp impementation (there were
  some fears that it was mildly broken)

c.
