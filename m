From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Thu, 6 Jan 2005 15:55:17 -0700
Message-ID: <20050106225517.GA21450@colo.lackof.org>
References: <20050104233920.GB2857@colo.lackof.org>
	<200501050000.j0500iKD024978@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501050000.j0500iKD024978@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 04, 2005 at 07:00:43PM -0500, John David Anglin wrote:
> Grant Grundler wrote:
> > The pipeline on PA-8x00 can load 4 instructions at a time.

My statement happens to be correct but is misleading.
And I misunderstood it too.

The system does "fetch" 4 insn at a time but can't execute/retire
4 mem ops at a time.  PCX-U can only handle two memory ops per cycle
as (correctly) described by the GCC machine definition below.


> This is what the GCC machine definitions says:

Thanks for digging this up. I definitely was confused about
some of the details.

> ;; The PA8000 has a large (56) entry reorder buffer that is split between
> ;; memory and non-memory operations.
> ;;
> ;; The PA8000 can issue two memory and two non-memory operations per cycle to
> ;; the function units, with the exception of branches and multi-output
> ;; instructions.  The PA8000 can retire two non-memory operations per cycle
> ;; and two memory operations per cycle, only one of which may be a store.

Yes, this is correct.  I'm told this is true for all PA-8x00 CPUs.

I was confused. The "load-store unit" describes one unit that can
only do one load or one store.

Each instruction queue is also divided into even and odd slots.
The functional units are assigned to either an even or odd slot.
Ie two loads in adjacent slots will use both load-store units.
two loads in odd slots will serialize. That shouldn't be an issue
for copy_user_page_asm but it would be good if gcc is aware of it.

Further, the PCX-U cache accesses are serialized when to the same cacheline.
The copy_user_page_asm loop should be restructured to interleave accesses
to the two 64 byte cachelines handled in each iteration of the loop.
This won't matter for stores at the "tail end" of the loop but will
help with the loads at the front of the loop.

> ;; Given the large reorder buffer, the processor can hide most latencies.

Yes. I'm told the re-order buffers (aka "memory ops queue") should be
sufficient to hide scheduling issues. So we don't have to sweat
too many details if we get it "close enough".

> ;; According to HP, they've got the best results by scheduling for retirement
> ;; bandwidth with limited latency scheduling for floating point operations.
> ;; Latency for integer operations and memory references is ignored.

Along this line, according to the specs, PCX-U has a "best case load
latency of three cycles".
This is because of "one cycle for address calculation and 2 cycles for
off chip cache access". Later CPUs are 2 cycles.
Restructuring the USE6REGs code might help PCX-U.

> ;; It's worth noting that there is no way to saturate all the functional
> ;; units on the PA8000 as there is not enough issue bandwidth.

Agreed.
But we do saturate the load-store units in the copy_user_page_asm code.
At least for short bursts.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
