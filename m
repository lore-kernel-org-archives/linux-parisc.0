From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Reduce probability of stack overflow
Date: Fri, 8 Dec 2017 21:46:35 -0500
Message-ID: <27DBDD58-FAF4-4675-A282-5EDF4577A580@bell.net>
References: <0B5E3032-0DA1-457B-B32E-21B318FDB687@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0B5E3032-0DA1-457B-B32E-21B318FDB687@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The stack overflow problem was reintroduced by the following change:

    Merge branch 'parisc-4.10-1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
    
    Pull parisc updates from Helge Deller:
    
     - add Kernel address space layout randomization support
    
     - re-enable interrupts earlier now that we have a working IRQ stack

As noted below, interrupts can't be enabled early because the register saves are done on the thread stack prior
to switching to the IRQ stack.  This caused stack overflows and the thread stack needed increasing to 32k.  Even then,
stack overflows still occasionally occurred.

On 2017-11-13, at 7:35 PM, John David Anglin wrote:

> Even with a 32 kB thread stack, I have seen instances where the thread stack overflowed on the mx3210 buildd.
> Detection of stack overflow only occurs when we have an external interrupt.  When an external interrupt occurs,
> we switch to the thread stack if we are not already on a kernel stack.  Then, registers and specials are saved to
> the kernel stack.
> 
> The bug occurs in intr_return where interrupts are reenabled prior to returning from the interrupt.  This was done
> incase we need to schedule or deliver signals.  However, it introduces the possibility that multiple external interrupts
> may occur on the thread stack and cause a stack overflow.  These might not be detected and cause the kernel to
> misbehave in random ways.
> 
> This patch changes the code to only reenable interrupts when we are going to schedule or deliver signals.  As a
> result, we generally return from an interrupt before reenabling interrupts.  This minimizes the growth of the thread
> stack.
> 
> This patch conflicts with the patch proposed by Helge here:
> https://patchwork.kernel.org/patch/9970169/
> 
> In testing, I found that the thread stack can be 16 kB  when using an irq stack .  Without it, the thread stack needs
> to be 32 kB.  Currently, the irq stack is 32 kB.  While it probably could be 16 kB, I would prefer to leave it as is for
> safety.
> 
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> 
> 
> <low-stack.d.stack>
> 
> --
> John David Anglin	dave.anglin@bell.net


Dave
--
John David Anglin	dave.anglin@bell.net



