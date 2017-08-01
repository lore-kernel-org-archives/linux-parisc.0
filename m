From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid
 context at mm/slab.h:416
Date: Tue, 1 Aug 2017 10:52:20 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1708011050580.27473@math.ut.ee>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee> <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net> <alpine.LRH.2.20.1707300947250.27473@math.ut.ee> <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Since this code hasn't changed in a long time, it should be possible to bisect problem.

I know the patch works, but out of curiosity I bisected it and found 
that the BUG is brough out with the following commit. Seems to make 
sense.

ma1c3c5eab171590f86edd8d31389d61dd1efe3037 is the first bad commit
commit 1c3c5eab171590f86edd8d31389d61dd1efe3037
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Tue May 16 20:42:48 2017 +0200

    sched/core: Enable might_sleep() and smp_processor_id() checks early
    
    might_sleep() and smp_processor_id() checks are enabled after the boot
    process is done. That hides bugs in the SMP bringup and driver
    initialization code.
    
    Enable it right when the scheduler starts working, i.e. when init task and
    kthreadd have been created and right before the idle task enables
    preemption.
    
    Tested-by: Mark Rutland <mark.rutland@arm.com>
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Acked-by: Mark Rutland <mark.rutland@arm.com>
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Steven Rostedt <rostedt@goodmis.org>
    Link: http://lkml.kernel.org/r/20170516184736.272225698@linutronix.de
    Signed-off-by: Ingo Molnar <mingo@kernel.org>



-- 
Meelis Roos (mroos@linux.ee)
