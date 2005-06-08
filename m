From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Wed, 8 Jun 2005 10:05:25 -0600
Message-ID: <20050608160525.GA5908@colo.lackof.org>
References: <20050607180315.GH29220@colo.lackof.org>
	<4282FEEC0000AB95@mail-3-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Ingo Molnar <mingo@elte.hu>,
 parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEC0000AB95@mail-3-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jun 08, 2005 at 03:31:14PM +0200, Joel Soete wrote:
> error: structure has no member named `lock'
...
> the pb is this hunk:
> --- linux/include/asm-parisc/processor.h-orig   20 May 2005 00:05:13 -0000
> +++ linux/include/asm-parisc/processor.h        6 Jun 2005 04:32:36 -0000
> @@ -87,7 +88,7 @@ struct cpuinfo_parisc {
>         unsigned long hpa;          /* Host Physical address */
>         unsigned long txn_addr;     /* MMIO addr of EIR or id_eid */
>  #ifdef CONFIG_SMP
> -       spinlock_t lock;            /* synchronization for ipi's */
> +       raw_spinlock_t pending_lock;  /* protect sender/receiver races */
>         unsigned long pending_ipi;  /* bitmap of type ipi_message_type */
>         unsigned long ipi_count;    /* number ipi Interrupts */
>  #endif
> ====<>====

Sorry - my bad. That chunk is not in my source tree.
I've respun the patch without that bit.
See -03 in the same location.

> Freeing unused kernel memory: Badness in smp_call_function at /Develop/linux-2.6.12-rc5-pa3-050606_4Consolidate/arch/parisc/kernel/0
> Backtrace:
>  [<1011604c>] smp_call_function+0x6c/0x384
>  [<10106024>] flush_data_cache+0x24/0x40
...

This is not a real problem. We have a paranoid WARN_ON in the code
and it's been warning us about this one case for a long time now.

> 364k freed
> [...]
> 
> hanging?

What was the last output?

> The analayse of a TOC giving me following info:
> -----------------  Processor 0 TOC Information -------------------
> GR[02] == rp = 0000000010276d7c
> Func: uart_shutdown, Off: 0xbc, Addr: 0x10276d7c
...
> Parse IAOQ = 0x0000000010158b80 for CPU[0]
> Func: synchronize_irq, Off: 0x18, Addr: 0x10158b80


> GR[02] == rp = 0000000010195000
> Func: chrdev_open, Off: 0xe0, Addr: 0x10195000
...
> Parse IAOQ = 0x0000000010104404 for CPU[1]
> Func: lock_kernel, Off: 0x34, Addr: 0x10104404

I'm not sure what the issue is here.
Let me respin the patch so that I know the lock is correctly declared.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
