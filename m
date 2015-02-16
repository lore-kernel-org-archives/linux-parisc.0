From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Video option for a big endian machine?
Date: Mon, 16 Feb 2015 12:15:49 -0500
Message-ID: <CADnq5_Pe4Rv1Yc710K8djKw0us1UO8w0OtE+aXfhXhf2xwWC+Q@mail.gmail.com>
References: <ABECBC9A-16AB-447B-BEDE-E113D1B258A9@gmail.com>
	<CADnq5_P237WcxtQgo0yrV4nsK9e95nukjNBWXAYMhibo=Co=Jw@mail.gmail.com>
	<CAPM=9txYixkb66PkYMypUsWEhEF25tieFtaGwdnj6_1fLOCZPA@mail.gmail.com>
	<5D8838EB-20BB-4162-A267-6C798F593D9D@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Dave Airlie <airlied@gmail.com>,
	Ilia Mirkin <imirkin@alum.mit.edu>,
	dri-users@lists.freedesktop.org,
	Parisc List <linux-parisc@vger.kernel.org>
To: lausgans@gmail.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5D8838EB-20BB-4162-A267-6C798F593D9D@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Feb 15, 2015 at 1:52 AM,  <lausgans@gmail.com> wrote:
> Thanks much for the answers, guys!
>
>> Ilia Mirkin <imirkin@alum.mit.edu>:
>>
>> With nouveau, you can generally get older cards to work
>
> Took a bunch of gf2mx and fx5500 cards I had access to. With Noveau they fail with "GPU lockup". The kernel version is 3.16.7.
> The issue chain is nouveau_fbcon_imageblit(): nouveau_fbcon_gpu_lockup() is called -> nv04_fbcon_imageblit(): while (dsize) { ... ret = RING_SPACE(chan, iter_len + 1); if (ret) return ret; /* -EBUSY at some iteration */ ... } -> nouveau_dma_wait() -> while (chan->dma.free < size) { get = READ_GET(chan, &prev_get, &cnt); if (unlikely(get == -EBUSY)) return -EBUSY; /* HERE */ ... }
>
>> Dave Airlie <airlied@gmail.com>:
>>
>> On 12 February 2015 at 00:44, Alex Deucher <alexdeucher@gmail.com> wrote:
>>> On Wed, Feb 11, 2015 at 3:53 AM,  <lausgans@gmail.com> wrote:
>>>> Hello.
>>>>
>>>> I'm looking for a PCI or AGP video card that would work on a Linux port for a big endian architecture (HP PA-RISC). Unfortunately the stock video options (ATI FireGL X1 and X3) give an incredibly slow unaccelerated 2D due to failure to kickstart the command processor (radeon open source driver). Neither folks from linux-parisc@ nor from dri-devel@ camps know how to fix this.
>>>>
>
>>>
>>> The X1 and X3 are really old asics and the risc specific versions
>>> tended to have special firmware for that platform that the open driver
>>> does not handle properly.  You might have better luck using a more
>>> modern GPU (e.g., an R5xx or newer based asic) with an x86 vbios.
>
> If the above is not some Nouveau miss, then it looks like it's some general architecture / chipset related code issue regarding ring buffer. I wonder how network card driver works then. Opinions?

NICs are generally much simpler and don't have large BAR windows for
vram access.  The driver for the on board NIC (if there is one) may
also have special handling for those specific boards.

Also note that a lot of information is stored in the vbios on the card
(number and type of connectors, encoder to connector routing, i2c bus
information, asic init sequences, clocks and voltages, etc.).  For
boards with special vbios images (like those or sun or mac boards) the
driver falls back to reasonable defaults which may not be always be a
good fit for the board.  Also, the driver only knows how to natively
post boards with x86 vbioses.  For everything else we really on the
vendor firmware to have already initialized and posted the card.

Alex

> There is a chipset specific drivers porting note: https://kernel.org/doc/ols/2002/ols2002-pages-183-190.pdf Though some parts of it are about IA64.
> CC to linux-parisc@
>
>> If memory serves PA-RISC had some restrictions on PCI BAR windows, it
>> wasn't just endianness problems.
>
> The only thing I've heard regarding this was:
> "The FireGL X1 / 256 AGP pro card used in the C8000 is a standard ATI part, but has a special video BIOS that reduces the PCI BAR space used by the card. The C8000 I/O space totals 256Mb, so using it all for the graphics wouldn't allow for any boot devices, etc."
> But then it's all on the vendor behalf, as the driver could read space sizes via PCI info functions.
>
>>
>> Dave.
>
