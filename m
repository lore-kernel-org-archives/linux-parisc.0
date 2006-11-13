From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] suppress led task for KittyHawk's LCD
Date: Mon, 13 Nov 2006 22:54:21 +0100
Message-ID: <20061113225421.e00e5c4b.gmsoft@tuxicoman.be>
References: <20061112014535.f583cc92.gmsoft@tuxicoman.be>
	<200611121504.38965.deller@gmx.de>
	<20061112155047.f1ec7175.gmsoft@tuxicoman.be>
	<200611121605.07365.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <gmsoft@tuxicoman.be>
In-Reply-To: <200611121605.07365.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>


Hi Helge,

Sorry for the missunderstanding.

It says this :
[42949382.500000] LED display at ffd0c000 registered

And nothing can be seen on the lcd since it's not detected and disabled.
/proc/pdc/lcd doesn't exists.

Do you know if this lcd is supposed to display the leds character ?


  Guy


On Sun, 12 Nov 2006 16:05:07 +0100
Helge Deller <deller@gmx.de> wrote:

> Hi Guy,
> 
> I think you misunderstood me.
> My idea was that you check what your machine's BIOS (PDC) returns for pdc_chassis_info().
> 
> So, if you would remove this code from led_init() you may test the results without this "workaround for KittyHawk":
>         /* Work around the buggy PDC of KittyHawk-machines */
>         switch (CPU_HVERSION) {
>         case 0x580:             /* KittyHawk DC2-100 (K100) */
>         case 0x581:             /* KittyHawk DC3-120 (K210) */
>         case 0x582:             /* KittyHawk DC3 100 (K400) */
>         case 0x583:             /* KittyHawk DC3 120 (K410) */
>         case 0x58B:             /* KittyHawk DC2 100 (K200) */
>                 printk(KERN_INFO "%s: KittyHawk-Machine (hversion 0x%x) found, "
>                                 "LED detection skipped.\n", __FILE__, CPU_HVERSION);
>                 goto found;     /* use the preinitialized values of lcd_info */
>         }
> 
> Helge
> 
> 
> On Sunday 12 November 2006 15:50, Guy Martin wrote:
> > 
> > Hi Helge,
> > 
> > This can't work. If you don't call register_led_driver(), led_func_ptr and led_type stay NULL and lcd_print() never prints anything.
> > You can change lcd_print() not to check led_func_ptr but I fear something may break if the device is not initialized :)
> > 
> > Maybe we could use static int initialized defined in register_led_driver and make it global to check if the device is ready or not.
> > 
> >   Guy
> > 
> > 
> > On Sun, 12 Nov 2006 15:04:38 +0100
> > Helge Deller <deller@gmx.de> wrote:
> > 
> > > Hi Guy,
> > > 
> > > On Sunday 12 November 2006 01:45, Guy Martin wrote:
> > > > I've noticed that the LCD on my K410 is filled at a constant rate with black characters.
> > > > After some investigation, it looked like the code updating the led status was filling the LCD.
> > > ....
> > > 
> > > instead of adding:
> > > +               no_led = 1;     /* no led support on KittyHawk */
> > >                 goto found;     /* use the preinitialized values of lcd_info */
> > > 
> > > did you tried to comment out the "goto found" ?
> > > 
> > > Helge
> > 
> > 
