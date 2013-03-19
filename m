From: Helge Deller <deller@gmx.de>
Subject: Re: PA8800 with 3.9.0-rc1-JeR-10942-g6dbe51c : WARNING: at lib/timerqueue.c:74
Date: Tue, 19 Mar 2013 23:38:59 +0100
Message-ID: <5148E903.1020105@gmx.de>
References: <20130315152226.46ad0993@marga.jer-c2.orkz.net> <BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl> <20130318135831.7c14b6e7@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130318135831.7c14b6e7@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Jeroen,

On 03/18/2013 01:58 PM, Jeroen Roovers wrote:
> On Sat, 16 Mar 2013 18:34:17 -0400
> John David Anglin <dave.anglin@bell.net> wrote:
> 
>> On 15-Mar-13, at 10:22 AM, Jeroen Roovers wrote:
>>
>>> [    7.912000] WARNING: at lib/timerqueue.c:74
>>
>> Is this reproducible?  I have seen the occasional RB issue but I've
>> never been able to reproduce them.
> 
> Yes. Every time I boot this kernel with Helge's patches, built with
> the previously attached config, it trips on this very same issue.

Which patches are you referring to? All my patches are upstream in 3.9.0-rcX.

I built a kernel with your config as well, but did not ran into the issues you have.
But that's not really surprising, since I tested on a different 1-CPU machine only...

Just looking at your config (which I diffed with the one I use), I would suggest that you play around with a few of the following options to narrow down the problem (ignore the +/- -> should just give you an idea what to change).
Out of your backtrace it seems there is a problem with timer/SMP/locking or similiar (or just our old cache-problem)...

Helge

-CONFIG_GENERIC_LOCKBREAK=y
-CONFIG_TREE_PREEMPT_RCU=y
-CONFIG_PREEMPT_RCU=y
+CONFIG_TREE_RCU=y
+# CONFIG_PREEMPT_RCU is not set
-# CONFIG_RCU_BOOST is not set
-CONFIG_SLUB_DEBUG=y
-# CONFIG_COMPAT_BRK is not set
-# CONFIG_SLAB is not set
-CONFIG_SLUB=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
-CONFIG_UNINLINE_SPIN_UNLOCK=y
-CONFIG_MUTEX_SPIN_ON_OWNER=y
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
-# CONFIG_PREEMPT_NONE is not set
+CONFIG_PREEMPT_NONE=y
-CONFIG_PREEMPT=y
-CONFIG_PREEMPT_COUNT=y
+# CONFIG_PREEMPT is not set

