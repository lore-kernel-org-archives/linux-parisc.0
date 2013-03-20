From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: PA8800 with 3.9.0-rc1-JeR-10942-g6dbe51c : WARNING: at
 lib/timerqueue.c:74
Date: Wed, 20 Mar 2013 18:27:56 +0100
Message-ID: <20130320182756.7b0e4f5d@marga.jer-c2.orkz.net>
References: <20130315152226.46ad0993@marga.jer-c2.orkz.net>
	<BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl>
	<20130318135831.7c14b6e7@marga.jer-c2.orkz.net>
	<5148E903.1020105@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5148E903.1020105@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 19 Mar 2013 23:38:59 +0100
Helge Deller <deller@gmx.de> wrote:

> Just looking at your config (which I diffed with the one I use), I
> would suggest that you play around with a few of the following
> options to narrow down the problem (ignore the +/- -> should just
> give you an idea what to change). Out of your backtrace it seems
> there is a problem with timer/SMP/locking or similiar (or just our
> old cache-problem)...

> -CONFIG_GENERIC_LOCKBREAK=y
> -CONFIG_TREE_PREEMPT_RCU=y
> -CONFIG_PREEMPT_RCU=y
> +CONFIG_TREE_RCU=y
> +# CONFIG_PREEMPT_RCU is not set
> -# CONFIG_RCU_BOOST is not set
> -CONFIG_SLUB_DEBUG=y
> -# CONFIG_COMPAT_BRK is not set
> -# CONFIG_SLAB is not set
> -CONFIG_SLUB=y
> +CONFIG_SLAB=y
> +# CONFIG_SLUB is not set
> +# CONFIG_SLOB is not set
> -CONFIG_UNINLINE_SPIN_UNLOCK=y
> -CONFIG_MUTEX_SPIN_ON_OWNER=y
> +CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
> +CONFIG_INLINE_READ_UNLOCK=y
> +CONFIG_INLINE_READ_UNLOCK_IRQ=y
> +CONFIG_INLINE_WRITE_UNLOCK=y
> +CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
> -# CONFIG_PREEMPT_NONE is not set
> +CONFIG_PREEMPT_NONE=y
> -CONFIG_PREEMPT=y
> -CONFIG_PREEMPT_COUNT=y
> +# CONFIG_PREEMPT is not set

All of the above are changed by just this change:

-# CONFIG_PREEMPT_NONE is not set
+CONFIG_PREEMPT_NONE=y
 # CONFIG_PREEMPT_VOLUNTARY is not set
-CONFIG_PREEMPT=y
-CONFIG_PREEMPT_COUNT=y
+# CONFIG_PREEMPT is not set

and yes, that makes the kernel boot properly again. I haven't tried the
third option, CONFIG_PREEMPT_VOLUNTARY.


Regards,
     jer
