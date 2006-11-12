From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] suppress led task for KittyHawk's LCD
Date: Sat, 11 Nov 2006 19:07:38 -0700
Message-ID: <20061112020737.GX16952@parisc-linux.org>
References: <20061112014535.f583cc92.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061112014535.f583cc92.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 12, 2006 at 01:45:35AM +0100, Guy Martin wrote:
> I've noticed that the LCD on my K410 is filled at a constant rate with black characters.
> After some investigation, it looked like the code updating the led status was filling the LCD.
> 
> I believe there is not led support on K class but I didn't checked.
> 
> The attached patch disable the led_task, which is updating the led status, for KittyHawk hardware.

That's clearly the wrong solution.  The led_task is responsible for
updating both LEDs and LCDs.  It should be calling led_LCD_driver()
which should be putting the image of a beating heart on the LCD panel.

It would be great if you could do some more debugging and figure out
what's going on here.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
