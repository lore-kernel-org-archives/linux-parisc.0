Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA17091
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 06:04:02 -0600
Message-ID: <20000518120342.6224.qmail@web515.mail.yahoo.com>
Date: Thu, 18 May 2000 05:03:42 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] 715/50 hang - more info
To: Chris Snow <csnow@julian.uwo.ca>, parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Chris,

I had the same problem on my 715/33 with lasi_82596.c.
I emailed Helge Deller who made the last changes to
this driver and he told me that there seems to be the
problem that not all interrupts from the i82596 are
delivered to the interrupt routine. The result of this
is that all 16 xmit buffers will get filled and then
the kernel hangs.

He also told me that he will have no time until 23rd
of May (approx.) to find the reason for this and to
correct it. So right now there is no way to use
NFSROOT on a 715/old.

Bob Pflederer's observations concerning I82596_DEBUG
are correct. But it is sufficient to #define it to 3
to make the driver work.

Ulrich  
--- Chris Snow <csnow@julian.uwo.ca> wrote:
> 
> I managed to find some widgets and hook the serial
> output of the HP to my
> PC, so I'm sending along the entire boot output, as
> well as my .config.
> 
> 
> output:
> ------
>               (c) Copyright Hewlett-Packard Company,
> 1991, 1992
> Portions of this code are (c) Copyright Samsung
> Electronics Co., Ltd, 91,
> 92 
> 
> PDC ROM rev. 1.3
> IODC ROM rev. 1.1
> 32 MB of memory have been configured.
> 
> 
> Selecting a system to boot.
> To stop selection process, press and hold the ESCAPE
> key.
> 
> Booting from:     lan.00a024-95c59e.3.6     boy
> 
> Hard booted.
> palo ipl chris@boy Wed May 17 18:19:21 EDT 2000
> 0/vmlinux 1991268 bytes @ 0x7800
> 0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX
> root=/dev/nfs
> nfsroot=192.168.1.2'
> Kernel: partition 0 file /vmlinux
> ELF32 executable
> prepare_loadable 0050368c 2
> 
> Entry 0010182c first 00100000 n 3
> Segment 0 load 00100000 size 1123464 mediaptr 0x1000
> Segment 1 load 00214000 size 158452 mediaptr
> 0x114000
> Segment 2 load 0023c000 size 8192 mediaptr 0x13b000
> branching to kernel entry point 0x0010182c
> The Kernel has started...
> Free memory starts at: 0xc02a8000
> PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs
> nfsroot=192.168.1.2'
> PALO initrd 0-0
> FP CCR was 0x0, will be set to 0xc0
> model   00003100 00000481 00000000 00000000 7816bc26
> ffffffff 00000004
> 0000000a 0000000a
> vers    0000000b
> CPUID vers 0 rev 0
> CPU(s): 1 x PA7100 at 50.000000 MHz
> Searching for devices in PDC firmware...  an older
> box...
> Found devices:
> 1. Stinger Optional Graphics (10) at 0xf4000000,
> versions 0x6, 0x0, 0x77,
> 0x0, 0x0
> 2. Scorpio Core BA (11) at 0xf082f000, versions 0x7,
> 0x0, 0x70, 0x0, 0x0
> 3. Scorpio Core SCSI (10) at 0xf0825000, versions
> 0x7, 0x0, 0x71, 0x0, 0x0
> 4. Scorpio Core LAN (802.3) (10) at 0xf0826000,
> versions 0x7, 0x0, 0x72,
> 0x0, 0x0
> 5. Scorpio Core HIL (10) at 0xf0821000, versions
> 0x7, 0x0, 0x73, 0x0, 0x0
> 6. Scorpio Core RS-232 (10) at 0xf0823000, versions
> 0x7, 0x0, 0x75, 0x0,
> 0x0
> 7. Scorpio Core RS-232 (10) at 0xf0822000, versions
> 0x7, 0x0, 0x75, 0x0,
> 0x0
> 8. Scorpio Core Centronics (10) at 0xf0824000,
> versions 0x7, 0x0, 0x74,
> 0x0, 0x09. Scorpio Audio (10) at 0xf1000000,
> versions 0x7, 0x0, 0x7b, 0x0,
> 0x0
> 10. Scorpio EISA BA (11) at 0xfc000000, versions
> 0x7, 0x0, 0x76, 0x0, 0x0
> 11. Scorpio (715/50) (0) at 0xfffbe000, versions
> 0x310, 0x0, 0x4, 0x0,
> 0x81
> 12. Scorpio (1) at 0xfffbf000, versions 0x17, 0x0,
> 0x9, 0x0, 0x0
> That's a total of 12 devices.
> Linux version 2.3.99-pre1 (chris@boy) (gcc version
> 2.9-hppa-991112) #8 Wed
> May 17 18:18:58 EDT 2000
> initrd: 00000000-00000000
> pagetable_init
> On node 0 totalpages: 8192
> zone(0): 4096 pages.
> zone(1): 4096 pages.
> zone(2): 0 pages.
> trap_init
> Calibrating delay loop... 42.19 BogoMIPS
> Memory: 29436k available
> kmem_test() - start
> kmem_free: Bad front redzone (objp=c1ffe004,
> name=test-cachep)
> kmem_free: Bad rear redzone (objp=c1ffe004,
> name=test-cachep)
> kmem_test() - finished
> c1ff0000 c1ff8000 c1fee000 c1ffc000
> Buffer-cache hash table entries: 1024 (order: 0,
> 4096 bytes)
> Page-cache hash table entries: 8192 (order: 3, 32768
> bytes)
> POSIX conformance testing by UNIFIX
> ASP version 1 at 0xf0800000 found.
> request_irq(259, c01bfd00, 0x0, asp, c1fe9080)
> ASP IRQ 259 EIM 0xfffe0003
> busdevice_alloc_irq(0xf0823000) on ASP 0x200 + 26 =
> 538
> Found serial #0 at 0xf0823000, IRQ 538
> ttyS00 at iomem 0xf0823800 (irq = 538) is a 16550A
> busdevice_alloc_irq(0xf0822000) on ASP 0x200 + 25 =
> 537
> Found serial #1 at 0xf0822000, IRQ 537
> ttyS00 at iomem 0xf0822800 (irq = 537) is a 16550A
> busdevice_alloc_irq(0xf0826000) on ASP 0x200 + 23 =
> 535
> Found i82596 at 0xf0826000, IRQ 535
> early initialization of device eth0 is deferred
> Linux NET4.0 for Linux 2.3
> Based upon Swansea University Computer Society
> NET3.039
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP: Hash tables configured (established 2048 bind
> 2048)
> Starting kswapd v1.6
> Serial driver version 4.92 (2000-1-27) with
> MANY_PORTS SHARE_IRQ
> SERIAL_PCI enabled
> pty: 256 Unix98 ptys configured
> RAMDISK driver initialized: 16 RAM disks of 4096K
> size 1024 blocksize
> 82596.c: MAC of HP700 LAN blindely read from the
> prom!
> eth0: 82596 at 0xf0826000, 08 00 09 62 82 1E IRQ
> 535.
> lasi_82596.c:v1.2 02/13/2000
> eth0: lp at 0xc1fd4000 (1720 bytes), lp->scb at
> 0xc1fd4014
> request_irq(535, c01baea8, 0x0, i82596, c1fecc00)
> busdev_enable_irq(c1fe9080, 23) ASP: IMR 0x100
> busdev_disable_irq(c1fe9080, 23) ASP: IMR 0x0
> 
> ----- end of output
> 
> and here is my .config (it is the default, I haven't
> changed anything...)
> 
> .config
> -------
> #
> # Automatically generated make config: don't edit
> #
> CONFIG_PARISC=y
> # CONFIG_UID16 is not set
> 
> #
> # Code maturity level options
> #
> CONFIG_EXPERIMENTAL=y
> 
> #
> # General options
> #
> # CONFIG_SMP is not set
> CONFIG_GSC=y
> CONFIG_GSC_LASI=y
> CONFIG_PCI=y
> CONFIG_GSC_DINO=y
> # CONFIG_PCI_LBA is not set
> 
> #
> # Loadable module support
> #
> # CONFIG_MODULES is not set
> 
> #
> # General setup
> #
> CONFIG_NET=y
> CONFIG_SYSVIPC=y
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_SYSCTL is not set
> CONFIG_BINFMT_SOM=y
> # CONFIG_BINFMT_ELF is not set
> # CONFIG_BINFMT_MISC is not set
> # CONFIG_BINFMT_JAVA is not set
> 
> #
> # Block devices
> #
> 
=== message truncated ===


__________________________________________________
Do You Yahoo!?
Send instant messages & get email alerts with Yahoo! Messenger.
http://im.yahoo.com/
