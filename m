Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D4AB4891
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  2 Jan 2004 20:28:35 -0700 (MST)
Subject: Re: [parisc-linux] 2.6 & pdc_console pb on c110: "Warning: unable
	to open an initial console."
From: Ryan Bradetich <rbradetich@uswest.net>
To: Joel Soete <soete.joel@tiscali.be>
In-Reply-To: <3FEDF301.5030901@tiscali.be>
References: <3FEDF301.5030901@tiscali.be>
Content-Type: text/plain
Message-Id: <1073100507.1555.6.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Fri, 02 Jan 2004 20:28:28 -0700
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Joel,

Even though you should not need the pdc_console for what you want to do,
pdc_console should work in theory.  It probably needs to be updated to
work with the 2.6 kernel.  I will add this to my TODO list.

Thanks,

- Ryan


On Sat, 2003-12-27 at 14:00, Joel Soete wrote:
> Hi all,
> 
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
> [snip]
> Freeing unused kernel memory: 504k freed
> Warning: unable to open an initial console.
> Adding 131832k swap on /dev/md1.  Priority:-1 extents:1
> EXT3 FS on md2, internal journal
> [snip]
> ....eth0: link ok.
> 
> Debian GNU/Linux testing/unstable hpalin ttyS0
> 
> hpalin login:
> 
> In th syslog I also notice:
> [snip]
> Dec 27 21:45:03 hpalin init: Id "TB0" respawning too fast: disabled for 5 minutes
> Dec 27 21:52:15 hpalin init: Id "TB0" respawning too fast: disabled for 5 minutes
> [snip]
> 
> And don't find any such device with:
> # cat /proc/devices
> Character devices:
>    1 mem
>    2 pty
>    3 ttyp
>    4 /dev/vc/0
>    4 tty
>    4 ttyS
>    5 /dev/tty
>    5 /dev/console
>    5 /dev/ptmx
>    6 lp
>    7 vcs
>    9 st
>   10 misc
>   13 input
>   14 sound
>   21 sg
>   29 fb
>   36 netlink
> 128 ptm
> 136 pts
> 180 usb
> [snip]
> 
> Any idea? (what should I do wrongly?)
> 
> Thanks in advance for attention,
> 	Joel
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
