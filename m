Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5A8048AC
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Dec 2003 11:00:58 -0700 (MST)
Message-ID: <3FEF1A99.4010307@tiscali.be>
Date: Sun, 28 Dec 2003 18:02:01 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] 2.6 & pdc_console pb on c110: "Warning: unable
	to open an initial console."
References: <3FEDF301.5030901@tiscali.be> <200312280019.55830.deller@gmx.de>
In-Reply-To: <200312280019.55830.deller@gmx.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Helge Deller wrote:
> On Saturday 27 December 2003 22:00, Joel Soete wrote:
> 
>>I try to see if pdc_console could be operational on my c110 with kernel 2.6.0-pa5.
>>
>>So I uncheck serial_mux and check pdc_console with make menuconfig (edit also pdc_cons.c to define EARLY_BOOTUP_DEBUG)
>>Then I create the special file "mknod /dev/ttyB0 c 11 0", add "TB0:12345:respawn:/sbin/getty 38400 ttyB0" in /etc/inittab
>>
>>(I also try to apply Richard patch <http://lists.parisc-linux.org/pipermail/parisc-linux/2002-May/016384.html>)
>>
>>But no way to make it works?
>>
>>Linux version 2.6.0-pa5 (root@hpalin) (gcc version 3.3.3 20031206 (prerelease) 3FP[0] enabled: Rev 1 Model 11 
>>                               The 32-bit Kernel has started...
>>Initialized PDC Console for debugging.
>>Determining PDC firmware type: System Map.
>>model 000058e0 00000481 00000000 00000002 77e47570 100000f1 00000004 0000008a 0avers  0000000d
>>CPUID vers 11 rev 13 (0x0000016d)
>>model 9000/777/C110
>>Total Memory: 128 Mb
>>[snip]
>>Soft power switch enabled, polling @ 0xf0140000.
>>Console: switching to colour frame buffer device 128x48
>>pty: 256 Unix98 ptys configured
>>lp: driver loaded but no devices found
>>Generic RTC Driver v1.07
>>Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
>>ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
>>ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A
> 
> 
> Your machine has standard serial ports. So why do you want to
> switch on serial_mux stuff when it's not needed (and not possible
> since the device is not present in your machine) ?
> 
> Helge
> 
Helge,

Sorry I don't understand: where do you read that I switch on serial mux?

My goal is to test pdc_console mainly for EARLY_BOOTUP_DEBUG facility (for later b2k 64bit kernel pb).
Also afaik otc I have to switch off serial mux (well i say uncheck):
drivers/serial/Kconfig
[snip]
config PDC_CONSOLE
         bool "PDC software console support"
         depends on PARISC && !SERIAL_MUX && VT
         default n
[snip]?

Thanks in advance for more info,
	Joel
