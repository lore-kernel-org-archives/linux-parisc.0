From: Don Zickus <dzickus@redhat.com>
Subject: Re: [patch V2 04/29] parisc: Use lockup_detector_stop()
Date: Thu, 14 Sep 2017 09:46:39 -0400
Message-ID: <20170914134639.2f2yz3o66igau6xq@redhat.com>
References: <20170912193654.321505854@linutronix.de>
 <20170912194146.407385557@linutronix.de>
 <20170914085917.GA24723@ls3530>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@alien8.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Chris Metcalf <cmetcalf@mellanox.com>,
        Ulrich Obergfell <uobergfe@redhat.com>,
        linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170914085917.GA24723@ls3530>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 14, 2017 at 10:59:17AM +0200, Helge Deller wrote:
> * Thomas Gleixner <tglx@linutronix.de>:
> > The broken lockup_detector_suspend/resume() interface is going away. Use
> > the new lockup_detector_soft_poweroff() interface to stop the watchdog from
> > the busy looping power off routine.
> > 
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Don Zickus <dzickus@redhat.com>
> > Cc: Chris Metcalf <cmetcalf@mellanox.com>
> > Cc: linux-parisc@vger.kernel.org
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Sebastian Siewior <bigeasy@linutronix.de>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Ulrich Obergfell <uobergfe@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Helge Deller <deller@gmx.de>
> > Link: http://lkml.kernel.org/r/20170831073053.281414373@linutronix.de
> > 
> > ---
> >  arch/parisc/kernel/process.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > --- a/arch/parisc/kernel/process.c
> > +++ b/arch/parisc/kernel/process.c
> > @@ -146,7 +146,7 @@ void machine_power_off(void)
> >  
> >  	/* prevent soft lockup/stalled CPU messages for endless loop. */
> >  	rcu_sysrq_start();
> > -	lockup_detector_suspend();
> > +	lockup_detector_soft_poweroff();
> >  	for (;;);
> >  }
> 
> Thomas, thanks for cleaning that up.  
> You may add to patches 03/04:
> Acked-by: Helge Deller <deller@gmx.de>
> 
> 
> On a side-note, there is sadly no general function like
> 	turn_off_all_kind_of_runtime_hang_detectors()
> which turns off *all* detectors at once (including soft lockup detector).
> I've seen another detector complaing at runtime that we were hanging
> here. I would need to dig up more info if you are interested...

There are numerous detectors I have seen over the years: rcu, clocksource,
hard/soft, hang, fs, network, wq?, etc..  I am not sure it is easy to put
them all in one place or makes sense.

I know working with the kvm folks, when they swap back in, the real clock
can do a massive jump forward and causes a flood of warnings such that they
had to 'touch' all of them before running the vm again.

Cheers,
Don
