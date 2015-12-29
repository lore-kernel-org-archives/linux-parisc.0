From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: timerfd_settime/timerfd_gettime issue ?
Date: Tue, 29 Dec 2015 10:44:35 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1512291027570.28591@nanos>
References: <567E8766.6020707@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <567E8766.6020707@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge,

On Sat, 26 Dec 2015, Helge Deller wrote:

> I see a strange behavior on the parisc platform, for which I'm not sure if
> it's intended or if there is a bug somewhere.

> The program calls timerfd_settime() and sets a timer (e.g. sec=0, nsec=100000000).
> Directly after setting the timer it calls timerfd_gettime() and receives
> (sec=0, nsec=103914413).
> The second nsec is higher than the initial nsec value which was set.
> 
> Does timerfd_settime() maybe tries to add the initial time it takes to start
> the timer?
>
> Any idea or hint?

Yes. This is a fallout from the power aware batching magic. Interesting that
nobody noticed this within 7 years.

Does the patch below fix your issue?

Thanks,

	tglx

8<----------------

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 76dd4f0da5ca..0f4a3e8734f1 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -268,7 +268,7 @@ static inline s64 hrtimer_get_expires_ns(const struct hrtimer *timer)
 
 static inline ktime_t hrtimer_expires_remaining(const struct hrtimer *timer)
 {
-	return ktime_sub(timer->node.expires, timer->base->get_time());
+	return ktime_sub(timer->_softexpires, timer->base->get_time());
 }
 
 static inline ktime_t hrtimer_cb_get_time(struct hrtimer *timer)
