Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep04-mail.bloor.is.net.cable.rogers.com (fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id D40364839
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 12:53:24 -0600 (MDT)
Date: Fri, 25 Apr 2003 14:54:14 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "Boehm, Hans" <hans_boehm@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
Message-ID: <20030425185414.GD32717@systemhalted>
References: <75A9FEBA25015040A761C1F74975667D0144204D@hplex4.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <75A9FEBA25015040A761C1F74975667D0144204D@hplex4.hpl.hp.com>
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

Hans,

What code are you porting? :)

> 1) I need to retrieve the pc value from the sigcontext structure passed to a timer signal handler.  In an earlier message, Paul Bame pointed me at sc_iaoq.  After a bit more reading, my conclusion was that sc_iaoq[0] should be a reasonable value to use as a sampled pc.  However I have been unable to see anything reasonable in that slot (or sc_iaoq[1] for that matter).  Presumably a struct sigcontext pointer is always passed as the third parameter to a signal handler?  And it's filled in for timer interrrupts?  What does profil() do?  (I tried to read the code, but it's hard to trace through all the configuration stuff.)

A. What kernel are you using?
 
The reason I ask is that 64-bit kernels return broken sigcontext
pointers (for now it stuffs 64-bit values into a 32-bit values within
the sigcontext, rather it should take into account the fact that
userspace or the calling threads personality is 32-bit and truncate the
register values).

What is there to understand about profil()? Based on your PC it uses
modular arithmetic (the shift, scale, and division) to track on a coarse
scale which parts of your code are being executed.

> 2) If I mark a C function as a constructor function, and compile it with -fPIC, it seems to run before globals are properly accessible.  The retrieval of the address of a global through the global offset table seems to return a bad address and the access faults.  Are there known issues in this area?  (The offending function actually ends up in the main program, if that matters.)

B. Can we see the code?

c.
