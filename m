From: Helge Deller <deller@gmx.de>
Subject: Re: resource_size_t printk woes...
Date: Thu, 01 Jan 2009 14:06:23 +0100
Message-ID: <495CBFCF.3010702@gmx.de>
References: <20081210040549.5E7E64EF0@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081210040549.5E7E64EF0@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>> On Mon, Dec 08, 2008 at 11:00:51AM -0500, Kyle McMartin wrote:
> Attached below is the change that I had.  Think this includes some
> additional locations to update.

Kyle,
in case you plan to include this patch from Dave in your linux-2.6 tree,
please DON'T INCLUDE this change to the "hilkbd.c" file:
  a/drivers/input/keyboard/hilkbd.c   2008-12-01 22:59:23.000000000 -0500
	-               printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%08lx\n", dev->hpa.start);
	+               printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%p\n", (void *)dev->hpa.start);

Reason:
I've sent another patch for hilkbd.c to the linux-input mailing list, 
which already includes this change (and I had forgotten about Dave's posting):
[PATCH] input/keyboard/hilkbd.c: fix crash when removing hilkbd module 
         http://permalink.gmane.org/gmane.linux.kernel.input/6266 
If you apply Dave's hilkbd changes, it may conflict if Linus pulls your parisc tree.
All other changes from Dave are OK.

Helge

PS: For the record, this are the other patches which I sent to linux-input:
[PATCH] input/HIL drivers: add MODULE_ALIAS() 
         http://permalink.gmane.org/gmane.linux.kernel.input/6267 
 
[PATCH] drivers/input/serio/hp_sdc.c: fix crash when removing hp_sdc module 
         http://permalink.gmane.org/gmane.linux.kernel.input/6268 
