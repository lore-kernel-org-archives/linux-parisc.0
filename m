Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 753064833
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Jun 2002 19:00:05 -0600 (MDT)
Message-Id: <200206170059.g5H0xw9a010945@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Unaligned access failures with apt-get on SMP K460.
To: rbradetich@uswest.net (Ryan Bradetich)
Date: Sun, 16 Jun 2002 20:59:58 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, richard_hirst@linuxcare.com
In-Reply-To: <1024273345.27050.26.camel@beavis> from "Ryan Bradetich" at Jun 16, 2002 06:22:24 pm
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

> The instruction causing the unaligned trap is:
> 0x4005e47c <_ZN11DynamicMMap8AllocateEm+112>:	stw r21,8(sr0,r3)
> 
> As you can see from r3 (403ce08c) in the register dump is aligned on a
> 4-byte boundry.  So the question is why is this trap being executed?

Maybe the message is misleading.  It looks as if the insn may be trying
to write to readonly memory based of the value of r3.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
