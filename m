From: Helge Deller <deller@gmx.de>
Subject: Re: [patch V2 04/29] parisc: Use lockup_detector_stop()
Date: Thu, 14 Sep 2017 10:59:17 +0200
Message-ID: <20170914085917.GA24723@ls3530>
References: <20170912193654.321505854@linutronix.de>
 <20170912194146.407385557@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@alien8.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Don Zickus <dzickus@redhat.com>,
        Chris Metcalf <cmetcalf@mellanox.com>,
        Ulrich Obergfell <uobergfe@redhat.com>,
        linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
To: Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170912194146.407385557@linutronix.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Thomas Gleixner <tglx@linutronix.de>:
> The broken lockup_detector_suspend/resume() interface is going away. Use
> the new lockup_detector_soft_poweroff() interface to stop the watchdog from
> the busy looping power off routine.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Don Zickus <dzickus@redhat.com>
> Cc: Chris Metcalf <cmetcalf@mellanox.com>
> Cc: linux-parisc@vger.kernel.org
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Sebastian Siewior <bigeasy@linutronix.de>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Ulrich Obergfell <uobergfe@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Helge Deller <deller@gmx.de>
> Link: http://lkml.kernel.org/r/20170831073053.281414373@linutronix.de
> 
> ---
>  arch/parisc/kernel/process.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -146,7 +146,7 @@ void machine_power_off(void)
>  
>  	/* prevent soft lockup/stalled CPU messages for endless loop. */
>  	rcu_sysrq_start();
> -	lockup_detector_suspend();
> +	lockup_detector_soft_poweroff();
>  	for (;;);
>  }

Thomas, thanks for cleaning that up.  
You may add to patches 03/04:
Acked-by: Helge Deller <deller@gmx.de>


On a side-note, there is sadly no general function like
	turn_off_all_kind_of_runtime_hang_detectors()
which turns off *all* detectors at once (including soft lockup detector).
I've seen another detector complaing at runtime that we were hanging
here. I would need to dig up more info if you are interested...

Helge
