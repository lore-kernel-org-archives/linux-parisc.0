Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cuprel1.hp.com (cuprel1.hp.com [156.153.254.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id 125514829
	for <parisc-linux@parisc-linux.org>; Sat, 28 Jun 2003 06:51:19 -0600 (MDT)
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by cuprel1.hp.com (Postfix) with ESMTP id AE4F18DE
	for <parisc-linux@parisc-linux.org>; Sat, 28 Jun 2003 03:20:42 -0700 (PDT)
Message-ID: <3EFD6F6D.8080403@tiscali.be>
Date: Sat, 28 Jun 2003 10:35:25 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Subject: [Fwd: Re: [parisc-linux] warning: minor abi change]
Content-Type: text/plain; charset=us-ascii; format=flowed
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


-------- Original Message --------
Subject: 	Re: [parisc-linux] warning: minor abi change
Date: 	Fri, 27 Jun 2003 09:15:46 -0600
From: 	Grant Grundler <grundler@parisc-linux.org>
To: 	Joel Soete <jsoe0708@tiscali.be>
References: 	<20030626170628.GO451@parcelfarce.linux.theplanet.co.uk> 
<3ED70CF10000AD97@ocpmta2.freegates.net>



On Fri, Jun 27, 2003 at 04:41:13PM +0200, Joel Soete wrote:
> But mainly, as promise I co 2.4.21-p0 and copare with my merge and notice
> some requested add patch:
> diff -NaurX dontdiff linux-2.4.21-pa0/drivers/ide/pci/ns87415.c linux-2.4.21-rc8-pa35/drivers/ide/pci/ns87415.c

This is for c3000/j5000/et al workstations.
NS "SuckyIO" multifunction chip includes ns87415 compatible IDE controller.

...
> +#define __save_and_cli(x)  do { __save_flags(x); __cli(); } while(0);
> +#define __save_and_sti(x)  do { __save_flags(x); __sti(); } while(0);
> +

This is something different - but I'd think this is needed too.
Make sure this isn't a merge error (ie see if it's defined elsewhere).

> btw I also test following stuff which seems to works too:
> diff -NaurX dontdiff linux-2.4.21-pa0/include/asm-parisc/system_irqsave.h.mine
> linux-2.4.21-rc8-pa35/include/asm-parisc/system_irqsave.h.mine
> --- linux-2.4.21-pa0/include/asm-parisc/system_irqsave.h.mine	1970-01-01
> 01:00:00.000000000 +0100
> +++ linux-2.4.21-rc8-pa35/include/asm-parisc/system_irqsave.h.mine	2003-06-27
> 15:50:11.000000000 +0200
> @@ -0,0 +1,21 @@
> +#ifndef __PARISC_SYSTEM_IRQSAVE_H
> +#define __PARISC_SYSTEM_IRQSAVE_H
> +
> +/* interrupt control */
> +#define __save_flags(x)	__asm__ __volatile__("ssm 0, %0" : "=r" (x) : :
> "memory")
> +#define __restore_flags(x) __asm__ __volatile__("mtsm %0" : : "r" (x) :
> "memory")
> +#define __cli()	__asm__ __volatile__("rsm %0,%%r0\n" : : "i" (PSW_I) : "memory"
> )
> +#define __sti()	__asm__ __volatile__("ssm %0,%%r0\n" : : "i" (PSW_I) : "memory"
> )
> +
> +#define __save_and_cli(x)  do { __save_flags(x); __cli(); } while(0);
> +#define __save_and_sti(x)  do { __save_flags(x); __sti(); } while(0);
> +
> +/* For spinlocks etc */
> +#define local_irq_save(x)  __save_and_cli(x)
> +#define local_irq_set(x)   __save_and_sti(x)
> +
> +#define local_irq_restore(x) __restore_flags(x)
> +#define local_irq_disable() __cli()
> +#define local_irq_enable()  __sti()
> +
> +#endif /* __PARISC_SYSTEM_IRQSAVE_H */


This looks more familiar to me..but I'd need to review the whole tree and
can't do that right now.

> +0200
> +++ linux-2.4.21-rc8-pa35/arch/parisc/kernel/processor.c	2002-12-20 15:56:19.000000000
> +0100
> @@ -77,8 +77,6 @@
>  	unsigned long txn_addr;
>  	unsigned long cpuid;
>  	struct cpuinfo_parisc *p;
> -	extern struct irq_region_ops cpu_irq_ops; /* arch/parisc...irq.c */
> -	extern struct irqaction cpu_irq_actions[]; /* arch/parisc...irq.c */


If they are no longer referenced, that's fine.
I didn't really want these published in a header file if they are still
referenced.  But it's not a big deal if they are.

...
> - Grant what do you think about this:
> 
> diff -NaurX dontdiff linux-2.4.21-pa0/drivers/sound/ad1889.c linux-2.4.21-rc8-pa35/drivers/sound/ad1889.c
> --- linux-2.4.21-pa0/drivers/sound/ad1889.c	2003-06-27 07:46:37.000000000
> +0200
> +++ linux-2.4.21-rc8-pa35/drivers/sound/ad1889.c	2003-05-08 22:43:44.000000000
...

That's fine with me.
If AD had published decent specs for this chip, we could actually
get it workng. I only hacked around on it enough to get DMA sort of
working and *some* sounds came out of it.

> - another cleanup (don't remember why :-?)
...
> Comments:
> 
> - The first changes (xxx_bad(void)) was agreed earlier by Randolph but never
> comited (?). The goal is to breack the build of the kernel and so avoid the
> risk to boot one (as I do when I test evms or [xj]fs which required __put_XXX_asm64)
> which can unexpected damages

yes - that's good

> - The second replace Randolph __put_XXX_asm64(); it does the same job and
> avoid severall warning at compile time as:

good too

I need the above changes in a format that I apply with "patch -p1 < diff"
(or -p0) if you want me to commit them.

thanks,
grant
