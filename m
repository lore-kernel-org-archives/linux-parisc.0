Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C2C24829
	for <parisc-linux@parisc-linux.org>; Wed, 13 Nov 2002 15:44:48 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18C6FY-0007ze-00; Wed, 13 Nov 2002 22:44:44 +0000
Date: Wed, 13 Nov 2002 22:44:43 +0000
From: Matthew Wilcox <willy@debian.org>
To: Ryan Bradetich <rbrad@uswest.net>
Cc: Matthew Wilcox <willy@debian.org>, Tom <palinux@alaskatech.org>,
	PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] LONG pause on boot
Message-ID: <20021113224443.R30392@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0211131022210.26859-100000@wolf.alaskatech> <20021113193018.P30392@parcelfarce.linux.theplanet.co.uk> <20021113214613.GA32441@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021113214613.GA32441@beavis.ybsoft.com>; from rbrad@uswest.net on Wed, Nov 13, 2002 at 02:46:13PM -0700
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Nov 13, 2002 at 02:46:13PM -0700, Ryan Bradetich wrote:
> Willy, I have an idea on how to fix this, but it is ugly ... but I will probably
> consider committing it soon unless you have a cleaner idea (hint, hint :))

Well.  I have an idea, but it's even uglier than yours ;-)  It doesn't suffer
from the same problem, so I'll describe it...

> I have a proposal to speed up systems where the devices are at the end of the
> bus ... we can simply walk the first bus range, then the last bus range, if
> nothing found yet ... walk the middle.

here's the current code:

#define READ_IO_IO_LOW(dev) \
        (dev->id.hw_type == HPHW_IOA ? \
                __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_i
o_low) << 16 : \
                __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_i
o_low))

#define READ_IO_IO_HIGH(dev) \
        (dev->id.hw_type == HPHW_IOA ? \
                __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_i
o_high) << 16 : \
                __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_i
o_high))


static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_high, 
                            struct parisc_device *parent);

#define FLEX_MASK (unsigned long)0xfffffffffffc0000

void walk_lower_bus(struct parisc_device *dev)
{
        unsigned long io_io_low, io_io_high;

        if(!BUS_CONVERTER(dev) || IS_LOWER_PORT(dev))
                return;

        io_io_low = ((unsigned long)(signed int)READ_IO_IO_LOW(dev) + ~FLEX_MASK
) & FLEX_MASK;
        io_io_high = ((unsigned long)(signed int)READ_IO_IO_HIGH(dev) + ~FLEX_MA
SK) & FLEX_MASK;

        walk_native_bus(io_io_low, io_io_high, dev);
}

My proposal...

#define IO_IO_LOW	offsetof(struct bc_module, io_io_low)
#define IO_IO_HIGH	offsetof(struct bc_module, io_io_high)
#define READ_IO_IO_LOW(dev) __raw_readl(dev->hpa + IO_IO_LOW)
#define READ_IO_IO_HIGH(dev) __raw_readl(dev->hpa + IO_IO_HIGH)

void walk_lower_bus(struct parisc_device *dev)
{
	unsigned long io_io_low, io_io_high;

	if (!BUS_CONVERTER(dev) || IS_LOWER_PORT(dev))
		return;

	if (dev->id.hw_type == HPHW_IOA) {
		io_io_low = (unsigned long)(signed int)(READ_IO_IO_LOW(dev) << 16);
		io_io_high = io_io_low + MAX_NATIVE_DEVICES * NATIVE_DEVICE_OFFSET;
	} else {
		io_io_low = (READ_IO_IO_LOW(dev) + ~FLEX_MASK) & FLEX_MASK;
		io_io_high = (READ_IO_IO_HIGH(dev)+ ~FLEX_MASK) & FLEX_MASK;
	}
	walk_native_bus(io_io_low, io_io_high, dev);
}

-- 
Revolutions do not require corporate support.
