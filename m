From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: J5000 LCD heartbeat
Date: Mon, 21 Mar 2005 23:29:30 -0700
Message-ID: <20050322062930.GC1924@colo.lackof.org>
References: <200503191959.05972.dmp@davidmpye.dyndns.org>
	<20050320210357.53534d01@Tatooine.r3z0>
	<200503202257.31924.dmp@davidmpye.dyndns.org>
	<200503202317.05481.dmp@davidmpye.dyndns.org>
	<20050321045506.GA18458@ntlworld.com>
	<20050321071945.GA10108@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050321071945.GA10108@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 21, 2005 at 12:19:45AM -0700, Grant Grundler wrote:
> Hrm...for LCD, can we program all 4 independently?

ok...I'm having fun with this!

Here's another take that I *think* does it right.
LCD blinks nicely at least :^)

Stuart, how does this look to you?

(ignore the _LEN/_START values...make them whatever you want)

thanks,
grant



Index: drivers/parisc/led.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/led.c,v
retrieving revision 1.12
diff -u -p -r1.12 led.c
--- drivers/parisc/led.c	18 Mar 2005 13:17:10 -0000	1.12
+++ drivers/parisc/led.c	22 Mar 2005 06:20:59 -0000
@@ -117,7 +117,9 @@ lcd_info __attribute__((aligned(8))) =
 
 
 /* ptr to LCD/LED-specific function */
-static void (*led_func_ptr) (unsigned char);
+static unsigned int (*led_func_ptr) (unsigned char);
+static unsigned int led_func_pending; /* more work? */
+static unsigned char led_func_last;	/* previous LED setting */
 
 #define LED_HASLCD 1
 #define LED_NOLCD  0
@@ -255,7 +257,7 @@ static int __init led_create_procfs(void
  */
 #define	LED_DATA	0x01	/* data to shift (0:on 1:off) */
 #define	LED_STROBE	0x02	/* strobe to clock data */
-static void led_ASP_driver(unsigned char leds)
+static unsigned int led_ASP_driver(unsigned char leds)
 {
 	int i;
 
@@ -267,6 +269,7 @@ static void led_ASP_driver(unsigned char
 		gsc_writeb( value | LED_STROBE,	 LED_DATA_REG );
 		leds <<= 1;
 	}
+	return 0;
 }
 
 
@@ -275,10 +278,11 @@ static void led_ASP_driver(unsigned char
    ** led_LASI_driver()
    ** 
  */
-static void led_LASI_driver(unsigned char leds)
+static unsigned int led_LASI_driver(unsigned char leds)
 {
 	leds = ~leds;
 	gsc_writeb( leds, LED_DATA_REG );
+	return 0;
 }
 
 
@@ -294,44 +298,75 @@ static void led_LASI_driver(unsigned cha
    ** TODO: check the value of "min_cmd_delay" against the value of HZ.
    **   
  */
-static void led_LCD_driver(unsigned char leds)
+static unsigned int led_LCD_driver(unsigned char leds)
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
+#define LCD_BUFF_SIZE 16
+	static unsigned int data_tail, data_head;
+	static unsigned char data[LCD_BUFF_SIZE];
+	static unsigned char write_data;	/* flip-flop for cmd/data */
+
+	static unsigned char mask[4] = { LED_HEARTBEAT, LED_DISK_IO,
+						LED_LAN_RCV, LED_LAN_TX };
+	static struct lcd_block * blockp[4] = {
+		&lcd_info.heartbeat,
+		&lcd_info.disk_io,
+		&lcd_info.lan_rcv,
+		&lcd_info.lan_tx
+	};
+
+
+
+	if (led_func_pending) {
+		if (write_data) {
+			gsc_writeb( data[data_tail++], LCD_DATA_REG );
+			write_data=0;	/* do command next time */
+		} else {
+			gsc_writeb( data[data_tail++], LCD_CMD_REG );
+			write_data=1;	/* do data next time */
+		}
+		data_tail &= (LCD_BUFF_SIZE - 1);
+
+		/* avoid data[] overfull by not checking for updates
+		 * until after we've worked off pending updates.
+		 */
 	} else {
-	    /* write the command-byte to the LCD command register */
-    	    gsc_writeb( block_ptr->command, LCD_CMD_REG );
-	}    
-	
-	/* now update the vars for the next interrupt iteration */ 
-	if (++last_was_cmd == 2) { /* switch between cmd & data */
-	    last_was_cmd = 0;
-	    if (++last_index == 4) 
-		last_index = 0;	 /* switch back to heartbeat index */
+		unsigned int i;
+		unsigned char ledlast = led_func_last;
+		
+		/* update data and queue writes */
+		for (i = 0; i < 4; i++) {
+			/* check if this "LED" changed since last time */
+			if ((leds ^ ledlast) & mask[i]) {
+				ledlast ^= mask[i];
+
+				/* queue cmd/data pair */
+				data[data_head++] = blockp[i]->command;
+
+				/* Always write pairs and buffer is even size.
+				 * data_head &= (LCD_BUFF_SIZE - 1);
+				 */
+
+				data[data_head++] = (leds & mask[i]) ?
+						blockp[i]->on :
+						blockp[i]->off;
+				data_head &= (LCD_BUFF_SIZE - 1);
+			}
+		}
+
+		led_func_last = ledlast;
+
+		if (data_tail != data_head) {
+			/* start update by writing the cmd byte */
+		    	gsc_writeb(data[data_tail++], LCD_CMD_REG);
+
+			/* don't need to mask data_tail since buffer is
+			 * even sized and this is the first byte of a pair
+			 * 	data_tail &= (LCD_BUFF_SIZE - 1);
+			 */
+			write_data=1;
+		}
 	}
+	return (data_tail != data_head);
 }
 
 
@@ -427,15 +462,14 @@ static __inline__ int led_get_diskio_act
     - optimizations
  */
 
-#define HEARTBEAT_LEN (HZ*6/100)
-#define HEARTBEAT_2ND_RANGE_START (HZ*22/100)
+#define HEARTBEAT_LEN (HZ*12/100)
+#define HEARTBEAT_2ND_RANGE_START (HZ*36/100)
 #define HEARTBEAT_2ND_RANGE_END   (HEARTBEAT_2ND_RANGE_START + HEARTBEAT_LEN)
 
 #define NORMALIZED_COUNT(count) (count/(HZ/100))
 
 static void led_tasklet_func(unsigned long unused)
 {
-	static unsigned char lastleds;
 	unsigned char currentleds; /* stores current value of the LEDs */
 	static unsigned long count; /* static incremented value, not wrapped */
 	static unsigned long count_HZ; /* counter in range 0..HZ */
@@ -444,12 +478,17 @@ static void led_tasklet_func(unsigned lo
 	if (!led_func_ptr)
 	    return;
 
+	if (led_func_pending) {
+	    led_func_pending = led_func_ptr(led_func_last);
+	    return;
+	}
+
 	/* increment the local counters */
 	++count;
 	if (++count_HZ == HZ)
 	    count_HZ = 0;
 
-	currentleds = lastleds;
+	currentleds = led_func_last;
 
 	if (led_heartbeat)
 	{
@@ -480,10 +519,10 @@ static void led_tasklet_func(unsigned lo
 		currentleds = (count_HZ<=(HZ/2)) ? 0 : 0xff;
 	}
 	
-	/* update the LCD/LEDs */
-	if (currentleds != lastleds) {
-	    led_func_ptr(currentleds);
-	    lastleds = currentleds;
+	/* need to update the LCD/LEDs? */
+	if (currentleds != led_func_last) {
+	    led_func_pending = led_func_ptr(currentleds);
+	    led_func_last = currentleds;
 	}
 }
 
@@ -526,7 +565,7 @@ static int led_halt(struct notifier_bloc
 		lcd_print(txt);
 	else
 		if (led_func_ptr)
-			led_func_ptr(0xff); /* turn all LEDs ON */
+			(void) led_func_ptr(0xff); /* turn all LEDs ON */
 	
 	unregister_reboot_notifier(&led_notifier);
 	return NOTIFY_OK;
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
