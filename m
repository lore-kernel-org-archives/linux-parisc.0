From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [patch 10/16] parisc: Replace old style lock init
Date: Sun, 8 Nov 2009 00:06:14 -0500
Message-ID: <20091108050614.GB28962@bombadil.infradead.org>
References: <20091106223547.784916750@linutronix.de> <20091106223806.803538964@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>,
	Peter Zijlstra <peterz@infradead.org>,
	Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091106223806.803538964@linutronix.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 06, 2009 at 10:41:51PM -0000, Thomas Gleixner wrote:
> SPIN_LOCK_UNLOCKED is deprecated. Init the per cpu locks at runtime
> instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: linux-parisc@vger.kernel.org

applied with one nit.

>  
> -DEFINE_SPINLOCK(smp_lock);
> -

You forgot to mention this was unused. :) Confused me for a while.

cheers, Kyle

>  volatile struct task_struct *smp_init_current_idle_task;
>  
>  /* track which CPU is booting */
> @@ -69,7 +67,7 @@ static volatile int cpu_now_booting __cp
>  
>  static int parisc_max_cpus __cpuinitdata = 1;
>  
> -DEFINE_PER_CPU(spinlock_t, ipi_lock) = SPIN_LOCK_UNLOCKED;
> +static DEFINE_PER_CPU(spinlock_t, ipi_lock);
>  
>  enum ipi_message_type {
>  	IPI_NOP=0,
> @@ -438,6 +436,11 @@ void __init smp_prepare_boot_cpu(void)
>  */
>  void __init smp_prepare_cpus(unsigned int max_cpus)
>  {
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu)
> +		spin_lock_init(&per_cpu(ipi_lock, cpu));
> +
>  	init_cpu_present(cpumask_of(0));
>  
>  	parisc_max_cpus = max_cpus;
> 
> 
> 
