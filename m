Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04753
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 Jan 2001 18:25:04 -0700
Received: from pc5158a.esiee.fr (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id 36DA9D1585
	for <parisc-linux@thepuffingroup.com>; Sat, 20 Jan 2001 02:28:49 +0100 (CET)
Received: from localhost
	([127.0.0.1] helo=esiee.fr ident=delahaym)
	by pc5158a.esiee.fr with esmtp (Exim 3.12 #1 (Debian))
	id 14Jmpl-0002bC-00
	for <parisc-linux@thepuffingroup.com>; Sat, 20 Jan 2001 02:28:49 +0100
Sender: delahaym@esiee.fr
Message-ID: <3A68E9CC.CA093CB@esiee.fr>
Date: Sat, 20 Jan 2001 02:28:45 +0100
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------4695CB23E470794E9F8738B7"
Subject: [parisc-linux] File formats auto-detection by Lasi Harmony
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------4695CB23E470794E9F8738B7
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

The patch above permits harmony driver to auto-detect file format
when the application, which access to /dev/audio, doesn't set the
output settings itself via ioctl() before starting playing.

Formats recognized are:
8 bits u-law
8 bits A-law
16 bits linear

Into these patch, I included again the sound mixer to make it work
on a clean CVS image.

Any feedbacks would be appreciated;
Regards

Matthieu Delahaye
ESIEE Team
http://www.esiee.fr/puffin


--------------4695CB23E470794E9F8738B7
Content-Type: text/plain; charset=us-ascii;
 name="harmony.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="harmony.diff"

diff -Nru linux.original/drivers/sound/Makefile linux/drivers/sound/Makefile
--- linux.original/drivers/sound/Makefile	Tue Jan 16 21:31:10 2001
+++ linux/drivers/sound/Makefile	Sat Jan 20 01:29:47 2001
@@ -108,7 +108,7 @@
 # Declare multi-part drivers.
 
 list-multi	:= sound.o gus.o pas2.o sb.o sb_lib.o vidc_mod.o \
-    soundcore.o wavefront.o
+    soundcore.o wavefront.o harmony.o
 
 sound-objs	:= 							\
     dev_table.o soundcard.o sound_syms.o		\
@@ -124,6 +124,7 @@
 sb_lib-objs	:= sb_common.o sb_audio.o sb_midi.o sb_mixer.o sb_ess.o
 vidc_mod-objs	:= vidc.o vidc_fill.o
 wavefront-objs  := wavfront.o wf_midi.o yss225.o
+harmony-objs    := harmony_driver.o harmony_sound.o harmony_mixer.o
 
 
 # Extract lists of the multi-part drivers.
@@ -189,6 +190,9 @@
 wavefront.o: $(wavefront-objs)
 	$(LD) -r -o $@ $(wavefront-objs)
 
+harmony.o: $(harmony-objs)
+	$(LD) -r -o $@ $(harmony-objs.o)
+
 # Firmware files that need translation
 #
 # The translated files are protected by a file that keeps track
@@ -332,3 +336,8 @@
 ifneq ($(FILES_BOOT_CHANGED),)
 $(FILES_BOOT_CHANGED): dummy
 endif
+
+
+
+
+
diff -Nru linux.original/drivers/sound/harmony.h linux/drivers/sound/harmony.h
--- linux.original/drivers/sound/harmony.h	Thu Jan  1 01:00:00 1970
+++ linux/drivers/sound/harmony.h	Sat Jan 20 01:29:47 2001
@@ -0,0 +1,161 @@
+/* 
+   drivers/sound/harmony.h
+
+   These declarations come from original file
+   harmony.c written by Alex deVries.
+
+   Added Magics numbers for format file auto-detection.
+   Corrected HARMONY_SS_MONO and HARMONY_SS_STEREO to
+   their right values.
+
+                     Matthieu Delahaye <delahaym@esiee.fr>, 2001
+
+*/
+
+
+#ifndef _HARMONY_H
+#define _HARMONY_H
+#include <linux/config.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/malloc.h>
+#include <linux/types.h>
+#include <linux/mm.h>
+#include <asm/gsc.h>
+
+#include <asm/pgalloc.h>
+#include <asm/pdc.h>
+#include <asm/page.h>
+#include <asm/segment.h>
+#include <asm/system.h>
+#include <asm/io.h>
+#include <asm/hardware.h>
+
+#include <asm/irq.h>            /* for "gsc" irq functions */
+#include <asm/gsc.h>
+
+#include "sound_config.h"
+#define MAX_BUFS 3
+
+#define CNTL_C		0x80000000
+#define	CNTL_ST		0x00000020
+#define CNTL_44100	0x00000015
+#define CNTL_8000	0x00000008
+
+#define GAINCTL_HE	0x08000000
+#define GAINCTL_LE	0x04000000
+#define GAINCTL_SE	0x02000000
+
+#define DSTATUS_PN	0x00000200
+#define DSTATUS_RN	0x00000002
+
+#define DSTATUS_IE	0x80000000
+
+#define HARMONY_DF_16BIT_LINEAR	0
+#define HARMONY_DF_8BIT_ULAW	1
+#define HARMONY_DF_8BIT_ALAW	2
+
+#define HARMONY_SS_MONO 0
+#define HARMONY_SS_STEREO 1
+
+#define HARMONY_SR_8KHZ 0x08
+#define HARMONY_SR_16KHZ 0x09
+#define HARMONY_SR_27KHZ 0x0A
+#define HARMONY_SR_32KHZ 0x0B
+#define HARMONY_SR_48KHZ 0x0E
+#define HARMONY_SR_9KHZ 0x0F
+#define HARMONY_SR_5KHZ 0x10
+#define HARMONY_SR_11KHZ 0x11
+#define HARMONY_SR_18KHZ 0x12
+#define HARMONY_SR_22KHZ 0x13
+#define HARMONY_SR_37KHZ 0x14
+#define HARMONY_SR_44KHZ 0x15
+#define HARMONY_SR_33KHZ 0x16
+#define HARMONY_SR_6KHZ 0x17
+
+#define HARMONY_BUF_NONE	-1
+#define HARMONY_BUF_EMPTY	0
+#define HARMONY_BUF_FILLED	1
+#define HARMONY_BUF_READY_TO_PLAY	2
+#define HARMONY_BUF_PLAYING	3
+
+
+/* Some magics numbers used to auto-detect file formats */
+
+#define HARMONY_MAGIC_8B_ULAW 1
+#define HARMONY_MAGIC_8B_ALAW 27
+#define HARMONY_MAGIC_16B_LINEAR 3
+#define HARMONY_MAGIC_MONO 1
+#define HARMONY_MAGIC_STEREO 2
+
+struct harmony_hpa {
+	u8	unused000;
+	u8	id;
+	u8	teleshare_id;
+	u8	unused003;
+	u32	reset;
+	u32	cntl;
+	u32	gainctl;
+	u32	pnxtadd;
+	u32	pcuradd;
+	u32	rnxtadd;
+	u32	rcuradd;
+	u32	dstatus;
+	u32	ov;
+	u32	pio;
+	u32	unused02c;
+	u32	unused030[3];
+	u32	diag;
+};
+
+#define dma_consistent 0
+
+#define  CHECK_WBACK(addr,len) \
+        do { if (!dma_consistent) dma_cache_wback((unsigned long)addr,len); } while (0) 
+#define  CHECK_INV(addr,len) \
+        do { if (!dma_consistent) dma_cache_inv((unsigned long)addr,len); } while(0)
+
+#define  CHECK_WBACK_INV(addr,len) \
+        do { if (!dma_consistent) dma_cache_wback_inv((unsigned long)addr,len); } while (0) 
+
+struct harmony_dev {
+	int irq;
+	int frames_so_far;
+	struct harmony_hpa  *hpa;
+	int done;
+	int buf_state[MAX_BUFS+1];
+	u32 current_gain;
+	u8 data_format;
+	u8 sample_rate;
+	u8 stereo_select;  /* 1 = stereo, 0 = mono */
+	/* outstanding_buffers is a count that ensures that the number
+	   of recorded frames is the same as the number of played frames. 
+	   In the stable situation, this number is zero.  You should never
+	   disable interrupts until this is zero. */
+	int outstanding_buffers; 
+	int format_initialized;
+	
+};
+
+int harmony_mixer_init(struct harmony_dev *);
+int harmony_audio_init(struct harmony_dev *);
+
+
+
+
+#endif _HARMONY_H
+
+
+
+
+
+
+
+
+
+
+
+
diff -Nru linux.original/drivers/sound/harmony_driver.c linux/drivers/sound/harmony_driver.c
--- linux.original/drivers/sound/harmony_driver.c	Thu Jan  1 01:00:00 1970
+++ linux/drivers/sound/harmony_driver.c	Sat Jan 20 01:29:46 2001
@@ -0,0 +1,183 @@
+/* 
+
+ 	drivers/sound/harmony.c 
+
+	This is a sound driver for Lasi's Harmony sound chip.  This is
+	unlikely to be used for anything other than a PA-RISC.
+
+	Harmony is found in HP 712s, 715/new, and many other GSC based machines. 
+Copyright 2000 (c) Linuxcare Canada, Alex deVries <alex@linuxcare.com>
+
+Bugs:
+
+1. Doesn't work on 715/old
+
+This driver doesn't work on 715/old machines, which include the 715/75.  The
+chip used for this is technically called 'Vivace', which is identical to 
+Harmony.  Should be easy to fix.  It has something to do with the way it is
+reported by the inventory code.  The HPA is not that of Lasi or ASP so the
+interrupts aren't registered properly.
+
+3. gain control ioctls are missing
+4. recording is missing
+
+5. Buffer handling code
+
+The three buffer system should probably be changed to use N buffers, so we 
+can load the buffers into memory and then exit.  Shouldn't be too hard, and 
+the performance will be a lot nicer.
+
+6. Clicks at start and finish
+
+I'm not sure why, but somehow I've introduced two clicks at the start and
+two clicks at the finish of each playing.  Shouldn't be too hard to track down.
+
+
+About the rotating buffer
+-------------------------
+
+I'm going to explain how the rotating buffer thing works because I had a hard
+time figuring it out for myself.
+
+At any given time, harmony uses two different buffers.  One is the frame
+that is currently playing, another is the frame that is ready to be played.
+
+Obviously you can't be writing into either of these frames while the chip
+is playing, or you'll hear clicks, pops and out of order frames.  One weekend
+of listening to RMS sing The Free Software Song out of order is a good way to 
+drive this point home.
+
+So, we use a total of three frames.  One is in PLAYING mode, one is is 
+READY_TO_PLAY mode, and the third is either LOADED or EMPTY.  All buffers
+start up by being EMTPY.  When harmony_audio_write loads up two frames,
+interrupts are started and the loop starts.  The ISR pops in the first frame,
+marking it as PLAYING.  The ISR will get called again, and the second 
+frame will be loaded and marked as READY_TO_PLAY.  When the first frame is
+done, the ISR will be called again; frame one is marked as EMPTY to reload,
+frame two is marked PLAYING, frame three is marked READY_TO_PLAY.
+
+All the while, harmony_audio_write is looking for frames marked EMPTY, and
+filling them and marking them LOADED.
+
+Yes, this does actually work.
+
+Let me save you an entire Thursday of listening to "orvalds Linus Linux, I 
+prounouce as Linus This is" by giving you this rotating buffer code.
+
+*/
+
+
+
+/* 
+   The source code is splitted into two new files:
+   harmony_driver.c about hardware detectetion and
+   harmony_sound.c which manage /dev/dsp
+   
+   A new file, harmony_mixer.c, manage /dev/mixer.
+
+                          Matthieu Delahaye <delahaym@esiee.fr>, 2001
+*/
+
+
+
+
+#include "harmony.h"
+
+
+
+
+static struct harmony_dev harmony;
+static int harmony_driver_callback(struct hp_device *d, struct pa_iodc_driver *dri);
+
+
+/* This is the PDC signature to load up the driver. */
+
+static struct pa_iodc_driver harmony_drivers_for[] = {
+
+	{HPHW_FIO, 0x01B, 0, 0x0007B, 0x0, 0x0, 
+		DRIVER_CHECK_HWTYPE + DRIVER_CHECK_SVERSION,
+		"Lasi Harmony", "Harmony", (void *) harmony_driver_callback},
+	{0,0,0,0,0,0,0,
+	(char *) NULL,(char *) NULL,(void *) NULL}
+};
+
+
+void __init 
+register_harmony_drivers(void)
+{
+        register_driver(harmony_drivers_for);
+}
+
+/* This is the callback that's called by the inventory hardware code if
+it finds a match to the registered driver. */
+
+
+static int 
+harmony_driver_callback(struct hp_device *d, struct pa_iodc_driver *dri)
+{
+	
+	u8	id;
+	u8	rev;
+	u32	cntl;
+	int ret;
+
+	/* Set the HPA of harmony */
+
+	harmony.hpa = d->hpa;
+
+	/* Grab an IRQ from Lasi */
+	harmony.irq = busdevice_alloc_irq(d);
+
+	if (!harmony.irq) {
+		printk(KERN_ERR "Harmony: problem getting irq\n");
+		return -1;
+	}
+
+	request_region(&harmony, 13, "harmony");
+
+	/* Grab the ID and revision from the device */
+	id = gsc_readb((void *) &(harmony.hpa->id));
+
+	if((id | 1) != 0x15) {
+		printk(KERN_WARNING "harmony_init: wrong id %02x\n", id);
+		return -EBUSY;
+	}
+	cntl = gsc_readl(&harmony.hpa->cntl);
+	rev = ((cntl>>20)&0xff);
+
+        printk(KERN_INFO "Lasi Harmony Audio rev. %i at 0x%x, using IRQ %i\n",rev,(unsigned int) d->hpa,harmony.irq);
+
+
+
+	
+	
+	
+	/* Make sure the control bit isn't set, although I don't think it 
+	   ever is. */
+
+	if(cntl & CNTL_C) {
+		printk(KERN_WARNING "harmony_init: CNTL busy\n");
+		return -EBUSY;
+	}
+
+	/* Initialize /dev/mixer and /dev/audio  */
+
+
+	if((ret=harmony_mixer_init(&harmony))) return ret;
+	if((ret=harmony_audio_init(&harmony))) return ret;
+
+
+	return 0;
+}
+
+
+
+
+
+
+
+
+
+
+
+
diff -Nru linux.original/drivers/sound/harmony_mixer.c linux/drivers/sound/harmony_mixer.c
--- linux.original/drivers/sound/harmony_mixer.c	Thu Jan  1 01:00:00 1970
+++ linux/drivers/sound/harmony_mixer.c	Sat Jan 20 01:29:46 2001
@@ -0,0 +1,319 @@
+/*
+ * sound/harmony_mixer.c
+ *
+ * The low level mixer driver for the Harmony card.
+ */
+
+/*
+ *  function ioctl inspired from file sb_mixer.c
+ *           Matthieu Delahaye <delahaym@esiee.fr>, 2001
+ */
+
+#include "sound_config.h"
+
+#include "harmony.h"
+#include "harmony_mixer.h"
+
+
+struct harmony_dev * harmony_mixer;
+
+
+/*
+ * This is the only place where the gainctl is written
+ */
+
+static void harmony_mixer_set_gain(void)
+{
+	int cntl;
+	while((cntl = gsc_readl(&harmony_mixer->hpa->cntl)) & CNTL_C);
+#if 0
+	printk(KERN_INFO "Harmony gain is now %x\n",harmony_mixer->current_gain);
+#endif
+	gsc_writel(harmony_mixer->current_gain, &harmony_mixer->hpa->gainctl);
+	while((cntl = gsc_readl(&harmony_mixer->hpa->cntl)) & CNTL_C);
+  
+}
+
+
+/* 
+ *  Read gain of selected channel.
+ *  The OSS rate is from 0 (silent) to 100 -> need some conversions
+ *
+ *  The harmony gain are attenuation for output and monitor gain.
+ *                   is amplifaction for input gain
+ */
+#define to_harmony_level(level,max) (level)*max/100 
+#define to_oss_level(level,max) (level)*100/max;
+
+static int harmony_mixer_get_level(int channel)
+{
+	int left_level;
+	int right_level;
+
+	if(channel == SOUND_MIXER_OGAIN) {
+		left_level=(harmony_mixer->current_gain & GAIN_LO_MASK) >> GAIN_LO_SHIFT;
+		right_level=(harmony_mixer->current_gain & GAIN_RO_MASK) >> GAIN_RO_SHIFT;
+		left_level=to_oss_level(MAX_OUTPUT_LEVEL - left_level,MAX_OUTPUT_LEVEL);
+		right_level=to_oss_level(MAX_OUTPUT_LEVEL - right_level,MAX_OUTPUT_LEVEL);
+		return (right_level << 8)+left_level;
+	}
+	if(channel == SOUND_MIXER_IGAIN) {
+		left_level=(harmony_mixer->current_gain & GAIN_LI_MASK) >> GAIN_LI_SHIFT;
+		right_level=(harmony_mixer->current_gain & GAIN_RI_MASK) >> GAIN_RI_SHIFT;
+		left_level=to_oss_level(left_level,MAX_INPUT_LEVEL);
+		right_level=to_oss_level(right_level,MAX_INPUT_LEVEL);
+		return (right_level << 8)+left_level;
+	}
+	if(channel == SOUND_MIXER_VOLUME) {
+		left_level=(harmony_mixer->current_gain & GAIN_MA_MASK) >> GAIN_MA_SHIFT;
+		left_level=to_oss_level(MAX_VOLUME_LEVEL-left_level,MAX_VOLUME_LEVEL);
+		return left_level;
+	}
+	return -EINVAL;
+}
+
+
+/*
+ * Some conversions for the same reasons.
+ * We give back the new real value(s) due to
+ * the rescale.
+ */
+
+static int harmony_mixer_set_level(int channel, int value)
+{
+	int left_level;
+	int right_level;
+	int new_left_level;
+	int new_right_level;
+
+	right_level=(value & 0x0000ff00) >> 8;
+	left_level=value & 0x000000ff;
+  
+	if(channel == SOUND_MIXER_OGAIN) {
+		right_level=to_harmony_level(100-right_level,MAX_OUTPUT_LEVEL);
+		left_level=to_harmony_level(100-left_level,MAX_OUTPUT_LEVEL);
+		new_right_level=to_oss_level(MAX_OUTPUT_LEVEL - right_level,MAX_OUTPUT_LEVEL);
+		new_left_level=to_oss_level(MAX_OUTPUT_LEVEL - left_level,MAX_OUTPUT_LEVEL);
+		harmony_mixer->current_gain=(harmony_mixer->current_gain & ~(GAIN_LO_MASK | GAIN_RO_MASK)) | (left_level << GAIN_LO_SHIFT) | (right_level << GAIN_RO_SHIFT);
+		harmony_mixer_set_gain();
+		return (new_right_level << 8) + new_left_level;		
+	}
+	if(channel == SOUND_MIXER_IGAIN) {
+      
+		right_level=to_harmony_level(right_level,MAX_INPUT_LEVEL);
+		left_level=to_harmony_level(left_level,MAX_INPUT_LEVEL);
+		new_right_level=to_oss_level(right_level,MAX_INPUT_LEVEL);
+		new_left_level=to_oss_level(left_level,MAX_INPUT_LEVEL);
+		harmony_mixer->current_gain=(harmony_mixer->current_gain & ~(GAIN_LI_MASK | GAIN_RI_MASK)) | (left_level << GAIN_LI_SHIFT) | (right_level << GAIN_RI_SHIFT);
+		harmony_mixer_set_gain();
+		return (new_right_level << 8) + new_left_level;
+		
+	}
+	if(channel == SOUND_MIXER_VOLUME) {
+		
+		left_level=to_harmony_level(100-left_level,MAX_VOLUME_LEVEL);
+		new_left_level=to_oss_level(MAX_VOLUME_LEVEL-left_level,MAX_VOLUME_LEVEL);
+		harmony_mixer->current_gain=(harmony_mixer->current_gain & ~GAIN_MA_MASK)| (left_level << GAIN_MA_SHIFT);
+		harmony_mixer_set_gain();
+		return new_left_level;
+	}
+
+	return -EINVAL;
+}
+
+
+/* 
+ * Return the selected input device (mic or line)
+ */
+
+static int harmony_mixer_get_recmask(void) 
+{
+	int current_input_line;
+	
+	current_input_line=(harmony_mixer->current_gain & GAIN_IS_MASK) >> GAIN_IS_SHIFT;
+	if(current_input_line) return SOUND_MASK_MIC;
+	else return SOUND_MASK_LINE;
+}
+
+/*
+ * Set the input (only one at time, arbitrary priority to line in)
+ */
+
+static int harmony_mixer_set_recmask(int recmask)
+{
+	int new_input_line;
+	int new_input_mask;
+
+	if((recmask & SOUND_MASK_LINE)) {
+		new_input_line=0;
+		new_input_mask=SOUND_MASK_LINE;
+	} else  {
+		new_input_line=1;
+		new_input_mask=SOUND_MASK_MIC;
+	}
+	harmony_mixer->current_gain=((harmony_mixer->current_gain & ~GAIN_IS_MASK) | (new_input_line << GAIN_IS_SHIFT ));
+	harmony_mixer_set_gain();
+	return new_input_mask;
+}
+
+
+/* 
+ * give the active outlines
+ */
+
+static int harmony_mixer_get_outmask(void)
+{
+	int outmask;
+	
+	outmask=0;
+	
+	if(harmony_mixer->current_gain & GAIN_HE_MASK) outmask |=SOUND_MASK_PHONEOUT;
+	if(harmony_mixer->current_gain & GAIN_LE_MASK) outmask |=SOUND_MASK_LINE;
+	if(harmony_mixer->current_gain & GAIN_SE_MASK) outmask |=SOUND_MASK_SPEAKER;
+	return outmask;
+}
+
+
+
+static int harmony_mixer_set_outmask(int outmask)
+{
+	if(outmask & SOUND_MASK_PHONEOUT) 
+		harmony_mixer->current_gain|=GAIN_HE_MASK; 
+	else harmony_mixer->current_gain&=~GAIN_HE_MASK;
+	if(outmask & SOUND_MASK_LINE) harmony_mixer->current_gain|=GAIN_LE_MASK;
+	else harmony_mixer->current_gain&=~GAIN_LE_MASK;
+	if(outmask & SOUND_MASK_SPEAKER) harmony_mixer->current_gain|=GAIN_SE_MASK;
+	else harmony_mixer->current_gain&=~GAIN_SE_MASK;
+	harmony_mixer_set_gain();
+	return (outmask & (SOUND_MASK_PHONEOUT | SOUND_MASK_LINE | SOUND_MASK_SPEAKER));
+
+}
+
+/*
+ * This code is inspired from sb_mixer.c
+ * It determins actions selected by application
+ */
+
+int harmony_mixer_ioctl(struct inode * inode, struct file * file, unsigned int cmd, unsigned long arg)
+{
+	int val;
+	int ret;
+
+	if (((cmd >> 8) & 0xff) == 'M') {
+		if (_SIOC_DIR(cmd) & _SIOC_WRITE) {
+			if (get_user(val, (int *)arg)) return -EFAULT;
+     
+			switch (cmd & 0xff) {
+			case SOUND_MIXER_RECSRC:
+				ret = harmony_mixer_set_recmask(val);
+				break;
+				
+			case SOUND_MIXER_OUTSRC:
+				ret = harmony_mixer_set_outmask(val);
+				break;
+				
+			default:
+				ret = harmony_mixer_set_level(cmd & 0xff, val);
+			}
+		} else {
+	  
+			switch (cmd & 0xff) {
+				
+			case SOUND_MIXER_RECSRC:
+				ret = harmony_mixer_get_recmask();
+				break;
+				
+			case SOUND_MIXER_OUTSRC:
+				ret = harmony_mixer_get_outmask();
+				break;
+				
+			case SOUND_MIXER_DEVMASK:
+				ret = HARMONY_MIXER_DEVICES;
+				break;
+	      
+			case SOUND_MIXER_STEREODEVS:
+				ret = HARMONY_STEREO_DEVICES;
+				break;
+	      
+			case SOUND_MIXER_RECMASK:
+				ret = HARMONY_RECORDING_DEVICES;
+				break;
+	      
+			case SOUND_MIXER_OUTMASK:
+				ret = HARMONY_OUTPUT_DEVICES;
+				break;
+				
+			case SOUND_MIXER_CAPS:
+				ret = HARMONY_CAPS;
+				break;
+	      
+			default:
+				ret = harmony_mixer_get_level(cmd & 0xff);
+				break;
+			}
+		}
+		return put_user(ret, (int *)arg); 
+	} else
+		return -EINVAL;
+}
+
+static struct file_operations harmony_mixer_fops = {
+	owner:	THIS_MODULE,
+	ioctl: 	harmony_mixer_ioctl,
+};
+
+
+/*
+ * Mute all the output and reset Harmony.
+ */
+
+void harmony_mixer_reset(void)
+{
+	harmony_mixer->current_gain=GAIN_TOTAL_SILENCE;
+	harmony_mixer_set_gain();
+	gsc_writel(1, &harmony_mixer->hpa->reset);
+	udelay(100);
+	gsc_writel(0, &harmony_mixer->hpa->reset);
+	harmony_mixer->current_gain=GAIN_DEFAULT;
+	harmony_mixer_set_gain();
+}
+
+int harmony_mixer_init(struct harmony_dev * harmony_device)
+{
+  
+	int ret;
+	harmony_mixer=harmony_device;
+  
+	/* Register the device file operations */
+
+	ret=register_sound_mixer(&harmony_mixer_fops,-1);
+	if(ret<0) {
+		printk(KERN_WARNING "Harmony: Error Registering Mixer Driver\n");
+		return -EFAULT;
+	}
+  
+	harmony_mixer_reset();
+  
+	return 0;
+}
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
diff -Nru linux.original/drivers/sound/harmony_mixer.h linux/drivers/sound/harmony_mixer.h
--- linux.original/drivers/sound/harmony_mixer.h	Thu Jan  1 01:00:00 1970
+++ linux/drivers/sound/harmony_mixer.h	Sat Jan 20 01:29:47 2001
@@ -0,0 +1,62 @@
+/*
+ * sound/harmony_mixer.h
+ * 
+ * Definitions for the Harmony mixer
+ *      Matthieu Delahaye <delahaym@esiee.fr>, 2001
+ *
+ */
+
+
+/*
+ * Channels Positions in mixer register
+ */
+
+#define GAIN_HE_SHIFT   27
+#define GAIN_HE_MASK    ( 1 << GAIN_HE_SHIFT) 
+#define GAIN_LE_SHIFT   26
+#define GAIN_LE_MASK    ( 1 << GAIN_LE_SHIFT) 
+#define GAIN_SE_SHIFT   25
+#define GAIN_SE_MASK    ( 1 << GAIN_SE_SHIFT) 
+#define GAIN_IS_SHIFT   24
+#define GAIN_IS_MASK    ( 1 << GAIN_IS_SHIFT) 
+#define GAIN_MA_SHIFT   20
+#define GAIN_MA_MASK    ( 0x0f << GAIN_MA_SHIFT) 
+#define GAIN_LI_SHIFT   16
+#define GAIN_LI_MASK    ( 0x0f << GAIN_LI_SHIFT) 
+#define GAIN_RI_SHIFT   12
+#define GAIN_RI_MASK    ( 0x0f << GAIN_RI_SHIFT) 
+#define GAIN_LO_SHIFT   6
+#define GAIN_LO_MASK    ( 0x3f << GAIN_LO_SHIFT) 
+#define GAIN_RO_SHIFT   0
+#define GAIN_RO_MASK    ( 0x3f << GAIN_RO_SHIFT) 
+
+
+
+
+
+#define MAX_OUTPUT_LEVEL (GAIN_RO_MASK >> GAIN_RO_SHIFT)
+#define MAX_INPUT_LEVEL  (GAIN_RI_MASK >> GAIN_RI_SHIFT)
+#define MAX_VOLUME_LEVEL (GAIN_MA_MASK >> GAIN_MA_SHIFT)
+
+
+/*
+ * OSS values
+ */
+
+#define HARMONY_MIXER_DEVICES (SOUND_MASK_OGAIN|SOUND_MASK_IGAIN|SOUND_MASK_VOLUME)
+#define HARMONY_RECORDING_DEVICES (SOUND_MASK_MIC | SOUND_MASK_LINE )
+#define HARMONY_OUTPUT_DEVICES (SOUND_MASK_SPEAKER | SOUND_MASK_LINE | SOUND_MASK_PHONEOUT )
+#define HARMONY_CAPS 1
+#define HARMONY_STEREO_DEVICES (SOUND_MASK_IGAIN | SOUND_MASK_OGAIN)
+
+/*
+ * Channels Mask in mixer register
+ */
+
+
+#define GAIN_TOTAL_SILENCE 0x00F00FFF
+#define GAIN_DEFAULT       0x0FF00FFF
+
+
+
+
diff -Nru linux.original/drivers/sound/harmony_sound.c linux/drivers/sound/harmony_sound.c
--- linux.original/drivers/sound/harmony_sound.c	Thu Jan  1 01:00:00 1970
+++ linux/drivers/sound/harmony_sound.c	Sat Jan 20 01:29:47 2001
@@ -0,0 +1,703 @@
+/* 
+
+ 	drivers/sound/harmony.c 
+
+	This is a sound driver for Lasi's Harmony sound chip.  This is
+	unlikely to be used for anything other than a PA-RISC.
+
+	Harmony is found in HP 712s, 715/new, and many other GSC based machines. 
+Copyright 2000 (c) Linuxcare Canada, Alex deVries <alex@linuxcare.com>
+
+Bugs:
+
+1. Doesn't work on 715/old
+
+This driver doesn't work on 715/old machines, which include the 715/75.  The
+chip used for this is technically called 'Vivace', which is identical to 
+Harmony.  Should be easy to fix.  It has something to do with the way it is
+reported by the inventory code.  The HPA is not that of Lasi or ASP so the
+interrupts aren't registered properly.
+
+3. gain control ioctls are missing
+4. recording is missing
+
+5. Buffer handling code
+
+The three buffer system should probably be changed to use N buffers, so we 
+can load the buffers into memory and then exit.  Shouldn't be too hard, and 
+the performance will be a lot nicer.
+
+6. Clicks at start and finish
+
+I'm not sure why, but somehow I've introduced two clicks at the start and
+two clicks at the finish of each playing.  Shouldn't be too hard to track down.
+
+
+About the rotating buffer
+-------------------------
+
+I'm going to explain how the rotating buffer thing works because I had a hard
+time figuring it out for myself.
+
+At any given time, harmony uses two different buffers.  One is the frame
+that is currently playing, another is the frame that is ready to be played.
+
+Obviously you can't be writing into either of these frames while the chip
+is playing, or you'll hear clicks, pops and out of order frames.  One weekend
+of listening to RMS sing The Free Software Song out of order is a good way to 
+drive this point home.
+
+So, we use a total of three frames.  One is in PLAYING mode, one is is 
+READY_TO_PLAY mode, and the third is either LOADED or EMPTY.  All buffers
+start up by being EMTPY.  When harmony_audio_write loads up two frames,
+interrupts are started and the loop starts.  The ISR pops in the first frame,
+marking it as PLAYING.  The ISR will get called again, and the second 
+frame will be loaded and marked as READY_TO_PLAY.  When the first frame is
+done, the ISR will be called again; frame one is marked as EMPTY to reload,
+frame two is marked PLAYING, frame three is marked READY_TO_PLAY.
+
+All the while, harmony_audio_write is looking for frames marked EMPTY, and
+filling them and marking them LOADED.
+
+Yes, this does actually work.
+
+Let me save you an entire Thursday of listening to "orvalds Linus Linux, I 
+prounouce as Linus This is" by giving you this rotating buffer code.
+
+*/
+
+
+/* 
+   Changeg struct harmony_dev named harmony to 
+   a pointer (named harmony_audio) to the same structure
+   
+   Putted out all access to gain and reset 
+   (harmony_mixer now managed these)
+
+   Added harmony_format_auto_detect which try to auto-detect
+   file format when the application start to send data without
+   any initialization. File formats recognized are:
+      8bit u-law
+      8bit A-law
+      16bit linear
+   Others file formats aren't directly supported by Harmony.
+
+                     Matthieu Delahaye <delahaym@esiee.fr> , 2001
+
+*/
+
+
+/* Until we have recording working, this is where we're putting the recording data. */
+
+/* The following is required because of our cache incoherence */
+#include "harmony.h"
+static char graveyard[4096] __attribute__((aligned(4096)));
+
+static unsigned char aligned_buf [4096*(MAX_BUFS+1)] __attribute__ ((aligned (4096))); 
+
+
+
+static int harmony_audio_open(struct inode *inode, struct file *file);
+static int harmony_audio_release(struct inode *inode, struct file *file);
+static loff_t harmony_audio_llseek(struct file *file, loff_t offset, int whence);
+static ssize_t harmony_audio_read(struct file *file,
+                                char *buffer,
+                                size_t count,
+                                loff_t *ppos);
+static ssize_t harmony_audio_write(struct file *file,
+                                 const char *buffer,
+                                 size_t count,
+                                 loff_t *ppos);
+static unsigned int harmony_audio_poll(struct file *file,
+                                     struct poll_table_struct *wait);
+static int harmony_audio_ioctl(struct inode *inode,
+                                struct file *file,
+                                unsigned int cmd,
+                                unsigned long arg);
+static int harmony_audio_mmap(struct file *file, struct vm_area_struct *vma);
+
+
+static void harmony_interrupt(int irq, void *dev, struct pt_regs *regs);
+
+static void harmony_set_control(u8 data_format, u8 sample_rate, u8 stereo_select) ;
+static void harmony_set_format(u8 data_format);
+static void harmony_set_rate(u8 data_rate);
+static int harmony_enable_interrupts(void); 
+static int harmony_disable_interrupts(void);
+static int harmony_silence(unsigned char * buffer,int end, int start);
+
+static struct file_operations harmony_audio_fops = {
+	owner: THIS_MODULE,
+	llseek: harmony_audio_llseek,
+	read: 	harmony_audio_read,
+	write:	harmony_audio_write,
+	poll: 	harmony_audio_poll,
+	ioctl: 	harmony_audio_ioctl,
+	mmap:	harmony_audio_mmap,
+	open: 	harmony_audio_open,
+	release:	harmony_audio_release,
+};
+
+static struct harmony_dev * harmony_audio;
+
+/* This is the PDC signature to load up the driver. */
+
+
+/* This is the callback that's called by the inventory hardware code if
+it finds a match to the registered driver. */
+
+static void harmony_update_control(void) {
+	u32 default_cntl;
+
+	/* Set CNTL */
+	default_cntl = ((1 << 31) |  /* The C bit */
+		(harmony_audio->data_format << 6) |   /* Set the data format */
+		(harmony_audio->stereo_select << 5) |   /* Stereo select */
+		(harmony_audio->sample_rate));        /* Set sample rate */
+	harmony_audio->format_initialized=1;
+	
+	/* initialize CNTL */
+	gsc_writel( default_cntl, &harmony_audio->hpa->cntl);
+}
+
+static void harmony_set_control(u8 data_format, u8 sample_rate, u8 stereo_select) {
+
+	harmony_audio->sample_rate = sample_rate;
+	harmony_audio->data_format = data_format;
+	harmony_audio->stereo_select = stereo_select;
+	harmony_update_control();
+}
+static void harmony_set_rate(u8 data_rate) {
+	harmony_audio->sample_rate = data_rate;
+	harmony_update_control();
+}
+
+static void harmony_set_format(u8 data_format) {
+
+	harmony_audio->data_format = data_format;
+	harmony_update_control();
+}
+
+static void harmony_set_stereo(u8 stereo_select) {
+
+	harmony_audio->stereo_select = stereo_select;
+	harmony_update_control();
+}
+
+static int harmony_disable_interrupts(void) {
+	/* Enable interrupts to start playing again */
+	gsc_writel(0,&(harmony_audio->hpa->dstatus)); 
+	return 0;
+}
+
+static int harmony_enable_interrupts(void) {
+	/* Enable interrupts to start playing again */
+	gsc_writel(DSTATUS_IE,&(harmony_audio->hpa->dstatus)); 
+	return 0;
+}
+
+/*
+ * silence()
+ *
+ * This subroutine fills in a buffer starting at location start and
+ * silences for length bytes.  This references the current
+ * configuration of the audio format.
+ *
+ */
+
+static int harmony_silence(unsigned char * buffer,int start, int length) {
+
+	u8 silence_char = 0;
+
+	/* Despite what you hear, silence is different in
+	   different audio formats.  */
+
+	switch (harmony_audio->data_format) {
+		case HARMONY_DF_16BIT_LINEAR: silence_char = 0; break;
+		case HARMONY_DF_8BIT_ULAW:	silence_char = 0x55; break;
+		case HARMONY_DF_8BIT_ALAW:	silence_char = 0xff; break;
+		default: silence_char = 0;
+	}
+
+	memset(aligned_buf+start,silence_char, length);
+	return 0;
+}
+
+
+static int harmony_audio_open(struct inode *inode, struct file *file)
+{
+	int i;
+	u32	cntl;
+
+	/* Clear out the state of all the buffers */
+	for (i=0;i<MAX_BUFS;i++) {
+		harmony_audio->buf_state[i] = HARMONY_BUF_EMPTY;
+	}
+	harmony_audio->frames_so_far = 0;
+	harmony_audio->done = 0;
+	harmony_audio->outstanding_buffers = 0; 
+	harmony_audio->format_initialized = 0;
+	
+/* Start off in a balanced mode. */
+	
+
+	/* Clear out all the buffers and flush to cache */
+	harmony_silence(aligned_buf,0,4096*MAX_BUFS);
+	CHECK_WBACK_INV(aligned_buf,4096*MAX_BUFS);
+
+	while((cntl = gsc_readl(&harmony_audio->hpa->cntl)) & CNTL_C);
+
+	return 0;
+}
+
+/*
+ * Release (close) the audio device.
+ */
+
+static int harmony_audio_release(struct inode *inode, struct file *file)
+{
+	harmony_audio->format_initialized=0;
+	
+	return 0;
+}
+static loff_t harmony_audio_llseek(struct file *file, loff_t offset, int whence)
+{
+	printk(KERN_ERR "harmony: llseek\n");
+	return -ENODEV;
+}
+
+static ssize_t harmony_audio_read(struct file *file,
+                                char *buffer,
+                                size_t count,
+                                loff_t *ppos)
+{
+	printk(KERN_ERR "harmony: read\n");
+	return -ENODEV;
+}
+
+static int find_free_buffer(void) {
+
+	int i,buf_to_fill_in = -1;
+
+	for (i=MAX_BUFS-1;i>=0;i--) {
+		if (harmony_audio->buf_state[i] == HARMONY_BUF_EMPTY) {
+			buf_to_fill_in = i;
+		}
+	}
+	return buf_to_fill_in;
+}
+
+
+/* Here is the place where we try to recognize file format.
+   Sun/NeXT .au files began with the string .snd
+   At offset 12 is specified the encoding.
+   At offset 16 is specified speed rate
+   At Offset 20 is specified the numbers of voices
+*/
+
+#define four_bytes_to_u32(start) (file_header[start] << 24)|\
+                                  (file_header[start+1] << 16)|\
+                                  (file_header[start+2] << 8)|\
+                                  (file_header[start+3]);
+
+#define test_rate(tested,real_value,harmony_value) if((tested)<=(real_value))\
+                                                    { harmony_audio->sample_rate=harmony_value; harmony_update_control(); return;}
+
+static void harmony_format_auto_detect(const char * buffer, int block_size)
+{
+	u8 file_header[24];
+	u32 start_string;
+	
+	if(block_size>24)
+	{
+		copy_from_user(file_header,buffer,24);
+		start_string=four_bytes_to_u32(0);
+		
+		if((file_header[4]==0)&&(start_string==0x2E736E64)) {
+			u32 format;
+			u32 nb_voices;
+			u32 speed;
+			
+			format=four_bytes_to_u32(12);
+			nb_voices=four_bytes_to_u32(20);
+			speed=four_bytes_to_u32(16);
+			
+			switch (format) {
+			case HARMONY_MAGIC_8B_ULAW:
+				harmony_audio->data_format=HARMONY_DF_8BIT_ULAW;
+				break;
+			case HARMONY_MAGIC_8B_ALAW:
+				harmony_audio->data_format=HARMONY_DF_8BIT_ALAW;
+				break;
+			case HARMONY_MAGIC_16B_LINEAR:
+				harmony_audio->data_format=HARMONY_DF_16BIT_LINEAR;
+				break;
+			default:
+				
+				harmony_set_control(HARMONY_DF_16BIT_LINEAR,HARMONY_SR_22KHZ,HARMONY_SS_MONO);
+				return;
+				
+			}
+			switch(nb_voices) {
+			case HARMONY_MAGIC_MONO:
+				harmony_audio->stereo_select=HARMONY_SS_MONO;
+				break;
+			case HARMONY_MAGIC_STEREO:
+				harmony_audio->stereo_select=HARMONY_SS_STEREO;
+				break;
+			default:
+				harmony_audio->stereo_select=HARMONY_SS_MONO;
+				break;
+			}
+			test_rate(speed,5513,HARMONY_SR_5KHZ);
+			test_rate(speed,6615,HARMONY_SR_6KHZ);
+			test_rate(speed,8000,HARMONY_SR_8KHZ);
+			test_rate(speed,9600,HARMONY_SR_9KHZ);
+			test_rate(speed,11025,HARMONY_SR_11KHZ);
+			test_rate(speed,16000,HARMONY_SR_16KHZ);
+			test_rate(speed,18900,HARMONY_SR_18KHZ);
+			test_rate(speed,22050,HARMONY_SR_22KHZ);
+			test_rate(speed,27429,HARMONY_SR_27KHZ);
+			test_rate(speed,32000,HARMONY_SR_32KHZ);
+			test_rate(speed,33075,HARMONY_SR_33KHZ);
+			test_rate(speed,37800,HARMONY_SR_37KHZ);
+			test_rate(speed,44100,HARMONY_SR_44KHZ);
+			test_rate(speed,48000,HARMONY_SR_48KHZ);
+		}
+	}
+	harmony_set_control(HARMONY_DF_16BIT_LINEAR,HARMONY_SR_22KHZ,HARMONY_SS_MONO);
+	return;
+}
+#undef four_bytes_to_u32
+#undef test_rate
+
+
+
+
+static ssize_t harmony_audio_write(struct file *file,
+                                 const char *buffer,
+                                 size_t size_count,
+                                 loff_t *ppos)
+{
+
+	u32 status;
+	int total_count = (int) size_count;
+	int count = 0;
+	int frame_size;
+	int buf_to_fill_in = 0;
+	long timeout ;
+	int dstatus,cntl;
+
+	if(!harmony_audio->format_initialized) 
+	   harmony_format_auto_detect(buffer,total_count);
+	
+	while(count < total_count) {
+
+		/* Wait until we're out of control mode */
+		while ((status = gsc_readl(&(harmony_audio->hpa->cntl))) >> 31); 
+
+		/* Figure out which buffer to fill in */
+		timeout = 0;
+		buf_to_fill_in = HARMONY_BUF_NONE;
+		while ((buf_to_fill_in<0) && (timeout<100000)) {
+			buf_to_fill_in = find_free_buffer();
+			if (buf_to_fill_in < 0) {
+				udelay(10);
+				timeout++;
+			}
+		}
+		if (timeout==100000) {
+			return -1;
+		}
+
+		/* Figure out the size of the frame */
+		if ((total_count - count) > 4095) {
+			frame_size = 4096;
+		} else {
+			frame_size = total_count - count;
+			/* Clear out the buffer, since there we'll only be 
+			   overlaying part of the old buffer with the new one */
+			harmony_silence(aligned_buf,(4096*buf_to_fill_in), 4096);
+		}
+
+		/* Copy the page to an aligned buffer */
+		copy_from_user(aligned_buf+(4096*buf_to_fill_in), buffer,frame_size );
+		CHECK_WBACK_INV(aligned_buf,4096*MAX_BUFS);
+
+		harmony_audio->buf_state[buf_to_fill_in] = HARMONY_BUF_FILLED; 
+
+		harmony_audio->done = 0;
+		count += frame_size;
+
+		if (frame_size < 4096) {
+			count = total_count;
+			harmony_audio->done = 1;
+		}
+
+
+	dstatus = gsc_readl(&harmony_audio->hpa->dstatus);
+
+	cntl = gsc_readl(&harmony_audio->hpa->cntl);
+#if 0
+printk("write: buf: %i frame: %i done: %i cntl: 0x%x dstatus: 0x%x\n",buf_to_fill_in,harmony_audio->frames_so_far,harmony_audio->done,cntl,dstatus);
+#endif
+
+
+		if (harmony_audio->frames_so_far == 1) {
+			gsc_writel(__pa(aligned_buf+(4096*0)),&(harmony_audio->hpa->pnxtadd));  
+			gsc_writel(__pa(graveyard),&(harmony_audio->hpa->rnxtadd));  
+			harmony_enable_interrupts();
+		}
+
+		harmony_audio->frames_so_far++;
+	}
+
+	return count;
+}
+static unsigned int harmony_audio_poll(struct file *file,
+                                     struct poll_table_struct *wait)
+{
+	printk(KERN_ERR "harmony: poll\n");
+	return -ENODEV;
+}
+
+#define DBGEV printk
+#define DBGX printk
+#define DBGP
+
+static int harmony_audio_ioctl(struct inode *inode,
+                                struct file *file,
+                                unsigned int cmd,
+                                unsigned long arg)
+{
+
+
+	unsigned long flags;
+	int ival;
+	u32 new_format,newrate;
+	
+	switch (cmd) {
+	case OSS_GETVERSION:		/* _SIOR ('M', 118, int) */
+		DBGX("OSS_GETVERSION\n");
+		ival = SOUND_VERSION;
+		return put_user(ival, (int *) arg);
+
+	case SNDCTL_DSP_GETCAPS:	/* _SIOR ('P',15, int) */
+		DBGX("SNDCTL_DSP_GETCAPS\n");
+		ival = DSP_CAP_DUPLEX | DSP_CAP_BATCH ;
+		return put_user(ival, (int *) arg);
+
+	case SNDCTL_DSP_GETFMTS:	/* _SIOR ('P',11, int) */
+		DBGX("SNDCTL_DSP_GETFMTS\n");
+		ival = (AFMT_S16_BE | AFMT_MU_LAW | AFMT_A_LAW ); 
+		return put_user(ival, (int *) arg);
+		break;
+
+	case SOUND_PCM_READ_RATE:	/* _SIOR ('P', 2, int) */
+/*
+		I have no idea what this should be. 
+*/
+		ival = 0;	
+		return put_user(ival, (int *) arg);
+
+	case SNDCTL_DSP_SPEED:
+
+		if (get_user(ival, (int *) arg))
+			return -EFAULT;
+		if (ival) {
+			switch(ival) {
+				case 8000: newrate = HARMONY_SR_8KHZ; break;
+				case 16000: newrate = HARMONY_SR_16KHZ; break; 
+				case 27428: newrate = HARMONY_SR_27KHZ; break; 
+				case 32000: newrate = HARMONY_SR_32KHZ; break; 
+				case 48000: newrate = HARMONY_SR_48KHZ; break; 
+				case 9600: newrate = HARMONY_SR_9KHZ; break; 
+				case 5125: newrate = HARMONY_SR_5KHZ; break; 
+				case 11025: newrate = HARMONY_SR_11KHZ; break; 
+				case 18900: newrate = HARMONY_SR_18KHZ; break; 
+				case 22050: newrate = HARMONY_SR_22KHZ; break; 
+				case 37800: newrate = HARMONY_SR_37KHZ; break; 
+				case 44100: newrate = HARMONY_SR_44KHZ; break; 
+				case 33075: newrate = HARMONY_SR_33KHZ; break; 
+				case 6615: newrate = HARMONY_SR_6KHZ; break; 
+				default: printk("Could not match rate %d\n",ival); newrate = HARMONY_SR_8KHZ;
+			}
+			harmony_set_rate(newrate);
+		} else {
+			ival = harmony_audio->sample_rate;
+		}
+		return put_user(ival,(int*) arg);
+
+	case SNDCTL_DSP_STEREO:		/* _SIOWR('P', 3, int) */
+		if (get_user(ival, (int *) arg))
+			return -EFAULT;
+		if (ival != 0 && ival != 1)
+			return -EINVAL;
+		harmony_set_stereo(ival);
+		return put_user(ival, (int *) arg);
+
+	case SNDCTL_DSP_GETBLKSIZE:	/* _SIOWR('P', 4, int) */
+		ival = 4096;
+		return put_user(ival, (int *) arg);
+	case SNDCTL_DSP_RESET:
+		return 0;
+
+	case SNDCTL_DSP_SETFMT:		/* _SIOWR('P',5, int) */
+		if (get_user(ival, (int *) arg)) {
+			printk("arg, couldn't get arg\n");
+			return -EFAULT;
+		}
+		if (ival != AFMT_QUERY) {
+			switch (ival) {
+				case AFMT_MU_LAW: new_format = HARMONY_DF_8BIT_ULAW; break;
+				case AFMT_A_LAW:	new_format = HARMONY_DF_8BIT_ALAW; break;
+				case AFMT_U16_BE:	new_format = HARMONY_DF_16BIT_LINEAR; break; 
+				default: {
+					printk("Invalid sound format %d\n",ival);
+					return -EINVAL;
+				}
+			}
+			harmony_set_format(new_format);
+		} else {
+			switch (harmony_audio->data_format) {
+				case HARMONY_DF_8BIT_ULAW: ival = AFMT_MU_LAW; break;
+				case HARMONY_DF_8BIT_ALAW: ival = AFMT_A_LAW; break;
+				case HARMONY_DF_16BIT_LINEAR:	ival = AFMT_U16_BE; break;
+				default: ival = 0;
+			}
+		}
+		return put_user(ival, (int *) arg);
+
+	default:
+		DBGP("------ OH NO unknown ioctl 0x%x\n", cmd);
+		return -EINVAL;
+	}
+	DBGP("unimplemented ioctl 0x%x\n", cmd);
+	return -EINVAL;
+}
+static int harmony_audio_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	printk(KERN_ERR "harmony: mmap\n");
+	return -ENODEV;
+}
+
+static void harmony_interrupt(int irq, void *dev, struct pt_regs *regs)
+{
+	u32 dstatus,pcuradd;
+	struct harmony_hpa * hpa;
+	int i, buf_to_free = 0, curbuf = MAX_BUFS;
+
+	/* Setup the hpa */
+
+	hpa = ((struct harmony_dev *)dev)->hpa;
+	
+	
+	/* Read dstatus and pcuradd (the current address) */
+	dstatus = gsc_readl(&hpa->dstatus);
+	pcuradd = gsc_readl(&hpa->pcuradd);
+
+	/* Find the last filled buffer */
+	curbuf = MAX_BUFS;
+	for (i=MAX_BUFS-1;i>=0;i--) {
+		if (harmony_audio->buf_state[i]==HARMONY_BUF_FILLED) {
+			curbuf = i;
+		}
+	}
+	if (curbuf == MAX_BUFS) {
+		if (harmony_audio->done) {
+		} else {
+			printk("harmony_interrupt: ack, nothing to play yet.  No available buffer.\n");
+		}
+	}
+
+	/* Turn off interrupts */
+	harmony_disable_interrupts();
+	dstatus = gsc_readl(&hpa->dstatus);
+
+	/* Check if this is a request to get the next play buffer */
+	if(dstatus & DSTATUS_PN) {
+		gsc_writel(__pa(aligned_buf+(4096*curbuf)), &hpa->pnxtadd);
+		harmony_audio->outstanding_buffers++;
+
+		if (!harmony_audio->done) {
+
+			/* Set the volume; we probably don't need to do this. */
+		
+			/* Transition the playing buffer to empty*/
+
+			buf_to_free = -1;
+			for (i=0;i<MAX_BUFS;i++) {
+				if (harmony_audio->buf_state[i]==HARMONY_BUF_PLAYING) {
+					buf_to_free = i;
+				}
+			}
+			if (buf_to_free == -1) {
+			} else {
+				harmony_audio->buf_state[buf_to_free] = HARMONY_BUF_EMPTY;
+			}
+
+			/* Transition the buffers that are ready to be played to playing*/
+
+			buf_to_free = -1;
+
+			for (i=0;i<MAX_BUFS;i++) {
+				if (harmony_audio->buf_state[i]==HARMONY_BUF_READY_TO_PLAY) {
+					buf_to_free = i;
+				}
+			}
+			if (buf_to_free == -1) {
+			} else {
+				harmony_audio->buf_state[buf_to_free] = HARMONY_BUF_PLAYING;
+			}
+			harmony_audio->buf_state[curbuf] = HARMONY_BUF_READY_TO_PLAY;
+
+			harmony_enable_interrupts();
+		}
+	}
+
+	/* Check if we're being asked to fill in a recording buffer */
+	if(dstatus & DSTATUS_RN) {
+
+		/* Not supported yet */
+		gsc_writel(__pa(graveyard) , &hpa->rnxtadd);
+		harmony_audio->outstanding_buffers--;
+	}
+	if (harmony_audio->done && (!harmony_audio->outstanding_buffers)) {
+		harmony_disable_interrupts();	
+	}
+}
+
+
+
+int harmony_audio_init(struct harmony_dev * harmony_device)
+{
+   int ret;
+   int cntl;
+   
+   harmony_audio=harmony_device;
+   
+	/* Request that IRQ */
+	request_irq(harmony_audio->irq, &harmony_interrupt, 0 ,"harmony", (void *) harmony_audio);
+
+   	ret = register_sound_dsp(&harmony_audio_fops, -1);
+	if (ret < 0) {
+		printk("Harmony: Error registering\n");
+		return -EFAULT;
+	}
+	harmony_set_control(HARMONY_DF_16BIT_LINEAR,HARMONY_SR_22KHZ,HARMONY_SS_MONO);
+
+	/* Clear the buffers so you don't end up with crap in the buffers. */ 
+
+	harmony_silence(aligned_buf,0,4096*MAX_BUFS);
+
+	/* Make sure this makes it to cache */
+	CHECK_WBACK_INV(aligned_buf,4096*MAX_BUFS);
+
+
+	/* Wait around until we're out of control mode */
+	while((cntl = gsc_readl(&harmony_audio->hpa->cntl)) & CNTL_C);
+	return 0;
+}
+
+
+

--------------4695CB23E470794E9F8738B7--
