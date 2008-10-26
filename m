From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Linux 2.6.28-rc1: slab error in cache_alloc_debugcheck_after()
Date: Sun, 26 Oct 2008 17:23:37 -0500
Message-ID: <1225059817.3958.9.camel@localhost.localdomain>
References: <4904CF9F.8060405@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4904CF9F.8060405@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2008-10-26 at 21:14 +0100, Helge Deller wrote:
> Just tried 2.6.28-rc1:
> ....
> usbcore: registered new interface driver usbhid
> usbhid: v2.6:USB HID core driver
> TCP cubic registered
> NET: Registered protocol family 17
> RPC: Registered udp transport module.
> RPC: Registered tcp transport module.
> rtc-parisc rtc-parisc: setting system clock to 2008-10-26 19:59:18 UTC 
> (1225051158)
> usb 1-1: new low speed USB device using ohci_hcd and address 2
> usb 1-1: configuration #1 chosen from 1 choice
> input: Logitech N48 as /class/input/input0
> generic-usb 0003:046D:C001.0001: input,hidraw0: USB HID v1.00 Mouse 
> [Logitech N48] on usb-0000:00:0e.2-1/inpu0
> usb 1-1: New USB device found, idVendor=046d, idProduct=c001
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> usb 1-1: Product: N48
> usb 1-1: Manufacturer: Logitech
> usb 1-2: new low speed USB device using ohci_hcd and address 3
> usb 1-2: configuration #1 chosen from 1 choice
> slab error in cache_alloc_debugcheck_after(): cache `size-512': double 
> free, or memory outside object was oven
> Backtrace:
>   [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
>   [<101a5cac>] kmem_cache_alloc+0x1a0/0x1e8
>   [<1042e294>] hid_register_report+0x60/0xc4
>   [<1042e5f8>] hid_add_field+0x40/0x1a4
>   [<1042ec40>] hid_parser_main+0x94/0xc4

If it's a double free this is probably in the hid layer.

I have to say that ion (pa8900) boots just fine with 2.6.28-rc1. I have
HID support built, but nothing to activate it.

James


