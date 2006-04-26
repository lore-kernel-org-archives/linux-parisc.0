From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Wed, 26 Apr 2006 11:42:22 -0500
Message-ID: <200604261142.22548.mszick@morethan.org>
References: <200604241650.k3OGon5N027856@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241650.k3OGon5N027856@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon April 24 2006 11:50, John David Anglin wrote:
> > On Mon, Apr 24, 2006 at 11:35:48AM -0400, John David Anglin wrote:
> > > The intent of the errata seems to be to relax the alignment requirement
> > > for ldc[dw],co in cases where the spinlock is not being shared with a
> > > non-coherent I/O device.
> > 
> > AFAIK, only one non-coherent PA-RISC box has PA2.0 and parisc-linux
> > doesn't support it: T600.
> 
> It probably has coherent I & D caches as well as this seems to be a
> requirement for both 1.1 and 2.0.
> 
> > (I'm assuming ",co" completer is PA2.0 only - please correct me if
> > that's wrong.)
> 
> It's not in the PA 1.1 arch...
> 
Dave, Grant, Group;

We are faced with 10 year old documentation on a 20 year old design
and a question on a 21st century kernel.

To find a direct quote in answer to a bullet proof spinlock in this
context has eluded me.
But, I think I can explain the requirements.

To keep this mail from becoming pathologically long, I will paraphrase
a lot.

You want on hand the:

PA7200_design.pdf (HP website);

Ms. Ruby B. Lee's article "Precision Architecture" from IEEE Computer,
Volume 22, No. 1, January 1989, pp 79-91 (IEEE Society will sell you 
a reprint);

The tables and descriptions of load/store completer codes from the
PA Instruction Overview (website);

The instruction descriptions for ldw/stw/ldcw from the PA Instruction
descriptions (website);

Optionally, HP Patent No. 6,079,012 - get the 'image' version with
the nice flow charts. (ignore the issue date)

- - - -

Background:

Ms. Lee redesigned the data cache system for the PA7200; she also
gave us the instructions that we need to deal with our problem.

Ms. Lee describes this as a Level 1 cache without a Level 2 cache.
Without quibbling over terminology, consider it a split, single
level, cache system.  That makes its layout clearer.

Physically, it is split into two parts.  A small cache, on-chip,
which she terms an 'assist cache' and the larger capacity, off-chip
cache.  Both run at cpu clock speed.

The cpu operates only on/to/from the data in the assist cache.
A not present address is fetched directly to the assist cache, if
it is not present in the off-chip cache.

What happens when the little cache runs out of room?

Without programmer intervention, it is written to the off-chip cache,
and it is the off-chip cache that deals with memory when required.

How to make changes (such as lock release) immediately observable?

Ms. Lee gave us a couple new instructions.  The tech writer who wrote
the instruction descriptions call these 'Hints'. 
Ms. Lee describes them as cache control commands.

Enter the 'sl' completer for ldw/stw.

Specifying the 'sl' disables the write-back to the off-chip cache
and causes the assist cache to write to main memory.  In effect, a
strongly ordered store of a Dcache line flush.

This design also employs 'cache snooping' and allows approximately
ten snoops to be outstanding at the same time.  

The snoops have a higher priority than the data/instruction transactions.
They _should not_ (but might) require a 'sync' to give us the 
immediately observable lock release that we require.

It is unclear to me if the ownership (master/slave) relationship
of the cache lines still holds in this new design.  Both the on-chip
and off-chip caches are under the control of the same on-chip CAM.
(Which probably why she calls this a single level cache system.)

- - - -

Entering the 21st century, Linux world...

Consider:
Load balancing can 'pull' a task off of a cpu and migrate it
to another cpu...
Kernel code is executed in the kernel context of the user task...
Tasks can be preempted...

It seems (without a code path audit) that a task could be migrated
to another cpu while holding an 'in system' spinlock.

Now that would be a rare occurrence, but the current spinlocks only
fail once every two or three days under heavy load.

- - - -

The bullet proof spinlock...

The elegant solution lies somewhere between this and what is
currently implemented.

/* Optional, only if available and proven needed */
- - Save current flag and set tcb 'do not migrate'
- - Save current flag and set tcb 'do not preempt'

/* If another processor already holds the lock, the cache
   line has been replicated in our cache. Pretend we are
   first to use the lock. */

	ldw,sl the_lock, a_register  /* This will be assist cache only */
    ldcw,co the_lock, a_register /* Try to grab lock */

- - If successful, continue
- - If fail, spin on either ldcw,co or a ldw,sl - not clear which

/* Now release the lock with the implied assist cache line flush
   to memory. */

   stw,sl UNLOCKED, the_lock

/* If we diddled the scheduler tcb flags, restore them here
- - Restore the tcb 'do not preempt'
- - Restore the tcb 'do not migrate'

- - - -

At which point, I must defer to the software engineering department.

Mike
> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
