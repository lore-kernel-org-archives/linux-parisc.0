Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56A964A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Mar 2001 14:54:14 -0700 (MST)
Sender: delahaym@esiee.fr
Message-ID: <3AA55CBA.DA306BF9@esiee.fr>
Date: Tue, 06 Mar 2001 22:55:06 +0100
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Cc: t.simonnet@esiee.fr
Content-Type: multipart/mixed;
 boundary="------------EB42E961D7878AECC355519F"
Subject: [parisc-linux] Recording with harmony
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------EB42E961D7878AECC355519F
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

If you want to record your voice on your favorite workstation :)
-- 
Matthieu Delahaye
ESIEE Team
http://www.esiee.fr/puffin
--------------EB42E961D7878AECC355519F
Content-Type: text/plain; charset=us-ascii;
 name="harmony.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="harmony.diff"

diff -Nru linux.old/drivers/sound/harmony.c linux.new/drivers/sound/harmony.c
--- linux.old/drivers/sound/harmony.c	Tue Mar  6 22:37:56 2001
+++ linux.new/drivers/sound/harmony.c	Tue Mar  6 22:41:27 2001
@@ -69,11 +69,13 @@
 	- modularisation, 
 	- cleanups
 
+2001-03-07: Matthieu Delahaye <delahaym@esiee.fr>
+        - added record functionality
+
 TODO:
 -----
 	- update/cleanup the above documentation
 	- fix CHECK_xxx functions -> use newer cache flushing functions 
-	- add recording functionality
 	- test if loading/unloading this driver as module works
 */
 
@@ -243,13 +245,21 @@
 	u8 sample_rate;
 	u8 stereo_select;	/* 1 = stereo, 0 = mono */
 	int format_initialized;
-	int suspended;
-	int blocked;
-	int done;
-	wait_queue_head_t wq;
-	int first_filled;	/* first buffer containing data (next to play) */
-	int nb_filled; 
+	int suspended_playing;
+	int suspended_recording;
 	
+	int blocked_playing;
+	int blocked_recording;
+	
+	int done;
+	wait_queue_head_t wq_play, wq_record;
+	int first_filled_play;	/* first buffer containing data (next to play) */
+	int nb_filled_play; 
+	int first_filled_record;
+	int nb_filled_record;
+	int playing;
+	int recording;
+		
 	int audio_open, mixer_open;
 	int dsp_unit, mixer_unit;
 };
@@ -262,13 +272,18 @@
 
 
 /* Until we have recording working, this is where we're putting the recording data. */
-static char graveyard[4096] 
-		__attribute__((aligned(4096)));
 
 static struct harmony_dev harmony;
 
-static unsigned char aligned_buf[MAX_BUFS * HARMONY_BUF_SIZE] 
-		__attribute__ ((aligned (HARMONY_BUF_SIZE))); 
+static unsigned char played_buf[MAX_BUFS * HARMONY_BUF_SIZE] 
+                     __attribute__ ((aligned (HARMONY_BUF_SIZE))); 
+static unsigned char recorded_buf[MAX_BUFS * HARMONY_BUF_SIZE]
+                     __attribute__ ((aligned (HARMONY_BUF_SIZE)));
+static char silent[HARMONY_BUF_SIZE] 
+		__attribute__((aligned(4096)));
+static char graveyard[HARMONY_BUF_SIZE] 
+		__attribute__((aligned(4096)));
+
 
 
 static void harmony_wait_CNTL(void)
@@ -347,12 +362,15 @@
 
 static int harmony_disable_interrupts(void) 
 {
+	harmony_wait_CNTL();
+	
 	gsc_writel(0, &(harmony.hpa->dstatus)); 
 	return 0;
 }
 
 static int harmony_enable_interrupts(void) 
 {
+	harmony_wait_CNTL();
 	gsc_writel(DSTATUS_IE, &(harmony.hpa->dstatus)); 
 	return 0;
 }
@@ -379,7 +397,7 @@
 		default:			silence_char = 0;
 	}
 
-	memset(aligned_buf+start, silence_char, length);
+	memset(played_buf+start, silence_char, length);
 	return 0;
 }
 
@@ -393,19 +411,28 @@
 	harmony.frames_so_far = 0;
 	harmony.done = 0; 
 	harmony.format_initialized = 0;
-	harmony.suspended = 0;
-	harmony.blocked = 0;
-	harmony.first_filled = 0;
-	harmony.nb_filled = 0;
-	init_waitqueue_head(&harmony.wq);
+	harmony.suspended_playing = 1;
+	harmony.blocked_playing = 0;
+	harmony.suspended_recording =1;
+	harmony.blocked_recording=0;
+	harmony.first_filled_play = 0;
+	harmony.nb_filled_play = 0;
+	harmony.first_filled_record = 0;
+	harmony.nb_filled_record = 0;
+	
+	init_waitqueue_head(&harmony.wq_play);
+	init_waitqueue_head(&harmony.wq_record);
 	
 	/* Start off in a balanced mode. */
 
+	harmony_set_control(HARMONY_DF_16BIT_LINEAR, HARMONY_SR_44KHZ, HARMONY_SS_STEREO);
+	harmony_update_control();
+
 	/* Clear out all the buffers and flush to cache */
-	harmony_silence(aligned_buf, 0, HARMONY_BUF_SIZE*MAX_BUFS);
-	CHECK_WBACK_INV(aligned_buf, HARMONY_BUF_SIZE*MAX_BUFS);
+	harmony_silence(played_buf, 0, HARMONY_BUF_SIZE*MAX_BUFS);
+	CHECK_WBACK_INV(played_buf, HARMONY_BUF_SIZE*MAX_BUFS);
 	
-	harmony_mixer_mute_all();
+//	harmony_mixer_mute_all();
 
 	harmony_wait_CNTL();
 
@@ -434,15 +461,52 @@
 
 static ssize_t harmony_audio_read(struct file *file,
                                 char *buffer,
-                                size_t count,
+                                size_t size_count,
                                 loff_t *ppos)
 {
-	DPRINTK(KERN_ERR "%s: invalid read\n", __FUNCTION__);
-	return -ENODEV;
+	int total_count = (int) size_count;
+	int count = 0;
+	int buf_to_read;
+
+	while (count<total_count) {
+		/* Wait until we're out of control mode */
+		harmony_wait_CNTL();
+		
+		/* Figure out which buffer to fill in */
+		
+		if(harmony.nb_filled_record<=2) {
+			harmony.blocked_recording = 1;
+		        if(harmony.suspended_recording) {
+				harmony.suspended_recording=0;
+				harmony_enable_interrupts();
+			}
+							
+			interruptible_sleep_on(&(harmony.wq_record));
+			harmony.blocked_recording=0;
+		}
+		if(harmony.nb_filled_record<2) return -EBUSY;
+		
+		buf_to_read = harmony.first_filled_record;
+		
+		/* Figure out the size of the frame */
+	
+		/* Copy the page to an aligned buffer */
+		copy_to_user(buffer+count, 
+			     recorded_buf+(HARMONY_BUF_SIZE*buf_to_read), 
+			     HARMONY_BUF_SIZE);
+		
+		harmony.nb_filled_record--;
+		harmony.first_filled_record++;
+		harmony.first_filled_record%=MAX_BUFS;
+				
+		count += 4096;
+	}
+	return count;
 }
 
 
 
+
 /* Here is the place where we try to recognize file format.
    Sun/NeXT .au files began with the string .snd
    At offset 12 is specified the encoding.
@@ -531,12 +595,16 @@
 		harmony_wait_CNTL();
 
 		/* Figure out which buffer to fill in */
-		while (harmony.nb_filled+2 >= MAX_BUFS) {
-			harmony.blocked = 1;
-			interruptible_sleep_on(&(harmony.wq));
+		
+		if(harmony.nb_filled_play+2 >= MAX_BUFS) {
+			harmony.blocked_playing = 1;
+			interruptible_sleep_on(&(harmony.wq_play));
+			harmony.blocked_playing=0;
 		}
-	
-		buf_to_fill = (harmony.first_filled+harmony.nb_filled) % MAX_BUFS;
+		if(harmony.nb_filled_play+2 >= MAX_BUFS) return -EBUSY;
+		
+		
+		buf_to_fill = (harmony.first_filled_play+harmony.nb_filled_play) % MAX_BUFS;
 
 		/* Figure out the size of the frame */
 		if ((total_count-count) > HARMONY_BUF_SIZE) {
@@ -545,33 +613,26 @@
 			frame_size = total_count - count;
 			/* Clear out the buffer, since there we'll only be 
 			   overlaying part of the old buffer with the new one */
-			harmony_silence(aligned_buf, HARMONY_BUF_SIZE*buf_to_fill, 
+			harmony_silence(played_buf, HARMONY_BUF_SIZE*buf_to_fill, 
 					HARMONY_BUF_SIZE);
 		}
 
 		/* Copy the page to an aligned buffer */
-		copy_from_user(aligned_buf+(HARMONY_BUF_SIZE*buf_to_fill), 
+		copy_from_user(played_buf+(HARMONY_BUF_SIZE*buf_to_fill), 
 				buffer+count, frame_size);
 	
-		harmony.nb_filled++;
+		harmony.nb_filled_play++;
 
-		CHECK_WBACK_INV(aligned_buf, HARMONY_BUF_SIZE*MAX_BUFS);
+		CHECK_WBACK_INV(played_buf, HARMONY_BUF_SIZE*MAX_BUFS);
 		
 		harmony.done = 0;
 		count += frame_size;
 
-		if (harmony.frames_so_far == 1) {
-			harmony_mixer_unmute();
-		   	harmony_enable_interrupts();
-		}
-
-		if (harmony.suspended) {
-			harmony.suspended = 0;
+		if (harmony.suspended_playing && (harmony.nb_filled_play>=4)) {
 			harmony_enable_interrupts();
 		}
-		
-		harmony.frames_so_far++;
 	}
+	
 	return count;
 }
 
@@ -678,37 +739,63 @@
 
 	/* Setup the hpa */
 	hpa = ((struct harmony_dev *)dev)->hpa;
+	harmony_wait_CNTL();
 	
 	/* Read dstatus and pcuradd (the current address) */
 	dstatus = gsc_readl(&hpa->dstatus);
 	
 	/* Turn off interrupts */
 	harmony_disable_interrupts();
-	dstatus = gsc_readl(&hpa->dstatus);
 	
 	/* Check if this is a request to get the next play buffer */
 	if (dstatus & DSTATUS_PN) {
-		if (!harmony.nb_filled) {
-			harmony.suspended = 1;
+		if (!harmony.nb_filled_play) {
+			harmony.suspended_playing = 1;
+			harmony_silence(silent, 0,HARMONY_BUF_SIZE);
+			gsc_writel(__pa(silent), &hpa->pnxtadd);
+						
+			if(!harmony.suspended_recording) {
+				harmony_enable_interrupts();
+			} 
 		} else {
-			gsc_writel(__pa(aligned_buf+(HARMONY_BUF_SIZE*harmony.first_filled)), 
+			harmony.suspended_playing=0;
+			gsc_writel(__pa(played_buf+(HARMONY_BUF_SIZE*harmony.first_filled_play)), 
 					&hpa->pnxtadd);
-			harmony.first_filled++;
-			harmony.first_filled %= MAX_BUFS;
-			harmony.nb_filled--;
-			harmony_enable_interrupts();
+			harmony.first_filled_play++;
+			harmony.first_filled_play %= MAX_BUFS;
+			harmony.nb_filled_play--;
+			
+		       	harmony_enable_interrupts();
 		}
-
-		if (harmony.blocked) {
-			wake_up_interruptible(&(harmony.wq));
-			harmony.blocked = 0;
+		if (harmony.blocked_playing) {
+			wake_up_interruptible(&(harmony.wq_play));
 		}
 	}
 	
 	/* Check if we're being asked to fill in a recording buffer */
 	if (dstatus & DSTATUS_RN) {
-		/* Not supported yet */
-		gsc_writel(__pa(graveyard), &hpa->rnxtadd);
+		if((harmony.nb_filled_record+2>=MAX_BUFS) || harmony.suspended_recording)
+		{
+			harmony.nb_filled_record=0;
+			harmony.first_filled_record=0;
+			harmony.suspended_recording = 1;
+			gsc_writel(__pa(graveyard), &hpa->rnxtadd);
+			if(!harmony.suspended_playing)
+				harmony_enable_interrupts();
+		} else {
+			int buf_to_fill;
+			buf_to_fill=(harmony.first_filled_record+harmony.nb_filled_record)%MAX_BUFS;
+			CHECK_WBACK_INV(recorded_buf+(HARMONY_BUF_SIZE*buf_to_fill), HARMONY_BUF_SIZE);
+			gsc_writel(__pa(recorded_buf+(HARMONY_BUF_SIZE*(buf_to_fill))),&hpa->rnxtadd);
+			harmony.nb_filled_record++;
+			harmony_enable_interrupts();
+		}
+
+		if (harmony.blocked_recording && 
+		    harmony.nb_filled_record>3) {
+						
+			wake_up_interruptible(&(harmony.wq_record));
+		}
 	}
 }
 
@@ -738,13 +825,12 @@
 		return -EFAULT;
 	}
 	
-	harmony_set_control(HARMONY_DF_16BIT_LINEAR, HARMONY_SR_22KHZ, HARMONY_SS_MONO);
-
+	
 	/* Clear the buffers so you don't end up with crap in the buffers. */ 
-	harmony_silence(aligned_buf, 0, HARMONY_BUF_SIZE*MAX_BUFS);
+	harmony_silence(played_buf, 0, HARMONY_BUF_SIZE*MAX_BUFS);
 
 	/* Make sure this makes it to cache */
-	CHECK_WBACK_INV(aligned_buf, HARMONY_BUF_SIZE*MAX_BUFS);
+	CHECK_WBACK_INV(played_buf, HARMONY_BUF_SIZE*MAX_BUFS);
 
 	/* Wait around until we're out of control mode */
 	harmony_wait_CNTL();

--------------EB42E961D7878AECC355519F--
