Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A46C04829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Dec 2002 05:54:23 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18LNQO-0003DT-00; Mon, 09 Dec 2002 12:54:16 +0000
Date: Mon, 9 Dec 2002 12:54:16 +0000
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <tausq@debian.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Trap handler
Message-ID: <20021209125416.F20336@parcelfarce.linux.theplanet.co.uk>
References: <20021208232601.GH21187@tausq.org> <200212082355.gB8NtUAe010825@hiauly1.hia.nrc.ca> <20021209051214.GK21187@tausq.org> <20021209061913.GM21187@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021209061913.GM21187@tausq.org>; from tausq@debian.org on Sun, Dec 08, 2002 at 10:19:13PM -0800
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

On Sun, Dec 08, 2002 at 10:19:13PM -0800, Randolph Chung wrote:
> the fix has to do with where we should return to after handling an
> interruption. in pre-2.4.20 code we used to return to intr_return. Grant
> thinks that is incorrect and changed it to intr_restore (basically just
> doing the rfi). the -pa12 patch changes it back so it will handle
> pending signals. The items that remain not handled are restoring I-bit,
> softirqs (and irqstats) and rescheduling. We are not sure if those bits
> are needed for interruptions....  can you guys shed some light on this?

Well, let's look at the reference platform (ie x86):

ENTRY(page_fault)
        pushl $do_page_fault
        jmp error_code

error_code:
(blah blah blah.  sets up stuff & calls the address on the stack)
        call *%edi
        addl $8, %esp
        jmp ret_from_exception

ret_from_exception:
        preempt_stop
ret_from_intr:
        GET_THREAD_INFO(%ebx)
        movl EFLAGS(%esp), %eax         # mix EFLAGS and CS
        movb CS(%esp), %al
        testl $(VM_MASK | 3), %eax
        jz resume_kernel                # returning to kernel or vm86-space
ENTRY(resume_userspace)
        cli                             # make sure we don't miss an interrupt
                                        # setting need_resched or sigpending
                                        # between sampling and the iret
        movl TI_FLAGS(%ebx), %ecx
        andl $_TIF_WORK_MASK, %ecx      # is there any work to be done on
                                        # int/exception return?
        jne work_pending
        jmp restore_all

(with preemption disabled, resume_kernel == restore_all)

restore_all:
        RESTORE_ALL

        # perform work that needs to be done immediately before resumption
        ALIGN
work_pending:
        testb $_TIF_NEED_RESCHED, %cl
        jz work_notifysig
work_resched:

So x86 will potentially reschedule on successfully handling a page
fault.  softirqs seem to only get run if we're returning to userspace,
unless we're switching tasks.  That might be a bug in the x86 code.
Judging from the use of cli & sti in the x86 asm, I would venture to
suggest that the I bit should be cleared.  It makes sense anyway --
you can't expect interrupts to be disabled over a page fault.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
