Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27D17483C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Jun 2002 21:04:23 -0600 (MDT)
Subject: Re: [parisc-linux] Unaligned access failures with apt-get on SMP
	K460.
From: Ryan Bradetich <rbradetich@uswest.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, richard_hirst@linuxcare.com
In-Reply-To: <200206170231.g5H2V44J011035@hiauly1.hia.nrc.ca>
References: <200206170231.g5H2V44J011035@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 16 Jun 2002 21:04:22 -0600
Message-Id: <1024283062.27050.29.camel@beavis>
Mime-Version: 1.0
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

Dave,

This is the apt-get from debian unstable ... so if I had to guess
I would assume that it is:

||/ Name           Version        Description
+++-==============-==============-============================================
ii  gcc            3.0.4-6        The GNU C compiler.

any way I can tell from the binary?

thanks,

- Ryan


On Sun, 2002-06-16 at 20:31, John David Anglin wrote:
> > > The instruction causing the unaligned trap is:
> > > 0x4005e47c <_ZN11DynamicMMap8AllocateEm+112>:	stw r21,8(sr0,r3)
> > > 
> > > As you can see from r3 (403ce08c) in the register dump is aligned on a
> > > 4-byte boundry.  So the question is why is this trap being executed?
> > 
> > Maybe the message is misleading.  It looks as if the insn may be trying
> > to write to readonly memory based of the value of r3.
> 
> Sorry, this is wrong.  Was _ZN11DynamicMMap8AllocateEm compiled with
> gcc-3.2?  It looks as if C++ exceptions may be involved.  This only
> has a chance of working with 3.2.  I suspect that an exception handler
> is involved because r20 is not valid across calls and r20/r21 are
> used in C++ exceptions.  The call looks to be a millicode call which
> might be part of the problem.
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
> 
