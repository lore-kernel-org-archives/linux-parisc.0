From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: PCI video card hangs during system boot
Date: Thu, 14 Apr 2016 10:14:31 +0200
Message-ID: <CACrbsaBOV3vqbwRp1i2aXA0FqgMGbuw_-9KnudnVjSwo-SW2Xg@mail.gmail.com>
References: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
	<1587186.CtnrnCsSzp@caliban.sf-tec.de>
	<570D38BF.7040307@bell.net>
	<CACrbsaBBT20+_GtJD3XMxob7Pz+mhdw7BE0h3uQSpKq-VSOHYA@mail.gmail.com>
	<570E5F69.4010203@bell.net>
	<CAFk90B_oAkq=JD0msjm2ZM2oZWAUd6yqh-XnC1Kk4HKHGOBt0w@mail.gmail.com>
	<4E86DE96-4108-41F1-872C-F7E04075466A@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Graham Gower <graham.gower@gmail.com>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E86DE96-4108-41F1-872C-F7E04075466A@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Do you know if c8000 can setup any non HP card (e.g., ATI Rage XL)?  It was reported that
> some old cards would work with PDC firmware in unaccelerated fb mode, but c8000 has
> x86 emulator so it might be able to enable accelerated 2d/3d.

Good hint. I have several "vintage" PCI video cards to try (including
ATI RAGE, Vodoo, etc.) but I can't because the have 5V PCI interface.
HP c8000 have several PCI slots BUT PCI 3.3 volt ONLY. Find
"universal" 5V/3V PCI card is possible but the only cards that I have
find (the ATI 9200 128Mega) fails at "BIOS" time (see the first
message of this thread).

I'm accumulating several indirect evidences that the primary source of
the problem is not the video driver (both "radeon" and "nouveau" fail)
or the bus interface (degrading APG to PCI using video driver options
at Linux kernel boot time does not change the final results; the only
PCI video card that I was able to find, if fails at BIOS time).

Indirect evidences point the ZX1 chipset. For instance, on my c8000
with FireGL X1, if I add more than 8G DRAM, Linux boot fails (kernel
panic) during "radeon" loading. If I remove the video card and I use
the workstation as "server" via serial port or Ethernet, I can upgrade
to 16 Giga DRAM (8 x 2GB modules) with zero issue. I will open another
specific thread with the details soon.

Few days ago, I have mismatched the memory modules; the c8000 was able
to start Linux boot but I had a kernel panic during "radeon" loading.

As Helge has already point out, the only debug option is to recompile
the kernel with some "printk" in stategic point, hoping to be able to
find the primary source of this _very_nasty_ issue.

  Simone Mannori - ITALY
