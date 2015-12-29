From: Helge Deller <deller@gmx.de>
Subject: Re: timerfd_settime/timerfd_gettime issue ?
Date: Tue, 29 Dec 2015 21:13:30 +0100
Message-ID: <5682E96A.5040008@gmx.de>
References: <567E8766.6020707@gmx.de>
 <alpine.DEB.2.11.1512291027570.28591@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1512291027570.28591@nanos>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 29.12.2015 10:44, Thomas Gleixner wrote:
> On Sat, 26 Dec 2015, Helge Deller wrote:
>> I see a strange behavior on the parisc platform, for which I'm not sure if
>> it's intended or if there is a bug somewhere.
> 
>> The program calls timerfd_settime() and sets a timer (e.g. sec=0, nsec=100000000).
>> Directly after setting the timer it calls timerfd_gettime() and receives
>> (sec=0, nsec=103914413).
>> The second nsec is higher than the initial nsec value which was set.
>>
>> Does timerfd_settime() maybe tries to add the initial time it takes to start
>> the timer?
>>
>> Any idea or hint?
> 
> Yes. This is a fallout from the power aware batching magic. Interesting that
> nobody noticed this within 7 years.
> 
> Does the patch below fix your issue?

No, the patch below doesn't help.

I still see:
[  644.916000] timerfd_settime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=100000000) 
[  645.024000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=103029949) 

Helge


> diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
> index 76dd4f0da5ca..0f4a3e8734f1 100644
> --- a/include/linux/hrtimer.h
> +++ b/include/linux/hrtimer.h
> @@ -268,7 +268,7 @@ static inline s64 hrtimer_get_expires_ns(const struct hrtimer *timer)
>  
>  static inline ktime_t hrtimer_expires_remaining(const struct hrtimer *timer)
>  {
> -	return ktime_sub(timer->node.expires, timer->base->get_time());
> +	return ktime_sub(timer->_softexpires, timer->base->get_time());
>  }
>  
>  static inline ktime_t hrtimer_cb_get_time(struct hrtimer *timer)

