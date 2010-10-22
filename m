From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: C8000 cpu upgrade problem
Date: Fri, 22 Oct 2010 14:09:26 -0400
Message-ID: <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 22, 2010 at 10:07 AM, Mikulas Patocka
<mikulas@artax.karlin.mff.cuni.cz> wrote:
> I have a C8000 workstation with one PA8800 900MHz CPU (the motherboard has
> two sockets), I installed Linux via serial console on it and it seems to
> be running quite fine (I had to plug a PCI serial card because Linux
> doesn't recognize the on-board serial ports or videocard).
>
> When I inserted anober PA8800 900MHz CPU (taken from another workstation)
> to the second socket on the motherboard, the boot firmware writes a
> warning "Too many CPUs for this system.", drops into the boot menu and
> refuses to load an operating system.
>
> Do you have some idea how to solve it? I.e. switch something in the
> firmware, load new firmware (I have FW 2.13 BMC 02.32), or get some tool
> from HP that can allow the second processor on this workstation?
>
> (note, this is not Linux kernel problem at all because the firmware
> doesn't even start Linux)

AFAIK you can't add a second CPU without an HP technician enabling the
firmware for a second CPU.

The same goes for enabling additional PCI slots.

Cheers,
Carlos.
