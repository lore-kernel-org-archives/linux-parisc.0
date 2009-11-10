From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: pci 0000:01:04.0: BAR 0: no parent found for of device
Date: Tue, 10 Nov 2009 17:56:34 +0100
Message-ID: <20091110165634.GA7228@raptus.dandreoli.com>
References: <4AF099F7.10903@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Matthew Wilcox <matthew@wil.cx>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AF099F7.10903@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 03, 2009 at 10:00:39PM +0100, Helge Deller wrote:
> Hi all,

hi,

> Something broke the stifb graphics driver in 2.6.32-rc5 (Linus' current head).

mine was a PCI controller for additional USB ports or maybe the MGA
graphic controller, i don't rememer. i will check ;)

> Somehow it seems, that the PCI subsystem does not activate this PCI slot:
> 
> Linux version 2.6.32-rc5-32bit (deller@p100) (gcc version 4.4.1 (GCC) ) #157 Tue Nov 3 21:49:24 CET 2009
> ...
> Searching for devices...
> Found devices:
> 1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
> 2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
> 3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
> 4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
> 5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
> 6. Allegro W2 at 0xfffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
> 7. Memory at 0xfed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
> CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
> Setting cache flush threshold to 780 (1 CPUs online)
> SBA found Astro 2.1 at 0xfed00000
> Elroy version TR4.0 (0x5) found at 0xfed30000
> PCI: Enabled native mode for NS87415 (pif=0x8f)
> Elroy version TR4.0 (0x5) found at 0xfed32000
> pci 0000:01:04.0: BAR 0: no parent found for of device [0xfa000000-0xfbffffff]
> 			^^^  HERE

i had a couple of these messages and also a couple of BAR collisions
on my J5600, recently booted with 2.6.32-rc6.

these threads seem related:

  http://lkml.org/lkml/2009/8/2/82
  http://lkml.org/lkml/2009/11/9/356

i will try to learn something new later, when I turn on my hppa box later.

cheers,
Domenic

-----[ Domenico Andreoli, aka cavok
 --[ http://www.dandreoli.com/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
