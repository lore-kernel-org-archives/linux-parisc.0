Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] irq.c patch to fix lockups on recent kernels 
In-Reply-To: Message from Randolph Chung <randolph@tausq.org>
   of "Wed, 15 May 2002 06:47:03 PDT." <20020515134703.GY30370@tausq.org>
References: <20020515134703.GY30370@tausq.org> 
Date: Thu, 16 May 2002 14:40:45 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020516204045.D4E85482A@dsl2.external.hp.com>
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

Randolph Chung wrote:
> After talking to Grant about this, I'm not convinced this is the right
> fix. It seems like do_cpu_irq_mask is already called with eiem masked,
> so I'm not sure why masking it again might make a difference....

No. eiem == External Interrupt Enable Mask.
Only the I-bit is disabled when do_cpu_irq_mask() is entered.
Bits in the EIRR are already cleared by assembler code to indicate
we are handling those interrupts.
If any bits in EIRR are set when re-enabling I-bit (in PSW),
we should get another external interrupt.

In -pa17, I removed the mfctl/mtctl calls since I-bit is supposed
to be disabled to block *all* interrupts. But supposing some
driver calls cli() and re-enables interrupts in general, the
EIRR bits (ie interrupt "vectors" in ia64 speak) we are processing 
could run into the same problem that I saw with xtime_lock.
Thus, restoring the code I removed in -pa17 that mucks with eiem
would mask issues with sti/cli in the drivers.

Conversely, any interrupt handler sittin on the interrupt stack
for long periods of time will block stuff too...the symptoms I've
heard so far don't match this scenario though.

> Can someone more familiar with this part of the kernel please take a
> look?

The patch looks fine to me. I suspect it's masking
a problem with sti()/cli() usage someplace though.

thanks,
grant
