From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Optimi[zs]e copy_*_user routines
Date: Fri, 10 Sep 2004 10:04:45 -0400
Message-ID: <20040910140438.GE9981@baldric.uwo.ca>
References: <20040910000032.GJ28659@tausq.org>
	<20040910001557.GK28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040910001557.GK28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> - this is the first time the kernel has had to change sr2 in the kernel
>   (thus Carlos' earlier patch to restore it in the syscall path).
>   Arguably we should not do the sr2 save/restore in the syscall path and
>   instead do it in the copy routines, in order to make syscall as fast
>   as possible. Thoughts?

In an optimal world:

- Syscalls must only copy sr7 (user space id) to sr3 (where the kernel expects
  user space id to live), and then set sr7 to kernel space id zero, when
  ready.

- Light weight syscalls clear sr2 so that users don't abuse security.

- syscall_restore should set sr7 to user space id and clear sr2 for
  syscalls (don't reload from TASK_PT).

- syscall_restore_rfi should store sr3 into sr7, and r0 into sr2 for
  restoration in restore_rfi.

- When starting a new process sr7 should be set to the processes space
  id, and sr2 should be cleared for making syscalls with.

a. No userspace code will be using scratch space registers because we
   don't support that. We will be clobbering sr2 for the user. If in 
   the future we decided to change the kernels space, we just clobber
   it to something else. As long as no userspace code is setting sr2
   and expecting it to stay set.

b. The kernel might use temp scratch registers, in which case the
   kernel can use sr1,sr2,sr5 and sr6, though for each sr we use as a
   temporary we have to incur the penalty of a save/restore during an
   interruption (I think that's right eh?).

c. On a schedule we should be saving only the state of those sr's that
   are used as temp and are important to the process?
        --- I need to review code here, I don't know what path is 
            taken during a context switch to save/restore state ---

>   Alternatively, if we play some tricks with the preprocessor we can get
>   away with only using sr1, but having 3 copies of the copy routines in
>   the code. I actually tried this, but found the hacks required to do it
>   to be rather ugly.

Difficult to maintain.
 
> - gcc gurus (Dave :) might think what I'm doing with exceptions to be
>   too ugly^Wfragile. are there better ways to do it? :)

GCC might break this if it gets smarter. Though I like the current
method of indicating volatility.

>   this is a somewhat compelling reason to write the whole thing in
>   assembly (which will also allow for a few more small optimizations).
>   do you think the advantages of maintaining C code outweigh the
>   slight performance penality and hacks required?

Perhaps. The C code is nice though, you could *almost* abstract it to
all architectures that have double,single word,byte load store insns :)

Thanks for this wicked work.

c.
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
