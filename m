Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] iodc call and HPMC: dump driver. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Mon, 02 Sep 2002 08:12:26 +0200." <3D73014A.15ED96ED@admin.france.hp.com>
References: <3D73014A.15ED96ED@admin.france.hp.com> 
Date: Mon, 02 Sep 2002 21:42:12 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020903034212.A638A4829@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> 	Hi all.
> Do you know a guy who is a guru of iodc calls ?

I'm not expert, but I've mucked with it abit.

> I'm still stuck with this. I think I was really near the
> solution. Now my iodc call create beatifull HPMC.

Which platform are you testing on?
32 or 64-bit kernel?

> Take a look to this call, I was thinking that it
> was all right, but there is still something wrong.
> now i'm able to retrieve hpa,
> I based this on palo code:
> 
> ret =  real32_call(PAGE0->mem_boot.iodc_io, (unsigned long)PAGE0->mem_boot.hp
>   a, DUMPDEV_WRITE,
>   PAGE0->mem_boot.spa, __pa(PAGE0->mem_boot.dp.layers), __pa(pdc_result), dev
>   addr, __pa(iodc_dbuf), 2048);

Can you dump the values for the call that HPMCs?
I'm not sure what is supposed to be passed as arguments to IODC.
I'm trying to find it in the documentation I have and then I
can verify the values are sane.

Note that all IODC is 32-bit.
And earlier IODC versions don't like byte addresses greater than 2GB.
Not sure when that got fixed but it certainly wasn't on 712
or similar workstations/servers. It wasn't even noticed as a problem
until HP started shipping 4GB disk drives (ie 1997 or so).

later IODC included a "block" interface which use block address
instead of byte address. I'll try to find documentation on this.

> DUMPDEV_WRITE = 1
> static unsigned long pdc_result[32] __attribute__ ((aligned (8))); 
> static char __attribute__((aligned(64))) iodc_dbuf[DUMP_PAGE_SZ];
> 
> and devaddr=191889408

191889408 == 0xB7000000
If this is the target byte address on the block device, it's too big.


> Disk /dev/sda: 64 heads, 32 sectors, 17366 cylinders
> Units = cylinders of 2048 * 512 bytes
> 
> /dev/sda1   *         1        61     62448   f0  Linux/PA-RISC boot
> /dev/sda2            62       183    124928   83  Linux
> /dev/sda3           184      1648   1500160   82  Linux swap
> /dev/sda4          1649     17366  16095232    5  Extended
> /dev/sda5          1649      5554   3999728   83  Linux
> /dev/sda6          5555      9460   3999728   82  Linux swap
> /dev/sda7          9461     13366   3999728   83  Linux
> /dev/sda8         13367     17366   4095984   83  Linux

which of these are you trying to write to?
sda3?

> Do you know someone who is well aware of iodc calls ?
> I want to discuss a bit about this.

hmm...inside HP there are a few people who've mucked with IODC.
Let's see if we can figure it out here first.

thanks,
grant
