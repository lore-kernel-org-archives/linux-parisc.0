Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 696FB482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 May 2001 02:10:08 -0600 (MDT)
Date: Tue, 22 May 2001 02:10:00 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200105220810.CAA25730@udlkern.fc.hp.com>
To: rbrad@beavis.ybsoft.com
Subject: re: [parisc-linux] kernel panic
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan (and others who are interested),

>From the information you provided, I was able to determine that you
are overflowing the kernel stack.  The various crashes you are
seeing in signal code is simply a side effect of the kernel stack
overflow, and really has nothing to do with whatever the real bug
is.

Every task gets a 16k aligned chunk of memory which contains the
task structure and the kernel stack. The task structure is at the
beginning of this chunk of memory, and the stack starts immediately
after that. This allows us to determine the pointer to the task
structure by simply 16K aligning the stack pointer. However, when
we cross into the next 16K chunk of memory, this no longer works.
In this case, a timer interrupt came in while the stack was over
the 16K boundary, it did some time processing, which includes
charging the current "tick" to the current running process, and
since it uses a bad task pointer at that point, things go wrong.
It appears that most of the time you fail in the same manner.

However, the above information doesn't help much. The only helpful
information I can provide at this point is that the code was in
scsi_dispatch_cmd when the timer interrupt came in.

Now, why does the printk cause problems?  This is only a theory, but most
likely the printk simply slows things down enough to increase the
probability that you will get caught while the stack pointer has crossed
into the next 16K chunk of memory.  Note that even most interrupts are not
going to care about the fact that you have crossed the boundary, because
most interrupts should not care about what the current running process is.
So, in a sense, you have been lucky to catch this, because otherwise the
only side effect of crossing the 16K boundary would be trashing of memory,
which is usually a lot tougher to debug.

Note that we increased the kernel stack/task structure allocation from
8K to 16K because earlier in development we thought that we were getting
close to an overflow, and decided to go with 16K during development
to ensure that it wouldn't happen. Once things are a little more stable
we can probably go back to 8K after doing specific testing for possible
kernel stack overflows. The reason I bring this up is that most likely
8K is enough, and 16K is definitely more than enough. So, if you
are overflowing the stack, it is almost certainly a bug, and not a
"legitimate" overflow. A bug of this nature is usually caused by some
type of unintended recursion, either a bounded but too large recursion,
or an infinite recursion.

So, I don't know if this will give you enough information to easily
find the bug, possibly by code inspection. I haven't inspected the
code at all to see if there is anything obvious. If nothing turns
up very quickly, don't waste a lot of time on it. Make the following
change to arch/parisc/kernel/traps.c, in show_stack():

            /* Stack Dump! */
 
            stackptr = (unsigned int *)sp;
-           dumpptr  = (unsigned int *)(sp & ~(INIT_TASK_SIZE - 1));
+           dumpptr  = (unsigned int *)((sp & ~(INIT_TASK_SIZE - 1))-0x4000);
            printk("\nDumping Stack from %p to %p:\n",dumpptr,stackptr);
            while (dumpptr < stackptr) {
                printk("%04lx %08x %08x %08x %08x %08x %08x %08x %08x\n",

Then reproduce the problem as before.  This should cause the stack dump
procedure to dump the preceding 16K block also.  If you send me the same
stuff as before, i.e. the stack dump (which should be quite large),
register dump, and kernel symbols, I should be able to determine the
recursion sequence.

John

P.S.  For those reading this, I should make it clear that stack dumps are
completely worthless without either the associated kernel or at least the
kernel symbol table.  So, if you find a bug which produces a stack dump,
and you want to report it, make sure you either make the kernel that
produced it available (please don't include kernels in email to this
list!), or at least provide a listing of the kernel symbols and addresses,
like Ryan did.
