Return-Path: <sdbrady@ntlworld.com>
Received: from mta07-svc.ntlworld.com (mta07-svc.ntlworld.com [62.253.162.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83FED4854
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 20:56:02 -0700 (MST)
Received: from calypso ([62.254.21.7]) by mta07-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040223035603.DXIN10961.mta07-svc.ntlworld.com@calypso>
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 23 Feb 2004 03:56:03 +0000
Received: from sdb by calypso with local (Exim 3.36 #1 (Debian))
	id 1Av7CL-0000Jo-00 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 23 Feb 2004 03:56:01 +0000
Date: Mon, 23 Feb 2004 03:56:01 +0000
From: Stuart Brady <sdbrady@ntlworld.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040223035601.GA988@calypso>
References: <20040222092057.GA2590@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040222092057.GA2590@calypso>
Sender: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] Harmony driver - Reject AFMT_S16_LE &
	Implement SNDCTL_DSP_CHANNELS
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Feb 22, 2004 at 09:20:57AM +0000, Stuart Brady wrote:

> +				if (put_user(ival, (int *) arg))
> +					return -EFAULT;

I've been looking at the specification, I think this should have been:

return put_user(ival, (int *) arg));

I assumed that -EINVAL would be returned, but the example shows the
argument being changed, without the ioctl returning an error. I'm still
not sure whether "harmony_set_format(HARMONY_DF_16BIT_LINEAR)" is needed
when an unsupported format is requested.  The specification is not clear
to me. "Rejects" implies "does not set the format" to me.

I'm going to have to get a firm idea of what each driver currently does
(since they tend to do different things anyway), what the apps want, and
what the documentation states.

I've also added a SNDCTL_DSP_CHANNELS (needed for mikmod). Here is the
revised patch:

Index: harmony.c
===================================================================
RCS file: /var/cvs/linux-2.4/drivers/sound/harmony.c,v
retrieving revision 1.28
diff -u -r1.28 harmony.c
--- harmony.c	22 Jun 2002 09:05:59 -0000	1.28
+++ harmony.c	23 Feb 2004 03:28:38 -0000
@@ -641,18 +641,17 @@
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
-				return -EINVAL;
+				ival = AFMT_S16_BE;
+				return put_user(ival, (int *) arg);
 			}
 			}
 			harmony_set_format(new_format);
+			return 0;
 		} else {
 			switch (harmony.data_format) {
 			case HARMONY_DF_8BIT_ULAW:	ival = AFMT_MU_LAW; break;
@@ -660,8 +659,8 @@
 			case HARMONY_DF_16BIT_LINEAR:	ival = AFMT_U16_BE; break;
 			default: ival = 0;
 			}
+			return put_user(ival, (int *) arg);
 		}
-		return put_user(ival, (int *) arg);
 
 	case SOUND_PCM_READ_RATE:
 		ival = harmony.dac_rate;
@@ -680,7 +679,17 @@
 		if (ival != 0 && ival != 1)
 			return -EINVAL;
 		harmony_set_stereo(ival);
-		return put_user(ival, (int *) arg);
+		return 0;
+
+	case SNDCTL_DSP_CHANNELS:
+		if (get_user(ival, (int *) arg))
+			return -EFAULT;
+		if (ival != 1 && ival != 2) {
+			ival = harmony.stereo_select == HARMONY_SS_MONO ? 1 : 2;
+			return put_user(ival, (int *) arg);
+		}
+		harmony_set_stereo(ival-1);
+		return 0;
 
 	case SNDCTL_DSP_GETBLKSIZE:
 		ival = HARMONY_BUF_SIZE;

Mikmod now plays audio, but it says "Loading" at the top and you can't
do anything in the UI. I'll look into this after I've fixed the mixer.
The internal speaker, headphones, and rear jack don't seem to fit well
with the existing mixer channels in OSS. Any recommendations?

I'm not sure how SOUND_PCM_WRITE_CHANNELS and SOUND_PCM_READ_CHANNELS
are handled. Looks like they're the same ioctl. How does that work?!
-- 
Stuart Brady
