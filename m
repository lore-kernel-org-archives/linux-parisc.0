Return-Path: <christoph.plattner@gmx.at>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9225D4854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Jan 2004 16:34:54 -0700 (MST)
Message-ID: <4005D218.5000803@gmx.at>
Date: Thu, 15 Jan 2004 00:34:48 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6 & pdc_console pb on c110: "Warning: unable
	to open an initial console."
References: <400324B6000002CE@ocpmta1.freegates.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

sorry  have no idea for the hang up on boot!
BUT: experiments with the MUX driver has show, that
using not ttyB0 (but 1,2...) there system also
hangs up.
BUT: This is no explanation for this problem here.
The PDC console driver calls the "BIOS-like" routines
for printing out (and polling keys !).
All the "printk()" are printed directly (without my
PDC console driver), and everything running via
"/dev/console" or "/dev/ttyB0" goes through the
driver. Is the kernel so far, that an `open(
"/dev/console"' is already called (just done in
kernel before calling "/sbin/init" or "/bin/sh") ?

Christoph


Joel Soete wrote:
> Hello Christoph,
> 
> 
>>Anyway, the PDC driver should work for all architectures, independent of
>>the serial type (this was my concept of this driver).
>>
>>Is the driver fully ported to the 2.6 kernel ?
>>In the first log, the line "Warning: unable to open an initial console."
>>was shown, so the open on this device fails !
>>Futher there is no PDC driver registered under proc/devices !
> 
> 
> That a better explanation ;) (afaik there are some changes from 2.4 to 2.6
> driver's implementation and also some paper about the subject, I will see)
> 
> 
>>I have never tested a 2.6 kernel on a HP.
> 
> 
> Another question: I also try it with 2.4 (32 or 64 bit kernel) running on
> a b2k.
> But this b2k is equiped with an ide cdrom and when I try to boot a kernel
> with builtin pdc driver (2.4 and 2.6), the boot process hung (the green led
> of the cdrom stay continuously bright, so it seems a pb of initialization
> in the pdc_console driver?. This pb also occurs even if I unplug the cdrom-drive
> or remove ide-cdrom driver from kernels. otc kernels boot well with builtin
> ide-cdrom driver without pdc_console driver)
> 
> Any other idea?
> 
> Thanks again,
>     Joel
> 
> 
> 
> 
> Christoph
> 
> 
> Helge Deller wrote:
> 
>>On Saturday 27 December 2003 22:00, Joel Soete wrote:
>>
>>
>>
>>>I try to see if pdc_console could be operational on my c110 with kernel
>>
> 2.6.0-pa5.
> 
>>>So I uncheck serial_mux and check pdc_console with make menuconfig (edit
>>
> also pdc_cons.c to define EARLY_BOOTUP_DEBUG)
> 
>>>Then I create the special file "mknod
>>
>>/dev/ttyB0 c 11 0", add "TB0:12345:respawn:/sbin/getty 38400 ttyB0" in /etc/inittab
>>
>>>(I also try to apply Richard patch <http://lists.parisc-linux.org/pipermail/parisc-linux/2002-May/016384.html>)
>>>
>>>But no way to make it works?
>>>
>>>Linux 
>>
>>ersion 2.6.0-pa5 (root@hpalin) (gcc version 3.3.3 20031206 (prerelease)
> 
> 3FP[0] enabled: Rev 1 Model 11 
> 
>>>                              The 32-bit Kernel has started...
>>>Initialized PDC Console for debugging.
>>>Determining PDC firmware type: Syste
>>
>>Map.
>>
>>>model 000058e0 00000481 00000000 00000002 77e47570 100000f1 00000004 0000008a
>>
> 0avers  0000000d
> 
>>>CPUID vers 11 rev 13 (0x0000016d)
>>>model 9000/777/C110
>>>Total Memory: 128 Mb
>>>[snip]
>>>Soft power switch enabled, polling @ 0xf0140000.
>>
>>Console: switching to colour frame buffer device 128x48
>>
>>>pty: 256 Unix98 ptys configured
>>>lp: driver loaded but no devices found
>>>Generic RTC Driver v1.07
>>>Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
>>>ttyS0 at MM
>>
>>O 0xffd05800 (irq = 90) is a 16550A
>>
>>>ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A
>>
>>
>>Your machine has standard serial ports. So why do you want to
>>switch on serial_mux stuff when it's not needed (and not possible
>>since the device is
>>not present in your machine) ?
>>
>>Helge
>>_______________________________________________
>>parisc-linux mailing list
>>parisc-linux@lists.parisc-linux.org
>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
>>
> 
> 
> 
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
