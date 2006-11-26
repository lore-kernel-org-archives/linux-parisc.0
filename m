From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [PATCH] Remove spinlock_t from cpu_data (and thus
	from processor.h)
Date: Sun, 26 Nov 2006 11:38:32 -0700
Message-ID: <20061126183832.GK14076@parisc-linux.org>
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

Thanks for looking at this.

My first thought was "Surely there's a better way to do this, maybe
DEFINE_PER_CPU".

Then I looked at what you'd had to touch.  Essentially, we're
multiplexing 6 different ops onto one interrupt.  This would make sense
if we were short of interrupts, but on the vast majority of systems, we
aren't.

We define NOP, RESCHEDULE, CALL_FUNC, CPU_START, CPU_STOP and CPU_TEST.
CPU_TEST is never sent, down to 5.  CPU_NOP and CPU_RESCHEDULE are the
same other than debug statements, down to 4.  So by taking 3 additional
CPU interrupts, we can eliminate the spinlock entirely.

We could do away with RESCHEDULE if we pass a nop function to CALL_FUNC.
I don't know if we would suffer a performance hit from doing that
though.

We could also only enable CPU_STOP if CPU_HOTPLUG was set.  And
fold CPU_START/CPU_STOP into the CALL_FUNC bucket.  Or deregister
CPU_START after the CPU's come up.

In any case, I think this is a whole lot preferable to the spinlock that
we're currently using.  I have some other ideas (like using set_bit()
and xchg() which would take the atomic_hash_spinlock), but I think
redoing our IPI support in the way I've outlined above is cleaner.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
