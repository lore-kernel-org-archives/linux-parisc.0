Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD95016E2.dip.t-dialin.net [217.80.22.226])
	by dsl2.external.hp.com (Postfix) with SMTP id 9851B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 17:20:41 -0600 (MDT)
Sender: andi@dsl2.external.hp.com
Message-ID: <3B96B360.33152CC7@fischlustig.de>
Date: Thu, 06 Sep 2001 01:21:04 +0200
From: Andi <andi@fischlustig.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------06DE913B762D92F32A78B84E"
Subject: [parisc-linux] [PATCH] harmony audio driver
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------06DE913B762D92F32A78B84E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

hi,

I implemented SNDCTL_DSP_CHANNELS in harmony.c, which is used to query
or set the number of sound channels. This allows some sound apps to run
that used to quit with an error.

I also added SNDCTL_DSP_SYNC that only returns 0 at the moment. This is
needed since neary all sound apps call this during initialization.

The sound driver however is still broken, the only program I know that
works 100% correctly is xmms. Maybe I will do some bug fixing later if
anyone is interested.

PS: is there a working patch to get keyboard running again on 712, it is
broken for months (since kernels after 2.4.0-paXX)

bye
   andi


--------------06DE913B762D92F32A78B84E
Content-Type: text/plain; charset=us-ascii;
 name="harmony.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="harmony.patch"

--- harmony.c	2001/08/19 15:21:11	1.13
+++ harmony.c	2001/09/05 23:07:13
@@ -680,6 +680,24 @@
 		harmony_set_rate(harmony_detect_rate(ival));
 		return put_user(ival, (int*) arg);
 
+	case SNDCTL_DSP_CHANNELS:
+		if (get_user(ival, (int *) arg))
+			return -EFAULT;
+		
+		if (ival > 0) {
+			if (ival == 1)
+				harmony_set_stereo(HARMONY_SS_MONO);
+			else
+				harmony_set_stereo(HARMONY_SS_STEREO);													
+		}
+
+		if (harmony.stereo_select == HARMONY_SS_STEREO)
+			ival = 2;
+		else
+			ival = 1;
+
+		return put_user(ival, (int *) arg);			
+			
 	case SNDCTL_DSP_STEREO:		/* _SIOWR('P', 3, int) */
 		if (get_user(ival, (int *) arg))
 			return -EFAULT;
@@ -693,6 +711,9 @@
 		return put_user(ival, (int *) arg);
 		
 	case SNDCTL_DSP_RESET:
+		return 0;
+	
+	case SNDCTL_DSP_SYNC:
 		return 0;
 
 	case SNDCTL_DSP_SETFMT:		/* _SIOWR('P',5, int) */

--------------06DE913B762D92F32A78B84E--
