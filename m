From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] suppress led task for KittyHawk's LCD
Date: Sun, 12 Nov 2006 15:44:51 +0100
Message-ID: <20061112154451.6f9c7448.gmsoft@tuxicoman.be>
References: <20061112014535.f583cc92.gmsoft@tuxicoman.be>
	<20061112020737.GX16952@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061112020737.GX16952@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hi Matthew,

As far as I understand the code, led_LCD_driver() is only in charge of updating the led status. The led being a true led or a char on the LCD.
I can't find any documentation stating that the LCD on the K410 supports those chars. It only displays CPU01234 depending on the number of CPU you have at boot time.
The update of the LCD text is done via lcd_print() which doesn't use led_LCD_driver(). It only uses a reference to it to check if the device is correctly initialized.

If you tell me that led_LCD_driver() is supposed to work and it should display the right leds character, then led_LCD_driver() is buggy and needs to be fixed. Currently each time it's called, a char of the LCD become black for each leds that need updating. It goes from left to right and starts from the bottom row and then occure at the top row a bit later. If you echo something to /proc/pdc/lcd, you'll see the text for a few and then being overwritten.


Also, I actually sent the wrong patch. With the current version of the driver, only the odd chars from the string you pass is written on the lcd.
You need to set the min_cmd_delay to 80t of fix this.

@@ -695,6 +699,8 @@ int __init led_init(void)
        case 0x58B:             /* KittyHawk DC2 100 (K200) */
                printk(KERN_INFO "%s: KittyHawk-Machine (hversion 0x%x) found, "
                                "LED detection skipped.\n", __FILE__, CPU_HVERSION);
+               lcd_info.min_cmd_delay = 80;
+               no_led = 1;     /* no led support on KittyHawk */
                goto found;     /* use the preinitialized values of lcd_info */
        }
 

Regards,
  Guy



On Sat, 11 Nov 2006 19:07:38 -0700
Matthew Wilcox <matthew@wil.cx> wrote:

> On Sun, Nov 12, 2006 at 01:45:35AM +0100, Guy Martin wrote:
> > I've noticed that the LCD on my K410 is filled at a constant rate with black characters.
> > After some investigation, it looked like the code updating the led status was filling the LCD.
> > 
> > I believe there is not led support on K class but I didn't checked.
> > 
> > The attached patch disable the led_task, which is updating the led status, for KittyHawk hardware.
> 
> That's clearly the wrong solution.  The led_task is responsible for
> updating both LEDs and LCDs.  It should be calling led_LCD_driver()
> which should be putting the image of a beating heart on the LCD panel.
> 
> It would be great if you could do some more debugging and figure out
> what's going on here.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
