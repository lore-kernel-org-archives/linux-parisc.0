From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] some other small bitops.h suggestion?
Date: Fri, 15 Apr 2005 13:27:13 -0600
Message-ID: <20050415192713.GA26321@colo.lackof.org>
References: <20050414050727.GA30838@colo.lackof.org>
	<200504141439.j3EEd9oX018785@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504141439.j3EEd9oX018785@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Apr 14, 2005 at 10:39:08AM -0400, John David Anglin wrote:
...
> I don't believe that a lock can be implemented as shown above on
> PA-RISC as we don't have an atomic test_and_set_bit.  The only atomic
> ops are ldcw and ldcd (load and clear word/double).  So, if test_and_set_bit
> needs locking semantics, it will have to be implemented with spinlocks.

I think linus was just defining what he expects from test_and_set_bit().
If parisc implementation doesn't work that way, he considers it a bug
in the parisc implemenation (vs redefining the interface).

> Secondly, I'm not convinced of the concept of volatile code paths
> and using the volatile keyword to keep loops from being optimized
> away.  I think this approach results in bad code.

My take is "volatile" is just a way to tell gcc something about the
code/data that it can't see. I'm not going to quibble with linus
about whether data is volatile or code is volatile. I think in some
cases it's one (e.g accessing memory mapped HW) or the other
(accessing shared data). Key thing is gcc be able to optimize code
but not remove it (especially in the latter case).

We do use volatile for accessing memory mapped HW in all our readl/writel
implementations. Those are uncached accesses and thus shouldn't
ever get removed. This is the obvious case.

I just realized we often use mb() variants in the kernel to mark at least
boundary of lockless access to shared data. But volatile is almost
never mentioned for many of these accesses.
E.g. tg3.[ch] driver messes around with shared memory areas (descriptor
rings) but doesn't have "volatile" keyword in it.

Though we do NOT mark those accesses (memory writes in particular)
with volatile, it sounds like we should.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
