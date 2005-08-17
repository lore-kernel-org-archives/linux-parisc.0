From: Andrew Sharp <andy@netfall.com>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Wed, 17 Aug 2005 12:40:58 -0700
Message-ID: <20050817194058.GA3378@netfall.com>
References: <4301B090.9040405@excelcia.org>
	<20050817061913.GA8761@colo.lackof.org>
	<430384FE.6080105@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <430384FE.6080105@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Aug 17, 2005 at 12:42:06PM -0600, Kurt Fitzner wrote:
> Grant Grundler wrote:
> 
> > If performance on a C160 is that important, my advice is to dump
> > both boxes and buy any Pentium M (1.x Ghz) laptop :^). But that would
> > be boring... :^P
> 
> Boring indeed. :)
> 
> Actually, my thought is that my little C160 may be simply shedding light
> on a problem that's more global.  The C160 is the slowest PA2.0 machine
> made.  It's one of the few machines where a PA2.0 CPU is in the same
> speed range as PA1.1 CPUs.

It seems like you're answering your own question here.  I'm an
hppa-ignoramus, but the thing that sticks out the most of all this is that
the machines aren't that different in clock rate, but are that different
in cache size.  So stop ignoring that difference.  Cache thrashing is
a real, and sad, international problem.  Take those benchmarks that
produce slower results on a P4/2MB cache processor than they do on a
P4/512KB processor.  Same motherboard, OS, benchmark.  Only difference,
4x bigger cache.  If the processor is spending more time loading cache
lines, it's spending less time computating.  Cache systems are designed to
improve the performance of general computing tasks, and many benchmarks
fall outside that realm.  What's interesting is that some processors
have caches so big that these benchmarks do still fit inside them (8MB,
16MB, etc) and those processors look really good on those benchmarks
(pucker up your lips and say "SPEC"), compared to cheaper, but really
much faster, processors.

And as for the gcc compiler switch differences, it seems that maybe
the 3.3.5 or whatever just isn't that great when it comes to 2.0/8000
optimizations.  Not really a shocker, but good to know, as it makes the
case for taking a similar look at 4.0 and 4.1 performance.  Mayhaps there
is still time to put some changes into gcc 4.x before a final version is
nailed down for etch or ?

I must be getting bored by pentiums.  What's an old, dual
processor parisc/2.0 machine go for on ebay these days?  ~:^)

a

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
