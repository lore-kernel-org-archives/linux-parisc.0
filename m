From: Grant Grundler <grundler@parisc-linux.org>
Subject: timer_interrupt delayed messages 2.6.27-rc7
Date: Tue, 30 Sep 2008 23:59:53 -0600
Message-ID: <20081001055953.GC7348@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hey,
I tested two 2.6.27-rc7 kernels on an a500.
The first had CONFIG_HZ=250 and was getting the following messages:
timer_interrupt(CPU 1): delayed! cycles 100001A37 rem 8C237  next/now 4A954C3C1C/4B954C5653
timer_interrupt(CPU 0): delayed! cycles 100000E07 rem 8B607  next/now 4A95B8EAF5/4B95B8F8FC
timer_interrupt(CPU 1): delayed! cycles 1000009CB rem 8B1CB  next/now 4B956525DC/4C95652FA7
timer_interrupt(CPU 0): delayed! cycles 100000931 rem 8B131  next/now 4B95D1D4B5/4C95D1DDE6
...

Since 8B131+931 looks remarkably close to 550 Mhz/1000, I decided to
try a CONFIG_HZ=1000 kernel and now get the following:
timer_interrupt(CPU 1): delayed! cycles 100001C74 rem 6004  next/now 2BFD187FEA/2CFD189C5E
timer_interrupt(CPU 1): delayed! cycles 100000E8A rem 521A  next/now 2CFD20A0CA/2DFD20AF54
timer_interrupt(CPU 1): delayed! cycles 100000A33 rem 4DC3  next/now 2DFD28C1AA/2EFD28CBDD
timer_interrupt(CPU 1): delayed! cycles 100000C87 rem 5017  next/now 2EFD30E28A/2FFD30EF11
...

Note that CPU0 no longer reports this error.
I suspect we have two bugs in play here.

The first one might be we have some basic bug in how the itimer is
getting programmed.  I suspect it's always off by 32-bits because IIRC
we can only program the lower 32-bits of CR16. I suspect the comparison
code gets the 32-bit rollover wrong. Is that enough clues for someone to
spot this?

The second might be 1000HZ (or 1024?) is still hardcoded in our source
code someplace.  I can't otherwise explain the "rem" values dropped more
than 4x while the "cycles" value is roughly the same (2^32 + about 0x1000).
Also CPU0 stopped reporting this error. Initialization for CPU0 is different
and those might be useful clues too.

thanks,
grant
