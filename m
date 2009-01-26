From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: parisc: struct device - replace bus_id with dev_name(),
	dev_set_name()
Date: Mon, 26 Jan 2009 13:27:48 +0100
Message-ID: <ac3eb2510901260427p5f2bbeedv57368043a88dd1f4@mail.gmail.com>
References: <1232923996.2924.17.camel@nga>
	 <20090126045523.GB4376@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	gregkh <gregkh@suse.de>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090126045523.GB4376@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jan 26, 2009 at 05:55, Grant Grundler <grundler@parisc-linux.org> wrote:
> On Sun, Jan 25, 2009 at 11:53:16PM +0100, Kay Sievers wrote:
>> From: Kay Sievers <kay.sievers@vrfy.org>
>> Subject: parisc: struct device - replace bus_id with dev_name(), dev_set_name()
>
> In general, no objection. Just one nit below.
>
> Otherwise, please add:
> Reviewed-by: Grant Grundler <grundler@parisc-linux.org>

>>               printk(KERN_ERR "Dino: cannot attach bus %s\n",
>> -                    bus->bridge->bus_id);
>> +                    dev_name(bus->bridge));
>
> I think the "cannot attach bus" string needs to be changed to
> "cannot attach dev" or whatever dev_name() is supposed to represent.

The code probably uses a "struct device" to represent a "bus", which
sounds fine because the "devices" are more "objects" than "devices"
sometimes.

> While the code in include/linux/device.h is using "bus_id",
> the comments say:
>
> static inline const char *dev_name(const struct device *dev)
> {
>        /* will be changed into kobject_name(&dev->kobj) in the near future */
>        return dev->bus_id;
> }

It's the "name" of a "device", the comment has already gone away with
the final patch in the bus_id series.

Thanks,
Kay
