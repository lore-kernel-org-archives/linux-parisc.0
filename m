Return-Path: <sdbrady@ntlworld.com>
Received: from mta04-svc.ntlworld.com (mta04-svc.ntlworld.com [62.253.162.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4644488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 02:20:56 -0700 (MST)
Received: from calypso ([62.254.21.7]) by mta04-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040222092045.JGIZ20489.mta04-svc.ntlworld.com@calypso>
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 09:20:45 +0000
Received: from sdb by calypso with local (Exim 3.36 #1 (Debian))
	id 1AupnF-0000iw-00 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 09:20:57 +0000
Date: Sun, 22 Feb 2004 09:20:57 +0000
From: Stuart Brady <sdbrady@ntlworld.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040222092057.GA2590@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] Harmony driver - Reject AFMT_S16_LE (Little
	Endian)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

The OSS specification (http://www.opensound.com/pguide/oss.pdf -
page 33) states:

"It is very important to check that the value returned in the argument
after the [SNDCTL_DSP_SETFMT] ioctl call matches the requested format.
If the device doesn't support this particular format, it rejects the
call and returns another format that is supported by the hardware."

I would suggest the following change to the Harmony driver:

Index: harmony.c
===================================================================
RCS file: /var/cvs/linux-2.4/drivers/sound/harmony.c,v
retrieving revision 1.28
diff -u -r1.28 harmony.c
--- harmony.c	22 Jun 2002 09:05:59 -0000	1.28
+++ harmony.c	22 Feb 2004 05:35:46 -0000
@@ -641,14 +641,14 @@
 			switch (ival) {
 			case AFMT_MU_LAW:	new_format = HARMONY_DF_8BIT_ULAW; break;
 			case AFMT_A_LAW:	new_format = HARMONY_DF_8BIT_ALAW; break;
-			case AFMT_S16_LE:	/* fall through, but not really supported */
-			case AFMT_S16_BE:	new_format = HARMONY_DF_16BIT_LINEAR;
-						ival = AFMT_S16_BE;
-						break; 
+			case AFMT_S16_BE:	new_format = HARMONY_DF_16BIT_LINEAR; break;
 			default: {
 				DPRINTK(KERN_WARNING PFX 
 					"unsupported sound format 0x%04x requested.\n",
 					ival);
+				ival = AFMT_S16_BE;
+				if (put_user(ival, (int *) arg))
+					return -EFAULT;
 				return -EINVAL;
 			}
 			}

Since mu-law and a-law aren't the most popular of formats, I think
AFMT_S16_BE (signed, 16-bit, big endian) is the best thing to return.
Some drivers don't seem to return a supported format in arg - I'm not
sure why. At the very least, I think -EINVAL should be returned, and the
format should not be set. (Unless of course, the driver actually _does_
the conversion - okay if I implement this?)

This change may break some apps. The soundcard.h fix might make a
significant difference. Anything else was writing big endian data using
a little endian format.

One question: are there any audio devices for hppa that need drivers,
that have documentation? I see that audio on the J5k/C3k is unsupported,
but there are apparently no docs for it. Audio on the 705 and 710 doesn't
seem supported either. Again, no docs AFAICS.
-- 
Stuart Brady
