Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep04-mail.bloor.is.net.cable.rogers.com (fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48684483C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 14:52:14 -0600 (MDT)
Date: Fri, 25 Apr 2003 16:52:59 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "Boehm, Hans" <hans_boehm@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
Message-ID: <20030425205259.GG32717@systemhalted>
References: <75A9FEBA25015040A761C1F74975667D01442051@hplex4.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <75A9FEBA25015040A761C1F74975667D01442051@hplex4.hpl.hp.com>
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

> It's a new, currently rather simple, but thread-compatible, purely user-level, profiler.  It includes some infrastructure for using hardware atomic operations in reasonably portable ways.  Need less to say, PA-RISC makes a wonderful test case.

Cool. (Could you please make your MUA wrap lines at a reasonable length?).

> > A. What kernel are you using?
> 2.4.17-64 on spe170.testdrive.hp.com.

Needs updating :)
  
> Once you get the PC in the signal handler, that's easy.  It sounds like getting the PC from a signal handler from a 32-bit executable on a 64-bit kernel is currently impossible?  I should probably focus on 64-bit executables?  Or does profil() have a way to get around the problem?

64-bit executables don't exist in Linux .... I'm working on it, if you
want to get into the glibc port please talk to me off-list :)

64-bit kernels spill 64-bit values into the 32-bit values of the
sigcontext struct. Which means you get everything in the wrong place and
much larger than you expected. This _has_ to be fixed soon, perhaps I'll
look at this code next.

c. 
