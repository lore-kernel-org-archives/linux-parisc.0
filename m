From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: timerfd_settime/timerfd_gettime issue ?
Date: Wed, 30 Dec 2015 10:57:56 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1512301052520.28591@nanos>
References: <567E8766.6020707@gmx.de> <alpine.DEB.2.11.1512291027570.28591@nanos> <5682E96A.5040008@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5682E96A.5040008@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 29 Dec 2015, Helge Deller wrote:
> No, the patch below doesn't help.
> 
> I still see:
> [  644.916000] timerfd_settime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=100000000) 
> [  645.024000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=103029949) 
> 

Right. It can't help. Sorry for the distraction.

Looking deeper I found the issue. It's caused by CONFIG_TIME_LOW_RES. See the
comment in hrtimer_start_range_ns(). We round the expiry time to the next
jiffies period to avoid short timeouts. Assuming you are running with HZ=250
this is exactly 4ms. So that's where your extra time comes from.

Not sure what to do about that.

Thanks,

	tglx






