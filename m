Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31DFF4905
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 23:56:10 -0600 (MDT)
Date: Sat, 23 Aug 2003 01:55:06 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
Subject: Re: [parisc-linux] Re: [glibc] fixing delayed exceptions in hppa
Message-ID: <20030823055506.GA9821@systemhalted>
References: <20030822144615.GF31872@systemhalted> <200308222024.QAA16264@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308222024.QAA16264@hiauly3.hia.nrc.ca>
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

On Fri, Aug 22, 2003 at 04:24:19PM -0400, John David Anglin wrote:
> Based on what Jim Hull said, I believe that would be better.  I was using
> 
>   "fldd 0(%%sr0,%%sp),%0" : "=f" (d) : "0" (d)
> 
> There isn't a true dependency in the above but I believe that any load
> to the destination register will raise the exception.

Dave, I'm sorry if you sent me a patch and I dropped it :( Did I ever
receive a diff for this from you?

It's rather vague at times because the spec says "or an operation which
depends on a pending, trapping insn." I think DHD, and perhaps myself
got caught up on the "load or store" which probably means only
register->memory (memory->register too) and not register->register.

I'll rewrite this patch to do an fldd and see what the tests say. I'm
toatally under the assumption that this operation doesn't need to be
optimal :) (e.g. If you use feraiseexcept a lot you are not a
high-performance program).

c.
