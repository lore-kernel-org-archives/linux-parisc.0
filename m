From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: J5000 LCD heartbeat
Date: Mon, 21 Mar 2005 00:19:45 -0700
Message-ID: <20050321071945.GA10108@colo.lackof.org>
References: <200503191959.05972.dmp@davidmpye.dyndns.org>
	<20050320210357.53534d01@Tatooine.r3z0>
	<200503202257.31924.dmp@davidmpye.dyndns.org>
	<200503202317.05481.dmp@davidmpye.dyndns.org>
	<20050321045506.GA18458@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050321045506.GA18458@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 21, 2005 at 04:55:06AM +0000, Stuart Brady wrote:
> I wonder if it's a problem that an "LED" can be updated if it hasn't
> changed (and even when there are others that actually need updating).
> I think the included patch evens out the heartbeat a bit, but maybe I'm
> imagining it...  Does it look okay?

Hrm...for LCD, can we program all 4 independently?
I've attached another patch based on ideas in yours that makes that
more explicit. Seems to work but I suppose locating a spec the LCD
panels would be the only way to know for sure.

On my j6k the change in LCD heartbeat was very faint.
LCD has a much slower/longer response time than an LED.
I've basically doubled the "time on" and now heart beat is easy to see.
But if someone knows the response time of the LCD panels, that
should make it obvious what the right values would be.

This difference got me wondering if we should have different tasklets
to handle LED vs LCD. If would be nice to deal with differences
in output device response times and a two step (cmd then data) update
process at a higher level than led_LCD_driver(). But I'm not volunteering
to rewrite LED/LCD driver and the patch below is Good Enough (IMHO).

Another possible improvement would be to move the code in the
"for" loop to a static inline function and just pass in all
the hard coded stuff. Wouldn't need any arrays and code is
probably compact enough that getting rid of the loop would
be a win. But someone would need to get CR16 cycle counts
before/after to prove it's better...again, more work than I'm
willing to put into it but something fun for someone to play with.

The following patch "Works for Me"(tm).
It's at risk for ignoring transitions until after the data phase is
taken care of and we send the next command. ie the gap between
when someone decides the LED should change and when it actually
changes entirely depends on how frequently led_LCD_driver gets called.

thanks,
grant

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

Index: drivers/parisc/led.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/led.c,v
retrieving revision 1.12
diff -u -p -r1.12 led.c
--- drivers/parisc/led.c	18 Mar 2005 13:17:10 -0000	1.12
+++ drivers/parisc/led.c	21 Mar 2005 06:53:19 -0000
@@ -296,41 +296,40 @@ static void led_LASI_driver(unsigned cha
  */
 static void led_LCD_driver(unsigned char leds)
 {
-	static int last_index;	/* 0:heartbeat, 1:disk, 2:lan_in, 3:lan_out */
-	static int last_was_cmd;/* 0: CMD was written last, 1: DATA was last */
-	struct lcd_block *block_ptr;
-	int value;
-
-	switch (last_index) {
-	    case 0:	block_ptr = &lcd_info.heartbeat;
-			value = leds & LED_HEARTBEAT;
-			break;
-	    case 1:	block_ptr = &lcd_info.disk_io;
-			value = leds & LED_DISK_IO;
-			break;					
-	    case 2:	block_ptr = &lcd_info.lan_rcv;
-			value = leds & LED_LAN_RCV;
-			break;					
-	    case 3:	block_ptr = &lcd_info.lan_tx;
-			value = leds & LED_LAN_TX;
-			break;
-	    default:	/* should never happen: */
-			return;
-	}
-
-	if (last_was_cmd) {
-	    /* write the value to the LCD data port */
-    	    gsc_writeb( value ? block_ptr->on : block_ptr->off, LCD_DATA_REG );
-	} else {
-	    /* write the command-byte to the LCD command register */
-    	    gsc_writeb( block_ptr->command, LCD_CMD_REG );
-	}    
-	
-	/* now update the vars for the next interrupt iteration */ 
-	if (++last_was_cmd == 2) { /* switch between cmd & data */
-	    last_was_cmd = 0;
-	    if (++last_index == 4) 
-		last_index = 0;	 /* switch back to heartbeat index */
+	static unsigned char last_leds;
+
+	static unsigned char changed[4];
+	static unsigned char data[4];
+	static unsigned char mask[4] = { LED_HEARTBEAT, LED_DISK_IO,
+						LED_LAN_RCV, LED_LAN_TX };
+	static struct lcd_block * blockp[4] = {
+		&lcd_info.heartbeat,
+		&lcd_info.disk_io,
+		&lcd_info.lan_rcv,
+		&lcd_info.lan_tx
+	};
+
+	unsigned int i;
+
+	for (i = 0; i < 4; i++) {
+		if (changed[i]) {
+			/* finish LCD update with write to the LCD data port */
+			gsc_writeb( data[i], LCD_DATA_REG );
+			changed[i] = 0;
+		} else {
+			/* check if this "LED" changed since last time */
+			if ((leds ^ last_leds) & mask[i]) {
+				last_leds ^= mask[i];
+				data[i] = (leds & mask[i]) ?
+						blockp[i]->on :
+						blockp[i]->off;
+
+				changed[i] = 1;
+
+				/* start update by writing the cmd byte */
+		    		gsc_writeb(blockp[i]->command, LCD_CMD_REG);
+			}
+		}
 	}
 }
 
@@ -427,8 +426,8 @@ static __inline__ int led_get_diskio_act
     - optimizations
  */
 
-#define HEARTBEAT_LEN (HZ*6/100)
-#define HEARTBEAT_2ND_RANGE_START (HZ*22/100)
+#define HEARTBEAT_LEN (HZ*12/100)
+#define HEARTBEAT_2ND_RANGE_START (HZ*36/100)
 #define HEARTBEAT_2ND_RANGE_END   (HEARTBEAT_2ND_RANGE_START + HEARTBEAT_LEN)
 
 #define NORMALIZED_COUNT(count) (count/(HZ/100))
@@ -481,7 +480,7 @@ static void led_tasklet_func(unsigned lo
 	}
 	
 	/* update the LCD/LEDs */
-	if (currentleds != lastleds) {
+	if (currentleds != lastleds || lcd_info.model == DISPLAY_MODEL_LCD) {
 	    led_func_ptr(currentleds);
 	    lastleds = currentleds;
 	}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
