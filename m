Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with dump driver. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Wed, 13 Feb 2002 18:34:59 +0100." <3C6AA3C3.D21C4164@admin.france.hp.com>
References: <3C6AA3C3.D21C4164@admin.france.hp.com> 
Date: Thu, 14 Feb 2002 23:43:52 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020215064352.86A404858@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> but at the first try to write on the dump device if "sleep"
> forever in "brw_kiovec". I'm pretty sure that it comes from
> a spinlock deadlock. So I'm looking for someone who is able
> to explain the "data page fault" function. 

Have you considered using IODC to write out the data
instead of using OS code?

It would avoid much of the ugliness of spinlocks still
held in the IO or VM code.

> For me it is the signal 15 in function handle_interruption() 
> of traps.c. If it is the space 0 (kernel space), it call 
> parisc_terminate(), that call dump() (my funtion). But in dump 
> I use a buffer, and I use this buffer with "brw_kiovec". So I 
> think that "brw_kiovec" do a page_fault somewhere, but because 
> the previous page_fault fail, there is still a spinlock somewhere.

If you TOC the system, you should see the code was spinning
on a ldcw instruction.  either IOAQ should point to the
function and the address referenced by ldcw should be
visible in System.map.

> Can someone help on this issue ?

Once we know either (offending code location or which
spinlock), we can start looking at code to figure out
what the problem is.


In the next mail:
| Another thing that can produce this behavior is the interruption mask.
| When calling the do_page_fault, what it the interruption mask ?

I believe PSW_I bit is off. EIEM is irrelevant at this point.
See entry.S where it calls handle_interruption.

| I think it is high enough to mask SCSI interruption?
| When is it reset back ?

See "do_cpu_irq_mask()" (arch/parisc/kernel/irq.c).
SCSI interrupt as an "External Interrupt" and remains masked in the EIEM
even after PSW_I bit is set. No interrupts from anything using the masked
EIR bit will be processed until we exit do_cpu_irq_mask(). If that
gets interrupted by a page fault or something, using that driver
is toast until we reset the EIEM registers of all cpus....another
reason to use IODC since it doesn't use interrupts for
processing.

thanks,
grant
