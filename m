From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] clerar user page test
Date: Thu, 9 Dec 2004 00:42:08 -0700
Message-ID: <20041209074208.GC5307@colo.lackof.org>
References: <418A81310000D172@mail-7-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A81310000D172@mail-7-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Dec 07, 2004 at 03:12:37PM +0100, Joel Soete wrote:
> Hello all,
> 
> here are the results of some clup test:
> (run on b2k running  2.6.10-rc3-pa2 64bit)
> time ./clup0; time ./clup1 ; time ./clup2
> 
> real    0m0.498s
> user    0m0.440s
> sys     0m0.014s
> 
> real    0m0.277s
> user    0m0.229s
> sys     0m0.010s
>
> real    0m0.272s
> user    0m0.227s
> sys     0m0.013s

cool - these are good results for evaluating instruction pipeline.

Unless you are continuously clearing the new pages
I would expect your test is just pounding the cache
and not real memory.

I looked over the code and wasn't sure how big the "memory footprint"
your test had. But 40*PAGESIZE didn't seem like nearly enough.

It should walk through at least 32MB of RAM to be certain it's
not touching the same cachelines over again. For PA8800 it would
need to be 128MB or something like that.

> 
> (the corresponding src are attached.
> Compile with (for remind:):
> ggc -o clup0 clup0.c
> gcc -mach=2.0 -o clup1 clup1.c
> gcc -mach=2.0 -o clup2 clup2.c)
> 
> so real benefit to use double word insn on 64bit (clup0 verusu clup1)
> 
> but not reducing the number of loop (clup1 versus clup2)

Well, that's still 5/270 or almost 2%.
Doubling the loop is worth doing IMHO in this case.

Do you also have time to add prefetching to clup2?

Look at the kernel prefetchw() implementation in include/asm/processor.h.
You want to use something that ends up looking like
	__asm__("ldd L1_CACHE_BYTES*N(%0), %%r0" : : "r" (addr));

Vary the value "N" from 2 to 8 to see what's optimal.
Prefetching too much doesn't help either.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
