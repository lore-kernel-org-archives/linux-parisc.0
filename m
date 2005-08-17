From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Wed, 17 Aug 2005 00:19:13 -0600
Message-ID: <20050817061913.GA8761@colo.lackof.org>
References: <4301B090.9040405@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4301B090.9040405@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 16, 2005 at 03:23:28AM -0600, Kurt Fitzner wrote:
> To my surprise, when it came to integer operations, the
> B132L outperforms the C160!

Thanks for posting the results...looks like fun!

....
> If you look at the individual results, in most areas the C160 performs
> about 20% better than the B132.  It's just that in a few areas, the C160
> has absolutely dismal performance.  Numeric sorting and the assignment
> algorithm were both notably slower on the C160.

Could these workloads be thrashing memory or cache?

Anyone know if the C160 has slower memory latency since the Memory
controller is on the MMU and not directly attached to the runway bus?

> With a clock speed 20% faster, I must admit that the C160's poor showing
> was a dissappointment.  I'm wondering if this is because there isn't a
> 64-bit userland yet.  Is stepping down to 32-bit on the C160 hurting its
> performance that badly?

It really depends on what the tests are doing.
Can you characterize the tests you care about better?

You might also investigate why NEURAL NET test is so much
faster on C160: 1.6905 (C160) vs 1.1334 (B132L) 
That's much more than clock speed difference.
I suspect it's a cache friendly algorithm.

> I suppose (assuming I'm correct about the reason for the performance
> drop) my options are to wait for 64-bit userland or to put HPUX on it.

HPUX has a very good parisc compiler. It's possible recent gcc is
approaching the acc performance in most cases, but *alot* of tuning
went into acc and PBO (Profile Based Optimization) is still the
easiest way to get nearly optimal performance for any program.

If performance on a C160 is that important, my advice is to dump
both boxes and buy any Pentium M (1.x Ghz) laptop :^). But that would
be boring... :^P


> Is there any way which someone can help the 64-bit userland effort who
> is quite strong in system-level programming in general though weak in
> Linux kernel programming specifically?  Is there a project web site for
> this effort?

Just this mailing list. Carlos O'Donell is occasionally hacking at it.
Sounds like you might be able to help him.

thanks again,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
