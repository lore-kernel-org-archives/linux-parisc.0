From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] Remove spinlock_t from cpu_data (and thus
	from processor.h)
Date: Sun, 26 Nov 2006 00:33:06 -0700
Message-ID: <20061126073306.GB29213@colo.lackof.org>
References: <20061125165344.GA29949@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061125165344.GA29949@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 25, 2006 at 11:53:44AM -0500, Kyle McMartin wrote:
> This should enable us to clean up our header files nicely.
...

Yes, but...

> +spinlock_t fencepost[NR_CPUS] = {
> +	[0 ... NR_CPUS-1] = SPIN_LOCK_UNLOCKED
> +};

Unless each CPU gets it's own cacheline, I believe this is
going to ping-pong across CPU caches like hell. Thus
the "per-CPU" initialization. If the fencepost[] locks
are seldom used, then it doesn't matter and we could just use
one cacheline.

but I think you are on the right track to unraveling our
header dependencies a bit more...

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
