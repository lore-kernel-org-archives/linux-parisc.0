Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.65.60])
	by dsl2.external.hp.com (Postfix) with SMTP id A66344829
	for <parisc-linux@parisc-linux.org>; Sun, 12 Jan 2003 05:35:57 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Jan 2003 13:35:33 +0100
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	parisc-linux@parisc-linux.org,
	Linux/PPC Development <linuxppc-dev@lists.linuxppc.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>
References: <Pine.GSO.4.21.0301121214440.18673-100000@vervain.sonytel.be>
In-Reply-To: <Pine.GSO.4.21.0301121214440.18673-100000@vervain.sonytel.be>
MIME-Version: 1.0
Message-Id: <200301121333.17077.deller@gmx.de>
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_VEWI+gdsC5OAG5n"
Subject: [parisc-linux] Re: Generic RTC driver in 2.4.x
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

--Boundary-00=_VEWI+gdsC5OAG5n
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 12 January 2003 12:33, Geert Uytterhoeven wrote:
> I made some more changes afterwards:
>   - Add forward declaration for gen_rtc_interrupt()

This one should be moved inside the #ifdef CONFIG_GEN_RTC_X section to
avoid "genrtc.c:69: warning: `gen_rtc_interrupt' declared `static' but never defined"
warnings. Please see attached patch.

Or, you could just move the declaration of gen_rtc_interrupt() above the one
from genrtc_troutine(), in which case we wouldn't need the forward declaration at all.

> BTW, perhaps we should move the global RTC_* definitions in <asm/rtc.h> to
> <linux/genrtc.h>, or merge them with the ones in <linux/mc146818rtc.h> and
> move them to <linux/rtc.h>?

IMHO leaving them architecture specific in <asm/rtc.h> seems best to me, and it 
leaves the most possibilities to make them later more dependend on the hardware.

Helge


--Boundary-00=_VEWI+gdsC5OAG5n
Content-Type: text/plain;
  charset="iso-8859-1";
  name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="diff"

--- ./genrtc.c.geert	Sun Jan 12 13:16:40 2003
+++ ./genrtc.c	Sun Jan 12 13:15:18 2003
@@ -66,9 +66,6 @@
 
 static DECLARE_WAIT_QUEUE_HEAD(gen_rtc_wait);
 
-static void gen_rtc_interrupt(unsigned long arg);
-
-
 /*
  *	Bits in gen_rtc_status.
  */
@@ -99,6 +96,8 @@
 static int stop_rtc_timers;                    /* don't requeue tasks */
 static spinlock_t gen_rtc_lock = SPIN_LOCK_UNLOCKED;
 
+static void gen_rtc_interrupt(unsigned long arg);
+
 /*
  * Routine to poll RTC seconds field for change as often as posible,
  * after first RTC_UIE use timer to reduce polling

--Boundary-00=_VEWI+gdsC5OAG5n--
