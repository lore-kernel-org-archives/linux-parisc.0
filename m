From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: [PARISC] fix uninitialized spinlock in HIL
	keyboard driver
Date: Sat, 17 Feb 2007 23:21:36 +0100
Message-ID: <200702172321.37036.deller__4006.82865079052$1416624295$gmane$org@gmx.de>
References: <11717457251848-git-send-email-kyle@parisc-linux.org>
	<11717457251606-git-send-email-kyle@parisc-linux.org>
	<11717457253477-git-send-email-kyle@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <11717457253477-git-send-email-kyle@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Dimitry,

please see below...

On Saturday 17 February 2007, Kyle McMartin wrote:
> From: Helge Deller <deller@gmx.de>
> 
> - remove some warnings for PARISC part of the driver
> - annotate hphilkeyb_keycode[] array as __read_mostly
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>
> ---
>  drivers/input/keyboard/hilkbd.c |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/keyboard/hilkbd.c b/drivers/input/keyboard/hilkbd.c
> index c2264a6..585f0a7 100644
> --- a/drivers/input/keyboard/hilkbd.c
> +++ b/drivers/input/keyboard/hilkbd.c
> @@ -3,7 +3,7 @@
>   *
>   *  Copyright (C) 1998 Philip Blundell <philb@gnu.org>
>   *  Copyright (C) 1999 Matthew Wilcox <willy@bofh.ai>
> - *  Copyright (C) 1999-2006 Helge Deller <deller@gmx.de>
> + *  Copyright (C) 1999-2007 Helge Deller <deller@gmx.de>
>   *
>   *  Very basic HP Human Interface Loop (HIL) driver.
>   *  This driver handles the keyboard on HP300 (m68k) and on some
> @@ -89,7 +89,7 @@ MODULE_LICENSE("GPL v2");
>  #define	HIL_READKBDSADR	 	0xF9
>  #define	HIL_WRITEKBDSADR 	0xE9
>  
> -static unsigned int hphilkeyb_keycode[HIL_KEYCODES_SET1_TBLSIZE] =
> +static unsigned int hphilkeyb_keycode[HIL_KEYCODES_SET1_TBLSIZE] __read_mostly =
>  	{ HIL_KEYCODES_SET1 };
>  
>  /* HIL structure */
> @@ -211,6 +211,7 @@ hil_keyb_init(void)
>  		return -ENODEV; /* already initialized */
>  	}
>  
> +	spin_lock_init(&hil_dev.lock);
>  	hil_dev.dev = input_allocate_device();
>  	if (!hil_dev.dev)
>  		return -ENOMEM;

>from here....

> @@ -295,7 +296,9 @@ err3:
>  	free_irq(HIL_IRQ, hil_dev.dev_id);
>  err2:
>  	release_region(HILBASE + HIL_DATA, 2);
> +#if defined(CONFIG_HP300)
>  err1:
> +#endif
>  	input_free_device(hil_dev.dev);
>  	hil_dev.dev = NULL;
>  	return err;

Can you drop this ^^ piece of this patch ?
Cyrill V. Gorcunov's (<gorcunov@gmail.com>) HP300 patches from a few days ago are more correct since they include the release_region() call.

Or, if you want, I can resend this whole patch against your input-tree ?
Just let me know...

Helge


> @@ -307,7 +310,7 @@ static int __init
>  hil_init_chip(struct parisc_device *dev)
>  {
>  	if (!dev->irq) {
> -		printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%08lx\n", dev->hpa.start);
> +		printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%08lux\n", (unsigned long)dev->hpa.start);
>  		return -ENODEV;
>  	}
>  
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
