Return-Path: <paulmck@us.ibm.com>
Received: from linux.local (bi01p1.co.us.ibm.com [32.97.110.142])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E2914851
	for <parisc-linux@parisc-linux.org>;
	Fri,  9 Apr 2004 19:21:42 -0600 (MDT)
Received: by linux.local (Postfix on SuSE Linux 7.3 (i386), from userid 500)
	id B456A148C85; Fri,  9 Apr 2004 18:21:16 -0700 (PDT)
Date: Fri, 9 Apr 2004 18:21:16 -0700
From: "Paul E. McKenney" <paulmck@us.ibm.com>
To: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Message-ID: <20040410012115.GA1285@us.ibm.com>
References: <1081439244.2165.236.camel@mulgrave>
	<20040408161610.GF31667@dualathlon.random>
	<1081441791.2105.295.camel@mulgrave>
	<20040408171017.GJ31667@dualathlon.random>
	<1081446226.2105.402.camel@mulgrave>
	<20040408175158.GK31667@dualathlon.random>
	<1081447654.1885.430.camel@mulgrave>
	<20040408181838.GN31667@dualathlon.random>
	<1081448897.2105.465.camel@mulgrave>
	<20040408184245.GO31667@dualathlon.random>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040408184245.GO31667@dualathlon.random>
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Reply-To: paulmck@us.ibm.com
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 08:42:45PM +0200, Andrea Arcangeli wrote:
> But I've an fairly optimal solution for you, you should make it a
> read_write spinlock, with the readers not disabling interrupts, and the
> writer disabling interrupts, the writer of the prio-tree will not take a
> timeslice, the readers instead will take a timeslice, but since they're
> readers and you've only to read in the flush_dcache_page irq context,
> you don't need to disable irqs for the readers.  I don't have better
> solutions than this one at the moment (yeah there's the rcu reading of
> the prio-tree but I'd leave it for later...)

FWIW, agreed.  Past attempts at RCU-based tree algorithms have been
a bit on the complex side.  While I believe that simpler versions are
possible, RCU-based trees should be approached with caution and with
long lead times.

						Thanx, Paul
