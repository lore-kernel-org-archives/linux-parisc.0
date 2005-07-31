From: Richard Hirst <rhirst@levanta.com>
Subject: Re: [parisc-linux] cvs head arch/parisc/kernel/drivers.c issues
Date: Sun, 31 Jul 2005 10:00:05 +0100
Message-ID: <20050731090005.GD5500@levanta.com>
References: <20050730231056.GC5500@levanta.com>
	<20050731061254.GG21753@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050731061254.GG21753@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 31, 2005 at 02:12:54AM -0400, Kyle McMartin wrote:
> On Sun, Jul 31, 2005 at 12:10:56AM +0100, Richard Hirst wrote:
> > PDC Stable Storage facility v0.09
> > Backtrace:
> >  [<10128170>] __wake_up+0x54/0x84
> 
> Try disabling CONFIG_PDC_STABLE_STORAGE until this gets worked out.

Thanks, gets a bit further now:

...
...
16. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
17. Raven W 360 (9000/780) at 0xfffa0000 [32] { 0, 0x0, 0x5c6, 0x00004 }
18. Memory at 0xfffb1000 [49] { 1, 0x0, 0x097, 0x00009 }
CPU(s): 1 x PA8500 (PCX-W) at 367.111100 MHz
Setting cache flush threshold to 440 (1 CPUs online)
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xf2000000
DEV: registering device: ID = 'pci0000:00'
DEV: registering device: ID = '0000:00:13.0'
DEV: registering device: ID = '0000:00:14.0'
Cujo version 2.0 found at 0xf1000000
Enabling Cujo 2.0 bug workaround
DEV: registering device: ID = 'pci0000:01'
DEV: registering device: ID = '0000:01:04.0'
SCSI subsystem initialized
TC classifier action (bugs to netdev@vger.kernel.org cc hadi@cyberus.ca)
unwind_init: start = 0x10422e20, end = 0x10446880, entries = 9126
inotify syscall
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f1ff0000 (64 kB), fb at f6000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1024
sticon: Initializing STI text console.
Console: switching to colour STI console 128x48
Console: switching to colour frame buffer device 128x48
fb0: stifb 1024x768-8 frame buffer device, PCI_GRAFFITIX1024, id: 2d08c0a7, mmio
: 0xf6100000
Generic RTC Driver v1.07
serio: GSC PS/2 keyboard port at 0xffd08000 irq 20 @ 8:16:7


Then it hangs.  TOC shows it is in _spin_lock_irqsave() with a return
address in gscps2_interrupt().

Richard

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
