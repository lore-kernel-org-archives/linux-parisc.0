Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] irq.c patch to fix lockups on recent kernels 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Thu, 16 May 2002 14:40:45 MDT." <20020516204045.D4E85482A@dsl2.external.hp.com>
References: <20020515134703.GY30370@tausq.org>  <20020516204045.D4E85482A@dsl2.external.hp.com> 
Date: Thu, 16 May 2002 15:30:48 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020516213048.DDE21482A@dsl2.external.hp.com>
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

Grant Grundler wrote:
> Only the I-bit is disabled when do_cpu_irq_mask() is entered.
> Bits in the EIRR are already cleared by assembler code to indicate
> we are handling those interrupts.
> If any bits in EIRR are set when re-enabling I-bit (in PSW),
> we should get another external interrupt.

I'm thinking we should:
o move the EIRR bit handling into do_cpu_irq_mask()
  (do_cpu_irq_mask() could loop until EIRR is zero).
o move I-bit handling into the entry.S assembly.

That way, EIRR and EIM handling is all in C and I-bit is all in asm.
That seems to make the most sense to me since EIRR/EIM are closely
related and I-bit is orthogonal to that.

grant
