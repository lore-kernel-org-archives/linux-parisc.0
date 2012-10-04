From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Thu, 04 Oct 2012 13:57:54 +0100
Message-ID: <1349355474.2706.21.camel@dabdike.int.hansenpartnership.com>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
	 <20121004051359.GA24664@ZenIV.linux.org.uk>
	 <1349344936.2706.10.camel@dabdike.int.hansenpartnership.com>
	 <20121004122201.GI23473@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20121004122201.GI23473@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2012-10-04 at 13:22 +0100, Al Viro wrote:
> On Thu, Oct 04, 2012 at 11:02:16AM +0100, James Bottomley wrote:
> 
> > It's plausible.  I just verified the theory that the branch is redundant
> > by successfully booting with this patch applied.
> 
> Somewhat related question: does CONFIG_HPUX work at all?

I don't believe so.  It's been bitrotting for some time.

>   What we have there
> is this:
>         mfctl   %cr30,%r1
>         xor     %r1,%r30,%r30                   /* ye olde xor trick */
>         xor     %r1,%r30,%r1
>         xor     %r1,%r30,%r30
>         ldo     TASK_SZ_ALGN+FRAME_SIZE(%r30),%r30  /* set up kernel stack */
> followed by saving registers into &((struct task_struct *)cr30)->thread.regs.
> cr30 contains something very different, though - struct thread_info *.
> Had been that way since 2002 or so.  And after we'd been finished with
> syscall, we'll get to hpux_syscall_exit, tweak r22/r28 a bit and
> sod off to syscall_exit.  Which does
>         mfctl     %cr30, %r1
>         LDREG     TI_TASK(%r1),%r1
> and eventually restores the values of registers saved in
> &(struct task_struct)r1->thread.regs.  Except that here the value of r1 is
> ((struct thread_info *)cr30)->task, not cr30 itself.  Which matches what we
> have in current.h (and do_fork(), etc.), but not what we'd done when we
> entered the syscall.  IOW, the values we restore will have nothing to do
> with what we saved.
> 
> Unless I'm missing something really subtle, it looks like HPUX compat had
> been very noticably broken since at least 2002.  Comments?

I think it probably has.  I don't believe there's anyone left with hpux
binaries actually checking it.

James


