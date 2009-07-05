From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/tracehook
Date: Sun, 5 Jul 2009 19:12:44 GMT
Message-ID: <200907051912.n65JCiPx011838@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit cc29c79e2c02e3857c4856d58efc703e8f404d4a
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 15:08:57 2009 -0400

    parisc: stop using task->ptrace for {single,block}step flags
    
    task->ptrace flags belong to generic code, so instead thief some
    TIF_ bits to use. Somewhat risky conversion of code to test TASK_FLAGS
    instead of TASK_PTRACE in assembly, but it looks alright in the end.
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 78db65f7fffd1fc875d76e531b3a047ea61cf480
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 14:36:16 2009 -0400

    parisc: split syscall_trace into two halves
    
    Instead of fiddling with gr[20], restructure code to return whether
    or not to -ENOSYS. (Also do a bit of fiddling to let them take
    pt_regs directly instead of re-computing it.)
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 089a930b17e497d35d84b0ee388112e24a5ffb34
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 14:39:58 2009 -0400

    parisc: add missing TI_TASK macro in syscall.S
    
    LDREG 0(%r1),%r1 really wants to be accessing thread_info.task,
    instead of hardcoding the 0.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

