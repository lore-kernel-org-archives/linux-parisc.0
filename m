From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] Harmony - buffer underrun crash fix
Date: Tue, 25 May 2004 21:43:02 +0100
Message-ID: <20040525204302.GA975@calypso>
References: <20040222092057.GA2590@calypso> <20040223035601.GA988@calypso>
	<20040511052451.GC27478@colo.lackof.org>
	<20040523234200.GA1893@calypso>
	<20040524081200.3d14256b.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040524081200.3d14256b.varenet@esiee.fr>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, May 24, 2004 at 08:12:00AM +0200, Thibaut VARENE wrote:

> There's been a suspected buffer overflow in the code for years, and it's
> a known "feature" that the driver may randomly panic the kernel. Patch
> welcome.

Thanks.  I had assumed that this was black magic and I'd never be able
to fix it, but thanks to your encouragement, I've taken a look and I now
have a fix for the crash, as well as a sample skipping problem that I
was previously unaware of:

Index: harmony.c
===================================================================
RCS file: /var/cvs/linux-2.4/drivers/sound/harmony.c,v
retrieving revision 1.28
diff -u -r1.28 harmony.c
--- harmony.c	22 Jun 2002 09:05:59 -0000	1.28
+++ harmony.c	25 May 2004 19:15:21 -0000
@@ -537,6 +537,7 @@
 	int count = 0;
 	int frame_size;
 	int buf_to_fill;
+	int fresh_buffer;
 
 	if (!harmony.format_initialized) 
 	   harmony_format_auto_detect(buffer, total_count);
@@ -556,12 +557,16 @@
 		
 		
 		buf_to_fill = (harmony.first_filled_play+harmony.nb_filled_play); 
-		if (harmony.play_offset)
+		if (harmony.play_offset) {
 			buf_to_fill--;
+			buf_to_fill += MAX_BUFS;
+		}
 		buf_to_fill %= MAX_BUFS;
-
+		
+		fresh_buffer = (harmony.play_offset == 0);
+		
 		/* Figure out the size of the frame */
-		if ((total_count-count) > HARMONY_BUF_SIZE - harmony.play_offset) {
+		if ((total_count-count) >= HARMONY_BUF_SIZE - harmony.play_offset) {
 			frame_size = HARMONY_BUF_SIZE - harmony.play_offset;
 		} else {
 			frame_size = total_count - count;
@@ -578,7 +583,7 @@
 		CHECK_WBACK_INV_OFFSET(played_buf, (HARMONY_BUF_SIZE*buf_to_fill + harmony.play_offset), 
 				frame_size);
 	
-		if (!harmony.play_offset)
+		if (fresh_buffer)
 			harmony.nb_filled_play++;
 		
 		count += frame_size;

Lines 560-563 fix the crash, which was caused by buf_to_fill taking the
value -1 (since -1 % MAX_BUFS == -1).

Lines 540, 566, 586/587 should fix a bug where samples were skipped.

The change to line 569 prevents harmony_silence from being called
whenever the final frame that is to be copied completely fills a buffer.

I'm a bit of a newbie here... can a harmony_interrupt occur whilst we're
in harmony_audio_write?
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
