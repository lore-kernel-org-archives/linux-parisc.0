Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43122482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Nov 2001 00:45:29 -0700 (MST)
Received: from beavis.ybsoft.com (beavis.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id E366FBC48
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Nov 2001 00:45:26 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 29 Nov 2001 00:45:26 -0700
Message-Id: <1007019927.14588.9.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] keyboard_tasklet bug?
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

Hello parisc-linux hackers,

I have spent the last couple of evenings exploring new (to me anyways)
parts of the kernel tracking down a SMP hang on my C200+.  What I found
appears to be a more generic bug, so I'm posting it here for ideas on
how to fix it, or for someone to explain to me why this isn't a bug :)



After quite a bit of tracking the problem down, I figured out the kernel
wasn't halting, but was stuck in the following infinate loop from
tasklet_action() in kernel/softirq.c

while (list) {
	struct tasklet_struct *t = list;

	list = list->next;

	if (tasklet_trylock(t)) {
		if (!atomic_read(&t->count)) {
			if (!test_and_clear_bit(TASKLET_STATE_SCHED, 						&t->state))
				BUG();
			t->func(t->data);
			tasklet_unlock(t);
			continue;
		}
		tasklet_unlock(t);
	}

	local_irq_disable();
	t->next = tasklet_vec[cpu].list;
	tasklet_vec[cpu].list = t;
	__cpu_raise_softirq(cpu, TASKLET_SOFTIRQ);
	local_irq_enable();
}

I eventually figured out that the if(!atomic_read(&t->count)) was
failing... and the task would be added back into the list via the
following lines of code:

	t->next = tasklet_vec[cpu].list;
	tasklet_vec[cpu].list = t;

This loop would continue since the atomic_read(&t->count) was always
non-zero, and the task was always being put back on the list.


I figured out that the keyboard_task was the task the atomic_read
was failing on, and started to investigate why.  I figured out that 
the keyboard_tasklet was being initialized disabled via the following
macro from include/linux/interrupt.h:

	#define DECLARE_TASKLET_DISABLED(name, func, data) \
	struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(1), func, data }

This macro initialized the ->count to 1.

I also figurd out that the keyboard_tasklet was being scheduled via the
schedule_tasklet() before the enable_tasklet() was called it.  (The
enable_tasklet() provides a memory barrior, then calls atomic_dec()
on the ->count of the tasklet, making it 0).


This trace shows the path to the first schedule_tasklet() of the
keyboard_tasklet, starting with the start_kernel() since that is the
common point between schedule_tasklet() and enable_tasklet().


schedule_tasklet(keyboard_tasklet)
-------------------------
1. start_kernel()
2. console_init()
3. con_init()
4. vc_init()
5. reset_terminal()
6. set_leds()
7. schedule_tasklet()



enable_tasklet(keyboard_tasklet)
--------------------------------
1. start_kernel()
2. rest_init()
3. init() via kernel_thread.
4. do_base_setup()
5. do_init_calls()
6. chr_dev_init()
7. tty_init()
8. kbd_init()
9. enable_tasklet()


Looking in the start_kernel() ... console_init() is the 9th function
called, where as rest_init() is the last function called.

I am not sure why this only showed up under SMP for my on the C200+, but
it was _very_ reproducable.  As a temporary solution (and to verify I'd
found the problem), I commented out the set_leds() in reset_terminal()
and the C200+ boots both SMP and UP fine.  I know this is not the proper
fix, but I am not sure how to fix this problem, thus my post to the list
:)

Thanks for reading, and any feedback welcome!

- Ryan
