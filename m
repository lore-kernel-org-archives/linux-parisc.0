From: Helge Deller <deller@gmx.de>
Subject: Re: timerfd_settime/timerfd_gettime issue ?
Date: Mon, 4 Jan 2016 23:27:57 +0100
Message-ID: <20160104222757.GA969@p100.box>
References: <567E8766.6020707@gmx.de>
 <alpine.DEB.2.11.1512291027570.28591@nanos>
 <5682E96A.5040008@gmx.de>
 <alpine.DEB.2.11.1512301052520.28591@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1512301052520.28591@nanos>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Thomas,

* Thomas Gleixner <tglx@linutronix.de>:
> On Tue, 29 Dec 2015, Helge Deller wrote:
> > No, the patch below doesn't help.
> > 
> > I still see:
> > [  644.916000] timerfd_settime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=100000000) 
> > [  645.024000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=103029949) 
> > 
> 
> Right. It can't help. Sorry for the distraction.
> 
> Looking deeper I found the issue. It's caused by CONFIG_TIME_LOW_RES. See the
> comment in hrtimer_start_range_ns(). We round the expiry time to the next
> jiffies period to avoid short timeouts. Assuming you are running with HZ=250
> this is exactly 4ms. So that's where your extra time comes from.

Yes, that seems right.

> Not sure what to do about that.

The patch below seems to solve the issue for me. But I'm not sure if
there might be any side-effects. What do you think? Does the patch
seems correct? It just adjusts to values returned to userspace (and thus
hides the internal roundings).

Thanks,
Helge

diff --git a/fs/timerfd.c b/fs/timerfd.c
index b94fa6c..9b6cc73 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -152,8 +152,16 @@ static ktime_t timerfd_get_remaining(struct timerfd_ctx *ctx)
 
 	if (isalarm(ctx))
 		remaining = alarm_expires_remaining(&ctx->t.alarm);
-	else
+	else {
 		remaining = hrtimer_expires_remaining(&ctx->t.tmr);
+#ifdef CONFIG_TIME_LOW_RES
+		/* Expiry time was rounded up in hrtimer_start_range_ns()
+		 * to the next jiffies period to avoid short timeouts.
+		 * Subtract it here again to avoid userspace seeing higher
+		 * values than expected. */
+		remaining.tv64 -= hrtimer_resolution;
+#endif
+	}
 
 	return remaining.tv64 < 0 ? ktime_set(0, 0): remaining;
 }
