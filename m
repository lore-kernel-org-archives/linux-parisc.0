Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E375E484B
	for <parisc-linux@parisc-linux.org>; Thu, 23 Oct 2003 05:14:31 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1ACdQE-0008Rn-ML
	for parisc-linux@parisc-linux.org; Thu, 23 Oct 2003 12:14:30 +0100
Date: Thu, 23 Oct 2003 12:14:30 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20031023111430.GX18370@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [davem@redhat.com: reminder, do_gettimeofday() fix]
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

Not sure whether we need this or not ...

----- Forwarded message from "David S. Miller" <davem@redhat.com> -----

Date:	Thu, 23 Oct 2003 01:44:01 -0700
From:	"David S. Miller" <davem@redhat.com>
Subject: reminder, do_gettimeofday() fix
X-Mailer: Sylpheed version 0.9.7 (GTK+ 1.2.6; sparc-unknown-linux-gnu)


Just a reminder to folks that they need to check and add this
fix to their do_gettimeofday() implementation in 2.6.x if necessary.

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1347.1.16 -> 1.1347.1.17
#	include/linux/timex.h	1.8     -> 1.9    
#	       kernel/time.c	1.17    -> 1.18   
#	arch/i386/kernel/time.c	1.41    -> 1.42   
#	      kernel/timer.c	1.71    -> 1.72   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 03/10/22	akpm@osdl.org	1.1347.1.17
# [PATCH] Time precision, adjtime(x) vs. gettimeofday
# 
# From: Stephen Hemminger <shemminger@osdl.org>
# 
# The following will prevent adjtime from causing time regression.  It delays
# starting the adjtime mechanism for one tick, and keeps gettimeofday inside
# the window.
# 
# Only fixes i386, but changes to other arch would be similar.
# 
# Running a simple clock test program and playing with adjtime demonstrates
# that this fixes the problem (and 2.6.0-test6 is broken).  But given the
# fragile nature of the timer code, it should go through some more testing
# before inclusion.
# --------------------------------------------
#
diff -Nru a/arch/i386/kernel/time.c b/arch/i386/kernel/time.c
--- a/arch/i386/kernel/time.c	Thu Oct 23 00:11:17 2003
+++ b/arch/i386/kernel/time.c	Thu Oct 23 00:11:17 2003
@@ -104,6 +104,15 @@
 		lost = jiffies - wall_jiffies;
 		if (lost)
 			usec += lost * (1000000 / HZ);
+
+		/*
+		 * If time_adjust is negative then NTP is slowing the clock
+		 * so make sure not to go into next possible interval.
+		 * Better to lose some accuracy than have time go backwards..
+		 */
+		if (unlikely(time_adjust < 0) && usec > tickadj)
+			usec = tickadj;
+
 		sec = xtime.tv_sec;
 		usec += (xtime.tv_nsec / 1000);
 	} while (read_seqretry(&xtime_lock, seq));
diff -Nru a/include/linux/timex.h b/include/linux/timex.h
--- a/include/linux/timex.h	Thu Oct 23 00:11:17 2003
+++ b/include/linux/timex.h	Thu Oct 23 00:11:17 2003
@@ -302,6 +302,7 @@
 extern long time_reftime;	/* time at last adjustment (s) */
 
 extern long time_adjust;	/* The amount of adjtime left */
+extern long time_next_adjust;	/* Value for time_adjust at next tick */
 
 /* interface variables pps->timer interrupt */
 extern long pps_offset;		/* pps time offset (us) */
diff -Nru a/kernel/time.c b/kernel/time.c
--- a/kernel/time.c	Thu Oct 23 00:11:17 2003
+++ b/kernel/time.c	Thu Oct 23 00:11:17 2003
@@ -236,7 +236,7 @@
 	result = time_state;	/* mostly `TIME_OK' */
 
 	/* Save for later - semantics of adjtime is to return old value */
-	save_adjust = time_adjust;
+	save_adjust = time_next_adjust ? time_next_adjust : time_adjust;
 
 #if 0	/* STA_CLOCKERR is never set yet */
 	time_status &= ~STA_CLOCKERR;		/* reset STA_CLOCKERR */
@@ -283,7 +283,8 @@
 	    if (txc->modes & ADJ_OFFSET) {	/* values checked earlier */
 		if (txc->modes == ADJ_OFFSET_SINGLESHOT) {
 		    /* adjtime() is independent from ntp_adjtime() */
-		    time_adjust = txc->offset;
+		    if ((time_next_adjust = txc->offset) == 0)
+			 time_adjust = 0;
 		}
 		else if ( time_status & (STA_PLL | STA_PPSTIME) ) {
 		    ltemp = (time_status & (STA_PPSTIME | STA_PPSSIGNAL)) ==
diff -Nru a/kernel/timer.c b/kernel/timer.c
--- a/kernel/timer.c	Thu Oct 23 00:11:17 2003
+++ b/kernel/timer.c	Thu Oct 23 00:11:17 2003
@@ -474,6 +474,7 @@
 long time_adj;				/* tick adjust (scaled 1 / HZ)	*/
 long time_reftime;			/* time at last adjustment (s)	*/
 long time_adjust;
+long time_next_adjust;
 
 /*
  * this routine handles the overflow of the microsecond field
@@ -654,6 +655,12 @@
 	}
 	xtime.tv_nsec += delta_nsec;
 	time_interpolator_update(delta_nsec);
+
+	/* Changes by adjtime() do not take effect till next tick. */
+	if (time_next_adjust != 0) {
+		time_adjust = time_next_adjust;
+		time_next_adjust = 0;
+	}
 }
 
 /*


----- End forwarded message -----

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
