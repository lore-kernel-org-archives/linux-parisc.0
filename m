From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/tracehook
Date: Sun, 5 Jul 2009 20:02:35 GMT
Message-ID: <200907052002.n65K2ZpR024335@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit abf01ee7f86ac2bee2982e1a840a3136312d895e
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 16:01:51 2009 -0400

    parisc: HAVE_ARCH_TRACEHOOK
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 351d7bc3f587b79f08cdeb4033a53da90ed3bf58
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 15:59:56 2009 -0400

    parisc: add skeleton syscall.h
    
    Needed for lib/syscall.c when HAVE_ARCH_TRACEHOOK.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 73e89724292b34321d4c6e24cdd590e487c36e57
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 15:08:57 2009 -0400

    parisc: stop using task->ptrace for {single,block}step flags
    
    task->ptrace flags belong to generic code, so instead thief some
    TIF_ bits to use. Somewhat risky conversion of code to test TASK_FLAGS
    instead of TASK_PTRACE in assembly, but it looks alright in the end.
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 2f0dda27f8e62c409e30125d420e89c762d0ea98
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 14:36:16 2009 -0400

    parisc: split syscall_trace into two halves
    
    Instead of fiddling with gr[20], restructure code to return whether
    or not to -ENOSYS. (Also do a bit of fiddling to let them take
    pt_regs directly instead of re-computing it.)
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit abe61475751e54ffe5323983833c09c951baf0bc
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 14:39:58 2009 -0400

    parisc: add missing TI_TASK macro in syscall.S
    
    LDREG 0(%r1),%r1 really wants to be accessing thread_info.task,
    instead of hardcoding the 0.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c7f25b66b4e990ecba247c334d540a6db4ab8ae1
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Mon Apr 27 00:51:13 2009 -0400

    parisc: TIF_NOTIFY_RESUME
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 618525e21c173ef093872b41f4da3a6bb7de4252
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Mon Apr 27 00:29:53 2009 -0400

    parisc: tracehook_signal_handler
    
    This makes parisc call the standard tracehook_signal_handler hook
    in <linux/tracehook.h> after setting up a signal handler.
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 686028921d47115fe807b7b9d3e035eee155baf0
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Apr 26 23:53:34 2009 -0400

    parisc: tracehook_report_syscall
    
    This makes parisc use the standard tracehook_report_syscall_entry
    and tracehook_report_syscall_exit hooks in <linux/tracehook.h>.
    
    To do this, we need to access current->thread.regs, and to know
    whether we're entering or exiting the syscall, so add this to
    syscall_trace.
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

