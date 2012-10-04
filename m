From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Thu, 4 Oct 2012 13:22:01 +0100
Message-ID: <20121004122201.GI23473@ZenIV.linux.org.uk>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
 <20121004051359.GA24664@ZenIV.linux.org.uk>
 <1349344936.2706.10.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1349344936.2706.10.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Oct 04, 2012 at 11:02:16AM +0100, James Bottomley wrote:

> It's plausible.  I just verified the theory that the branch is redundant
> by successfully booting with this patch applied.

Somewhat related question: does CONFIG_HPUX work at all?  What we have there
is this:
        mfctl   %cr30,%r1
        xor     %r1,%r30,%r30                   /* ye olde xor trick */
        xor     %r1,%r30,%r1
        xor     %r1,%r30,%r30
        ldo     TASK_SZ_ALGN+FRAME_SIZE(%r30),%r30  /* set up kernel stack */
followed by saving registers into &((struct task_struct *)cr30)->thread.regs.
cr30 contains something very different, though - struct thread_info *.
Had been that way since 2002 or so.  And after we'd been finished with
syscall, we'll get to hpux_syscall_exit, tweak r22/r28 a bit and
sod off to syscall_exit.  Which does
        mfctl     %cr30, %r1
        LDREG     TI_TASK(%r1),%r1
and eventually restores the values of registers saved in
&(struct task_struct)r1->thread.regs.  Except that here the value of r1 is
((struct thread_info *)cr30)->task, not cr30 itself.  Which matches what we
have in current.h (and do_fork(), etc.), but not what we'd done when we
entered the syscall.  IOW, the values we restore will have nothing to do
with what we saved.

Unless I'm missing something really subtle, it looks like HPUX compat had
been very noticably broken since at least 2002.  Comments?
