From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] 2.6 and SMP
Date: Mon, 12 Jul 2004 09:49:52 -0700
Message-ID: <20040712164952.GA546@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

SMP is one of the big remaining pieces that needs to get fixed in 2.6.
Does anyone want to help look at it?

This is what I saw yesterday while trying latest 2.6 on a SMP a500
(2x450MHz).

While booting up, the system "hangs". TOC shows that it died in
parisc_terminate with not much useful information. When I instrumented
the startup sequence with printk, it seemed to stop in init_idle when
setting the schedule flag on the idle task. It didn't make much sense to
me that set_bit() would die though....

after some more digging around, it looks like it's actually dying in:
kernel_thread()->do_fork()->copy_process()->dup_task_struct()->alloc_
task_struct()->kmem_cache_alloc() 

when starting the init thread.

kmem_cache_alloc() has this bit of code:

        local_irq_save(save_flags);
        ac = ac_data(cachep);
        if (likely(ac->avail)) {

and ac was NULL. ac_data(cachep) is cachep->array[smp_processor_id()]

it looks like smp_processor_id() was returning the wrong value (8 in my
test), so it was picking up an uninitialized per-cpu cache.

i forced smp_processor_id() = 0 in that function, and it gets a bit
further till schedule(), and then it dies in there. I'm not quite sure
where/why it dies. then i fell asleep :)

here's one "trick" i used yesterday to debug the
parisc_terminate()-not-giving-much-info problem.... basically in some
cases printk() stops working (perhaps interrupts are disabled?), so the
only thing we can do is rely on TOC and "ser pim". I replaced
parisc_terminate() with this:

void parisc_terminate(char *msg, struct pt_regs *regs, int code,
          unsigned long offset)
{
    volatile register unsigned long x = regs->iaoq[0];
    volatile register unsigned long y = *(unsigned long *)(regs->gr[30]-16);
    for (;;) ;
}

if you do a disassembly on traps.o, you'll see that now you should get
r19 = regs->iaoq[0] 
r20 = a stack location which, in this case, corresponds to the return
      pointer of kmem_cache_alloc()

now when you do a TOC dump you can see where the fault actually occured.

you should be able to do this with a few registers at a time (i only
tried 2-3 at a time). Look at the disassembly dump to figure out what
goes where... it's a bit of a pain, but might be useful still.... 

anyway, it looks like possibly some things are not setup properly in the
init_thread_union structure? I don't know why smp_processor_id() (which
is current_thread_info()->cpu) would return the wrong value. Earlier in
the boot the value seems to be correct....

i won't have time to look at this more for a couple of weeks....
hopefully someone else will figure it out in the meantime? :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
