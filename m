Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Jul 2003 19:36:25 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030729233624.GB17107@systemhalted>
References: <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted> <20030727122745.GC16753@dsl2.external.hp.com> <20030728155703.GA32553@systemhalted> <20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk> <20030728190455.GE32553@systemhalted> <20030728191420.GE3840@parcelfarce.linux.theplanet.co.uk> <20030728211012.GC6706@sleepie.demon.co.uk> <20030729175057.GA17107@systemhalted> <20030729210609.GK6706@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030729210609.GK6706@sleepie.demon.co.uk>
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

> Depends what people want to use it for.  I couldn't use it to time how
> long some syscall took, for example.  But if we zap the microseconds
> part on smp anyway, that's irrelevant.

Well there was talk of, on irc, of exporting the CPU# through cr26.

- Read cr16
- Read cr26
- Read cr16

If you weren't rescheduled the delta should be a minimal number of
ticks (not taking into account nearness to unsigned overflow). You then
use this tick value to calculate a delta via a table of CPU specific
offsets. If the tick is far out from the last read, then you assume a
reschedule and loop. Perhaps terminating on the third try with a default
delta?

I mean the easiest way, as willy notes is to jump into the kernel with a
fast syscall, disable interrupts, get the CPU# and index into a table of
cpu vs. last known good tick. 

However, since we _can_ read cr16 (as willy wrote in an email I totally
failed to read, sorry willy!) from userspace on most systems (not on
705's and 710's but they aren't SMP anyway and we can change the method
there) we are trying to make good use of that.

So there are a variety of ways:

1. Fast-syscall similar to set_thread_register, clears interrupt bit,
   indexes into cpu# table to get last good known tick and returns it
   to userspace (after cleaning up the mess).

2. Userspace does triple read and loop until it looks like we (in a
   lockless fashion) have both the right CPU# and latest tick which we
   can use to update our CPU/tick table.

3. Export a page with '(tick_val & mask) | CPU#' or 'tick_val xor CPU#'.
   You then use this to determine the CPU and tick atomically in a
   single read.

We know #1 works. We don't know if #2 is faster than #1 (or stable), 
anyone wishing to comment please do :) Number 3 would loose resolution 
in, first by loping off bits, or by having near tick values that 
overlap and you aren't able to find the CPU# from the xor'd quantity.

To add a datapoint to #2, on a PA8700 650Mhz I see:
Anyone wishing to run this test on another box, please do...
---
#include <stdio.h>
#include <time.h>

#define LOOPS 1000

int main(void){
   double avg_diff=0.0;
   unsigned long cr16a, cr16b, cr26;
   int i=LOOPS;

   while(i>0){
      asm("mfctl %%cr16, %%r26   \n\
           mfctl %%cr26, %%r24   \n\
           mfctl %%cr16, %%r25   \n\
           stw %%r26, %0         \n\
           stw %%r25, %1         \n\
           stw %%r24, %2" : "=m" (cr16a), "=m" (cr16b), "=m" (cr26) :);
      printf("cr26=%lu\ncr16a=%lu\ncr16b=%lu\ndiff=%lu\n",
		cr26,cr16a,cr16b,cr16b-cr16a);
      avg_diff+=(double)(cr16b-cr16a);
      printf("avg_diff=%f\n",avg_diff);
      i--;
   }

   printf("Average ticks per back/back cr16 read (%lu loops) = %f\n",
		LOOPS,avg_diff/(double)LOOPS);
   exit(0);
}
---
<snip>
cr26=4294967295
cr16a=3348684869
cr16b=3348684881
diff=12
avg_diff=11435.000000
Average ticks per back/back cr16 read (1000 loops) = 11.435000
carlos@firin:/mnt/flaire/src/linux-2.5/arch/parisc/kernel$ 
---

c.
