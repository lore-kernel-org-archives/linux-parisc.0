From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] Re: J5000 LCD heartbeat
Date: Mon, 21 Mar 2005 04:55:06 +0000
Message-ID: <20050321045506.GA18458@ntlworld.com>
References: <200503191959.05972.dmp@davidmpye.dyndns.org>
	<20050320210357.53534d01@Tatooine.r3z0>
	<200503202257.31924.dmp@davidmpye.dyndns.org>
	<200503202317.05481.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503202317.05481.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Mar 20, 2005 at 11:17:03PM +0000, David Pye wrote:
> It appears my hunch was correct
>   /* update the LCD/LEDs */
>         if (currentleds != lastleds || led_type == LED_HASLCD) {
>             led_func_ptr(currentleds);
>             lastleds = currentleds;
>         }
> 
> If I modify the conditional as above, so it fires the led_func_ptr each time 
> the tasklet fires for LCD users (even if the leds haven't nominally changed) 
> my heart beats!

Ahh, fair enough.

Would it be better to test for "lcd_info.model == DISPLAY_MODEL_LCD"
rather than "led_type == LED_HASLCD"?

I wonder if it's a problem that an "LED" can be updated if it hasn't
changed (and even when there are others that actually need updating).
I think the included patch evens out the heartbeat a bit, but maybe I'm
imagining it...  Does it look okay?
-- 
Stuart Brady


Fix the virtual LEDs for LCD chassis displays.  Thanks to David Pye for
identifying the cause of the incorrect behaviour.

Signed-off-by: Stuart Brady <sdbrady@ntlworld.com>

Index: drivers/parisc/led.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/led.c,v
retrieving revision 1.12
diff -u -r1.12 led.c
--- drivers/parisc/led.c	18 Mar 2005 13:17:10 -0000	1.12
+++ drivers/parisc/led.c	21 Mar 2005 04:09:25 -0000
@@ -297,41 +297,53 @@
 static void led_LCD_driver(unsigned char leds)
 {
 	static int last_index;	/* 0:heartbeat, 1:disk, 2:lan_in, 3:lan_out */
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
+	static int last_was_cmd;/* 1: CMD was written last, 0: DATA was last */
+	static int first = 1;
+	static int last_leds, last_value;
+	static struct lcd_block *block_ptr;
+	int i, mask;
+
+	if (first) {
+		last_leds = ~leds;
+		first = 0;
+	}
+	
+	if (!last_was_cmd) {
+		for (i = 0; i < 4; i++) {
+			switch (last_index) {
+			    case 0:	mask = LED_HEARTBEAT;
+					block_ptr = &lcd_info.heartbeat;
+					break;
+			    case 1:	mask = LED_DISK_IO;
+					block_ptr = &lcd_info.disk_io;
+					break;
+			    case 2:	mask = LED_LAN_RCV;
+					block_ptr = &lcd_info.lan_rcv;
+					break;
+			    case 3:	mask = LED_LAN_TX;
+					block_ptr = &lcd_info.lan_tx;
+					break;
+			    default:	/* should never happen: */
+					return;
+			}
+
+			last_index++;
+			last_index %= 4;
+
+			if ((leds ^ last_leds) & mask) {
+				last_leds ^= mask; /* the bit has changed */
+				last_value = leds & mask;
+				/* write the command-byte to the LCD command register */
+		    		gsc_writeb( block_ptr->command, LCD_CMD_REG );
+				last_was_cmd = 1;
+				break;
+			}
+		}
 	} else {
-	    /* write the command-byte to the LCD command register */
-    	    gsc_writeb( block_ptr->command, LCD_CMD_REG );
+		/* write the value to the LCD data port */
+    		gsc_writeb( last_value ? block_ptr->on : block_ptr->off, LCD_DATA_REG );
+		last_was_cmd = 0;
 	}    
-	
-	/* now update the vars for the next interrupt iteration */ 
-	if (++last_was_cmd == 2) { /* switch between cmd & data */
-	    last_was_cmd = 0;
-	    if (++last_index == 4) 
-		last_index = 0;	 /* switch back to heartbeat index */
-	}
 }
 
 
@@ -481,7 +493,7 @@
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
