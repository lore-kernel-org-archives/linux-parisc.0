Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FA9D483A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Jun 2002 20:31:06 -0600 (MDT)
Message-Id: <200206170231.g5H2V44J011035@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Unaligned access failures with apt-get on SMP K460.
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Sun, 16 Jun 2002 22:31:04 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rbradetich@uswest.net, parisc-linux@lists.parisc-linux.org,
	richard_hirst@linuxcare.com
In-Reply-To: <200206170059.g5H0xw9a010945@hiauly1.hia.nrc.ca> from "John David Anglin" at Jun 16, 2002 08:59:58 pm
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

> > The instruction causing the unaligned trap is:
> > 0x4005e47c <_ZN11DynamicMMap8AllocateEm+112>:	stw r21,8(sr0,r3)
> > 
> > As you can see from r3 (403ce08c) in the register dump is aligned on a
> > 4-byte boundry.  So the question is why is this trap being executed?
> 
> Maybe the message is misleading.  It looks as if the insn may be trying
> to write to readonly memory based of the value of r3.

Sorry, this is wrong.  Was _ZN11DynamicMMap8AllocateEm compiled with
gcc-3.2?  It looks as if C++ exceptions may be involved.  This only
has a chance of working with 3.2.  I suspect that an exception handler
is involved because r20 is not valid across calls and r20/r21 are
used in C++ exceptions.  The call looks to be a millicode call which
might be part of the problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
