From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] Harmony fixes
Date: Sat, 5 Jun 2004 19:45:26 +0100
Message-ID: <20040605184526.GA1317@calypso>
References: <20040527150933.GB612@calypso>
	<20040527151731.633A93658BE@mail.esiee.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="rwEMma7ioTxnRzrJ"
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <varenet@esiee.fr>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040527151731.633A93658BE@mail.esiee.fr>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's the next set of fixes.  I should point out an annoyance with the
harmony-s16le patch though: apps that use AFMT_S16_NE are broken by this
patch, because the kernel headers incorrectly define AFMT_S16_NE as
AFMT_S16_LE, when it should be AFMT_S16_BE.

harmony-levellimit.patch:
Volume levels passed to the MIXER_WRITE ioctls are now limited to 100,
which prevents bogus levels from interferring with other mixer channels.

harmony-stereolevels.patch:
The MIXER_READ ioctls now return a right_level for the monophonic mixer
channels that is the same as the left_level.

harmony-s16le.patch:
The AFMT_S16_LE format is now rejected, just as all other unsupported
formats are rejected.  As a result, applications which write big-endian
samples with AFMT_S16_LE format set will no longer work.

Thanks,
-- 
Stuart Brady

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="harmony-levellimit.patch"

--- drivers/sound/harmony.c.orig	2004-06-04 15:02:51.000000000 +0100
+++ drivers/sound/harmony.c	2004-06-05 15:27:03.000000000 +0100
@@ -940,6 +940,8 @@
 
 	right_level = (value & 0x0000ff00) >> 8;
 	left_level = value & 0x000000ff;
+	if (right_level > 100) right_level = 100;
+	if (left_level > 100) left_level = 100;
   
 	switch (channel) {
 		case SOUND_MIXER_VOLUME:

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="harmony-stereolevels.patch"

--- drivers/sound/harmony.c.orig	2004-06-04 15:02:51.000000000 +0100
+++ drivers/sound/harmony.c	2004-06-05 15:28:17.000000000 +0100
@@ -918,7 +918,7 @@
 		case SOUND_MIXER_MONITOR:
 			left_level = (harmony.current_gain & GAIN_MA_MASK) >> GAIN_MA_SHIFT;
 			left_level = to_oss_level(MAX_MONITOR_LEVEL-left_level, MAX_MONITOR_LEVEL);
-			return left_level;
+			return (left_level << 8)+left_level;
 	}
 	return -EINVAL;
 }
@@ -967,7 +967,7 @@
 			new_left_level = to_oss_level(MAX_MONITOR_LEVEL-left_level, MAX_MONITOR_LEVEL);
 			harmony.current_gain = (harmony.current_gain & ~GAIN_MA_MASK) | (left_level << GAIN_MA_SHIFT);
 			harmony_mixer_set_gain();
-			return new_left_level;
+			return (new_left_level << 8) + new_left_level;
 	}
 
 	return -EINVAL;

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="harmony-s16le.patch"

--- drivers/sound/harmony.c.orig	2004-06-04 15:02:51.000000000 +0100
+++ drivers/sound/harmony.c	2004-06-05 15:24:31.000000000 +0100
@@ -655,18 +655,17 @@
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
@@ -674,8 +673,8 @@
 			case HARMONY_DF_16BIT_LINEAR:	ival = AFMT_U16_BE; break;
 			default: ival = 0;
 			}
+			return put_user(ival, (int *) arg);
 		}
-		return put_user(ival, (int *) arg);
 
 	case SOUND_PCM_READ_RATE:
 		ival = harmony.dac_rate;

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--rwEMma7ioTxnRzrJ--
