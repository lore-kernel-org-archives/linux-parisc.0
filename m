From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] Harmony - better mixer channel names
Date: Thu, 27 May 2004 21:02:42 +0100
Message-ID: <20040527200242.GA1598@calypso>
References: <20040527150933.GB612@calypso>
	<20040527151731.633A93658BE@mail.esiee.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="n8g4imXOkfNTN/H1"
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <varenet@esiee.fr>
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


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

This patch improves the Harmony driver's naming of mixer channels:

* VOLUME is now MONITOR
* OGAIN is now VOLUME
* SPEAKER is now LINE1
* For output, LINE is now LINE2
* PHONEOUT is now LINE3
* The LINE channel is now for input only
* Within the source, the names INTERNAL, LINEOUT and HEADPHONES refer to
  LINE1, LINE2 and LINE3, respectively
* MIC and IGAIN remain unchanged

Regards,
-- 
Stuart Brady

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="harmony-mixer-channelnames.diff"

--- drivers/sound/harmony.c.orig	2004-05-25 23:21:52.000000000 +0100
+++ drivers/sound/harmony.c	2004-05-27 18:20:31.000000000 +0100
@@ -124,9 +124,17 @@
 #define GAIN_RO_MASK    ( 0x3f << GAIN_RO_SHIFT) 
 
 
-#define MAX_OUTPUT_LEVEL (GAIN_RO_MASK >> GAIN_RO_SHIFT)
-#define MAX_INPUT_LEVEL  (GAIN_RI_MASK >> GAIN_RI_SHIFT)
-#define MAX_VOLUME_LEVEL (GAIN_MA_MASK >> GAIN_MA_SHIFT)
+#define MAX_OUTPUT_LEVEL  (GAIN_RO_MASK >> GAIN_RO_SHIFT)
+#define MAX_INPUT_LEVEL   (GAIN_RI_MASK >> GAIN_RI_SHIFT)
+#define MAX_MONITOR_LEVEL (GAIN_MA_MASK >> GAIN_MA_SHIFT)
+
+#define MIXER_INTERNAL   SOUND_MIXER_LINE1
+#define MIXER_LINEOUT    SOUND_MIXER_LINE2
+#define MIXER_HEADPHONES SOUND_MIXER_LINE3
+
+#define MASK_INTERNAL   SOUND_MASK_LINE1
+#define MASK_LINEOUT    SOUND_MASK_LINE2
+#define MASK_HEADPHONES SOUND_MASK_LINE3
 
 /*
  * Channels Mask in mixer register
@@ -882,7 +890,7 @@
 	int right_level;
 
 	switch (channel) {
-		case SOUND_MIXER_OGAIN:
+		case SOUND_MIXER_VOLUME:
 			left_level  = (harmony.current_gain & GAIN_LO_MASK) >> GAIN_LO_SHIFT;
 			right_level = (harmony.current_gain & GAIN_RO_MASK) >> GAIN_RO_SHIFT;
 			left_level  = to_oss_level(MAX_OUTPUT_LEVEL - left_level, MAX_OUTPUT_LEVEL);
@@ -896,9 +904,9 @@
 			right_level= to_oss_level(right_level, MAX_INPUT_LEVEL);
 			return (right_level << 8)+left_level;
 			
-		case SOUND_MIXER_VOLUME:
+		case SOUND_MIXER_MONITOR:
 			left_level = (harmony.current_gain & GAIN_MA_MASK) >> GAIN_MA_SHIFT;
-			left_level = to_oss_level(MAX_VOLUME_LEVEL-left_level, MAX_VOLUME_LEVEL);
+			left_level = to_oss_level(MAX_MONITOR_LEVEL-left_level, MAX_MONITOR_LEVEL);
 			return left_level;
 	}
 	return -EINVAL;
@@ -923,7 +931,7 @@
 	left_level = value & 0x000000ff;
   
 	switch (channel) {
-		case SOUND_MIXER_OGAIN:
+		case SOUND_MIXER_VOLUME:
 			right_level = to_harmony_level(100-right_level, MAX_OUTPUT_LEVEL);
 			left_level  = to_harmony_level(100-left_level, MAX_OUTPUT_LEVEL);
 			new_right_level = to_oss_level(MAX_OUTPUT_LEVEL - right_level, MAX_OUTPUT_LEVEL);
@@ -943,10 +951,10 @@
 			harmony_mixer_set_gain();
 			return (new_right_level << 8) + new_left_level;
 	
-		case SOUND_MIXER_VOLUME:
-			left_level = to_harmony_level(100-left_level, MAX_VOLUME_LEVEL);
-			new_left_level = to_oss_level(MAX_VOLUME_LEVEL-left_level, MAX_VOLUME_LEVEL);
-			harmony.current_gain = (harmony.current_gain & ~GAIN_MA_MASK)| (left_level << GAIN_MA_SHIFT);
+		case SOUND_MIXER_MONITOR:
+			left_level = to_harmony_level(100-left_level, MAX_MONITOR_LEVEL);
+			new_left_level = to_oss_level(MAX_MONITOR_LEVEL-left_level, MAX_MONITOR_LEVEL);
+			harmony.current_gain = (harmony.current_gain & ~GAIN_MA_MASK) | (left_level << GAIN_MA_SHIFT);
 			harmony_mixer_set_gain();
 			return new_left_level;
 	}
@@ -1004,9 +1012,9 @@
 {
 	int outmask = 0;
 	
-	if (harmony.current_gain & GAIN_HE_MASK) outmask |=SOUND_MASK_PHONEOUT;
-	if (harmony.current_gain & GAIN_LE_MASK) outmask |=SOUND_MASK_LINE;
-	if (harmony.current_gain & GAIN_SE_MASK) outmask |=SOUND_MASK_SPEAKER;
+	if (harmony.current_gain & GAIN_SE_MASK) outmask |= MASK_INTERNAL;
+	if (harmony.current_gain & GAIN_LE_MASK) outmask |= MASK_LINEOUT;
+	if (harmony.current_gain & GAIN_HE_MASK) outmask |= MASK_HEADPHONES;
 	
 	return outmask;
 }
@@ -1014,24 +1022,24 @@
 
 static int harmony_mixer_set_outmask(int outmask)
 {
-	if (outmask & SOUND_MASK_PHONEOUT) 
-		harmony.current_gain |= GAIN_HE_MASK; 
+	if (outmask & MASK_INTERNAL) 
+		harmony.current_gain |= GAIN_SE_MASK;
 	else 
-		harmony.current_gain &= ~GAIN_HE_MASK;
+		harmony.current_gain &= ~GAIN_SE_MASK;
 	
-	if (outmask & SOUND_MASK_LINE) 
+	if (outmask & MASK_LINEOUT) 
 		harmony.current_gain |= GAIN_LE_MASK;
 	else 
 		harmony.current_gain &= ~GAIN_LE_MASK;
 	
-	if (outmask & SOUND_MASK_SPEAKER) 
-		harmony.current_gain |= GAIN_SE_MASK;
+	if (outmask & MASK_HEADPHONES) 
+		harmony.current_gain |= GAIN_HE_MASK; 
 	else 
-		harmony.current_gain &= ~GAIN_SE_MASK;
+		harmony.current_gain &= ~GAIN_HE_MASK;
 	
 	harmony_mixer_set_gain();
 
-	return (outmask & (SOUND_MASK_PHONEOUT | SOUND_MASK_LINE | SOUND_MASK_SPEAKER));
+	return (outmask & (MASK_INTERNAL | MASK_LINEOUT | MASK_HEADPHONES));
 }
 
 /*
@@ -1069,19 +1077,19 @@
 		ret = SOUND_CAP_EXCL_INPUT;
 		break;
 	case MIXER_READ(SOUND_MIXER_STEREODEVS):
-		ret = SOUND_MASK_IGAIN | SOUND_MASK_OGAIN;
+		ret = SOUND_MASK_VOLUME | SOUND_MASK_IGAIN;
 		break;
 		
 	case MIXER_READ(SOUND_MIXER_RECMASK):
 		ret = SOUND_MASK_MIC | SOUND_MASK_LINE;
 		break;
 	case MIXER_READ(SOUND_MIXER_DEVMASK):
-		ret = SOUND_MASK_OGAIN | SOUND_MASK_IGAIN |
-			SOUND_MASK_VOLUME;
+		ret = SOUND_MASK_VOLUME | SOUND_MASK_IGAIN |
+			SOUND_MASK_MONITOR;
 		break;
 	case MIXER_READ(SOUND_MIXER_OUTMASK):
-		ret = SOUND_MASK_SPEAKER | SOUND_MASK_LINE |
-			SOUND_MASK_PHONEOUT;
+		ret = MASK_INTERNAL | MASK_LINEOUT |
+			MASK_HEADPHONES;
 		break;
 		
 	case MIXER_WRITE(SOUND_MIXER_RECSRC):
@@ -1098,15 +1106,15 @@
 		ret = harmony_mixer_get_outmask();
 		break;
 	
-	case MIXER_WRITE(SOUND_MIXER_OGAIN):
-	case MIXER_WRITE(SOUND_MIXER_IGAIN):
 	case MIXER_WRITE(SOUND_MIXER_VOLUME):
+	case MIXER_WRITE(SOUND_MIXER_IGAIN):
+	case MIXER_WRITE(SOUND_MIXER_MONITOR):
 		ret = harmony_mixer_set_level(cmd & 0xff, val);
 		break;
 
-	case MIXER_READ(SOUND_MIXER_OGAIN):
-	case MIXER_READ(SOUND_MIXER_IGAIN):
 	case MIXER_READ(SOUND_MIXER_VOLUME):
+	case MIXER_READ(SOUND_MIXER_IGAIN):
+	case MIXER_READ(SOUND_MIXER_MONITOR):
 		ret = harmony_mixer_get_level(cmd & 0xff);
 		break;
 

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--n8g4imXOkfNTN/H1--
