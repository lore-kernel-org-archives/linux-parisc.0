Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep04-mail.bloor.is.net.cable.rogers.com (fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19513485D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Apr 2003 15:29:35 -0600 (MDT)
Date: Tue, 29 Apr 2003 17:30:28 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "Boehm, Hans" <hans_boehm@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
Message-ID: <20030429213027.GB12492@systemhalted>
References: <75A9FEBA25015040A761C1F74975667D01442066@hplex4.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <75A9FEBA25015040A761C1F74975667D01442066@hplex4.hpl.hp.com>
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

> 1) Switching to a machine with a 2.4.20-pa28 kernel and gcc 3.2.
> 2) Discarding the privilege level bits from the program counter value.

Why?

> 3) Adding 24 bytes to the struct sigcontext pointer (?) passed as a third argument to the signal handler. (!)

Are you still using a 64-bit kernel?

> Needless to say, I'm still a bit concerned about (3).  Why does the third argument to the signal handler appear to point 24 bytes BEFORE the sigcontext structure?  Does it actually point at a bigger structure?  Is the third argument to a signal handler really not a pointer to sigcontext?  Did struct sigcontext change recently, so that I'm dealing with a version mismatch?

What glibc version is installed? I made recent changes to mache the
userspace and kernel versions of sigcontext (now a machine context).
 
> With the 24 bytes added, I clearly get the right program counter values.  I also seem to get the right general register values.

How are you accessing this value? Can you generate a simple testcase
please?

c.
