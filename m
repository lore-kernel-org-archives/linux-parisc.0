From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Get your Matrox PCI cards out of the basement ...
Date: Thu, 3 Jun 2004 04:23:04 +0100
Message-ID: <20040603032304.GA22448@sal.ucc.ie>
References: <20040602221734.GA26176@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040602221734.GA26176@solo.franken.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 03, 2004 at 12:17:34AM +0200, Thomas Bogendoerfer wrote:

> ....I got the matroxfb driver working on my B2600 including X on top
> of fbdev (the mga driver doesn't work yet). So far I just used
> a very old Matrox Millenium I. Below is the necessary patch for
> 2.6.7-rc1.

I tried 2.6.7-rc2-pa1 with your patch (which applies fine),
but I wasn't successful in getting the card to work.
BTW, I'm running Debian/testing updated today.

I tried with the "VGA BIOS" dip switch set on and off,
I also tried the "init", "mem" boot parameters and different
video resolution modes. I even tried to swich it to another PCI slot,
 but no success (the Voodoo2 works in the PCI slots I tried).


The result is similar to what I had with the ATI Rage XL I
also tried to get working ... the graphics card is detected,
and accessible via /dev/fb0, and I can use fbset to change
the resoltions, but I don't see any output on my monitor(s) ...
is simply stays black!

There is also a error message when the matrox is detected on
boot:

beast kernel: matroxfb: Matrox Millennium (PCI) detected
beast kernel: matroxfb: Your Matrox device does not have BIOS
beast kernel: matroxfb: 640x480x8bpp (virtual: 640x3276)
beast kernel: matroxfb: framebuffer at 0xF4800000, mapped to 0xf4800000, size 2097152
beast kernel: fb0: MATROX frame buffer device
beast kernel: fb0: initializing hardware
beast kernel: matroxfb: Pixel PLL not locked after 5 secs
beast kernel: matroxfb: Loop PLL not locked after 5 secs


N.B. the "PLL not locked after 5 secs" messages also appear when
I try to change the resolution with fbset. fbset is busy for some
seconds (at first I thought the process locked up), but then returns
printing out those messages, and another 'fbset' (without arguments)
afterwards confirms that the resolution has been changed.
However the monitor stays black ...

Any hints?

Thanks,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
