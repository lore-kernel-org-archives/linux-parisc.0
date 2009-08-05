From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/next
Date: Wed, 5 Aug 2009 00:41:01 GMT
Message-ID: <200908050041.n750f1mG004882@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Rebased ref, commits from common ancestor:
commit 1e0d061b462e48f9b1609a29aed9a5abcf65833e
Merge: 582b0141b3c3b40c4757dccb4d4543ff391c1e45 7209a334ff1154987aa3a74f1bb595d44bb0b9b2
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Tue Aug 4 20:40:08 2009 -0400

    Merge branch 'ptrace' into next

commit 582b0141b3c3b40c4757dccb4d4543ff391c1e45
Author: James Bottomley <James.Bottomley@HansenPartnership.com>
Date:   Tue Aug 4 23:59:55 2009 +0000

    parisc: add me to Maintainers
    
    It has been suggested that given my proficiency with less popular
    architectures, I should be officially listed as willing to see to the
    care and feeding of this one.
    
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

commit 157eac058fb0b6c6b9d973428221666fa9be87c9
Author: Julia Lawall <julia@diku.dk>
Date:   Tue Aug 4 22:27:07 2009 +0200

    parisc: arch/parisc: correct use of SHF_ALLOC
    
    SHF_ALLOC is suitable for testing against the sh_flags field, not the
    sh_type field.
    
    Signed-off-by: Julia Lawall <julia@diku.dk>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 7209a334ff1154987aa3a74f1bb595d44bb0b9b2
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jul 7 15:06:49 2009 -0400

    parisc: only allow access to USER_PSW_BITS in setregs
    
    We don't want to let users fribble bits they don't need to in their
    PSW... only let them set USER_PSW_BITS from setregs functions.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 8d447ae97881a99da68e09f27356958e99d17da8
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jul 7 13:27:42 2009 -0400

    parisc: unify compat PTRACE_{GET|SET}REGS paths
    
    Just call arch_ptrace for all of them and add some helpers to
    check TIF_32BIT.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 4d889f46750003340055ecac5f9682bef26d0774
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jul 7 02:43:20 2009 -0400

    parisc: ptrace {GET,SET}REGS and compat
    
    Add PTRACE_{GET,SET}REGS and wire them up with proper compat handlers.
    user_regset_struct in <asm-parisc/ptrace.h> is the user-visible regset
    format, and the coredump format.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 50d114781e157f9ff33a03fcbba4ed2507e4c723
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Mon Jul 6 17:28:53 2009 -0400

    parisc: first pass of new-style ptrace for parisc
    
    This is going to be super nasty to gdb if we ever try to wire up
    PTRACE_(GET|SET){,FP}REGS since the format is different between
    coredump and pt_regs.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit feb8fa8122d0e35a9f4be18ce69753fa17d58b79
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 16:01:51 2009 -0400

    parisc: HAVE_ARCH_TRACEHOOK
    
    Let 'er rip.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit b31e3f6e369b337337bca9d99bb6d52ab2296bb6
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 15:59:56 2009 -0400

    parisc: add skeleton syscall.h
    
    Needed for lib/syscall.c when HAVE_ARCH_TRACEHOOK.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit b58a8243c587882ca4d86202b2f2f85cd6ded1d1
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 15:08:57 2009 -0400

    parisc: stop using task->ptrace for {single,block}step flags
    
    task->ptrace flags belong to generic code, so instead thief some
    TIF_ bits to use. Somewhat risky conversion of code to test TASK_FLAGS
    instead of TASK_PTRACE in assembly, but it looks alright in the end.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 6cdb88e40577eed1733efd46b35b447e80f693fc
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 14:36:16 2009 -0400

    parisc: split syscall_trace into two halves
    
    Instead of fiddling with gr[20], restructure code to return whether
    or not to -ENOSYS. (Also do a bit of fiddling to let them take
    pt_regs directly instead of re-computing it.)
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c43604ce7c05f87f87cefce28aa5e20d4c18133a
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Jul 5 14:39:58 2009 -0400

    parisc: add missing TI_TASK macro in syscall.S
    
    LDREG 0(%r1),%r1 really wants to be accessing thread_info.task,
    instead of hardcoding the 0.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 9f4259771faf1ffd99888796d925adae4c93630b
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Mon Apr 27 00:51:13 2009 -0400

    parisc: add TIF_NOTIFY_RESUME and use tracehook_notify_resume
    
    Call tracehook_notify_resume() in do_notify_resume.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 8eae5dbb03e8d9e44c6c07712825605ca591c604
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Mon Apr 27 00:29:53 2009 -0400

    parisc: tracehook_signal_handler
    
    This makes parisc call the standard tracehook_signal_handler hook
    in <linux/tracehook.h> after setting up a signal handler.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 2e595d94bf73a6fc9a076bf89e0b10fc9068bf3f
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Apr 26 23:53:34 2009 -0400

    parisc: tracehook_report_syscall
    
    This makes parisc use the standard tracehook_report_syscall_entry
    and tracehook_report_syscall_exit hooks in <linux/tracehook.h>.
    
    To do this, we need to access current->thread.regs, and to know
    whether we're entering or exiting the syscall, so add this to
    syscall_trace.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

