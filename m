Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 90DF348BD
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 27 Dec 2003 16:19:58 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6 & pdc_console pb on c110: "Warning: unable to
	open an initial console."
Date: Sun, 28 Dec 2003 00:19:55 +0100
References: <3FEDF301.5030901@tiscali.be>
In-Reply-To: <3FEDF301.5030901@tiscali.be>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200312280019.55830.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Saturday 27 December 2003 22:00, Joel Soete wrote:
> I try to see if pdc_console could be operational on my c110 with kernel 2.6.0-pa5.
> 
> So I uncheck serial_mux and check pdc_console with make menuconfig (edit also pdc_cons.c to define EARLY_BOOTUP_DEBUG)
> Then I create the special file "mknod /dev/ttyB0 c 11 0", add "TB0:12345:respawn:/sbin/getty 38400 ttyB0" in /etc/inittab
> 
> (I also try to apply Richard patch <http://lists.parisc-linux.org/pipermail/parisc-linux/2002-May/016384.html>)
> 
> But no way to make it works?
> 
> Linux version 2.6.0-pa5 (root@hpalin) (gcc version 3.3.3 20031206 (prerelease) 3FP[0] enabled: Rev 1 Model 11 
>                                The 32-bit Kernel has started...
> Initialized PDC Console for debugging.
> Determining PDC firmware type: System Map.
> model 000058e0 00000481 00000000 00000002 77e47570 100000f1 00000004 0000008a 0avers  0000000d
> CPUID vers 11 rev 13 (0x0000016d)
> model 9000/777/C110
> Total Memory: 128 Mb
> [snip]
> Soft power switch enabled, polling @ 0xf0140000.
> Console: switching to colour frame buffer device 128x48
> pty: 256 Unix98 ptys configured
> lp: driver loaded but no devices found
> Generic RTC Driver v1.07
> Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
> ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
> ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A

Your machine has standard serial ports. So why do you want to
switch on serial_mux stuff when it's not needed (and not possible
since the device is not present in your machine) ?

Helge
