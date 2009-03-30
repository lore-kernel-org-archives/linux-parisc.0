From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: delay in disc detection causes boot failure
Date: Mon, 30 Mar 2009 16:22:13 -0600
Message-ID: <20090330222213.GA18094@colo.lackof.org>
References: <49D118F7.5040809@seznam.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: AlesD <ales_d@seznam.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49D118F7.5040809@seznam.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 30, 2009 at 09:09:43PM +0200, AlesD wrote:
> Hello,
>
>  I have installed HP-PA port of Debian 5.0 and got into following problem.
>
> The root filesystem is on SW RAID. At the end of kernel initialization 
> comes reset on SCSI bus. After this reset it takes about 6 seconds before 
> the attached SCSI disks become "visible" and are detected by kernel. The 
> initialization process however goes on and during this 6s it tries to 
> assemble the MD device. Since the discs do not exist yet the assembly fails 
> and root filesystem is not found. The init script waits 3 minutes before 
> giving up - which would normaly do the trick if the root was directly in 
> one partition. With RAID (and LVM a top of it) the init ends with fiasco.

Is it possible this is due to a change in how the kernel detects devices?
Have you tried with "scsi_mod.scan=sync" boot time parameter?

drivers/scsi/Kconfig says:
config SCSI_SCAN_ASYNC
        bool "Asynchronous SCSI scanning"
        depends on SCSI
        help
          The SCSI subsystem can probe for devices while the rest of the
          system continues booting, and even probe devices on different
          busses in parallel, leading to a significant speed-up.

          If you have built SCSI as modules, enabling this option can
          be a problem as the devices may not have been found by the
          time your system expects them to have been.  You can load the
          scsi_wait_scan module to ensure that all scans have completed.
          If you build your SCSI drivers into the kernel, then everything
          will work fine if you say Y here.

          You can override this choice by specifying "scsi_mod.scan=sync"
          or async on the kernel's command line.

cheers,
grant

>
> To overcome this I put simple "sleep 30" in the initram scripts - just 
> before assembly of the MD device. I understand that this issue is more for 
> Debian, but before reporting ther I'd like to ask here:
> 1) does anyone here know, why there is the reset/delay during boot, and
> 2) and if message "Driver 'sd' needs updating - please use bus_type 
> methods" might have anything to do with this problem.
>
> Thanks in advance Ales Dolecek
>
> Mar 29 08:46:07 czapp005 kernel: imklog 3.18.6, log source = /proc/kmsg 
> started.
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] Initializing cgroup subsys 
> cpu
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] Linux version 
> 2.6.26-1-parisc (Debian 2.6.26-13lenny2) (dannf@debian.org) (gcc version 
> 4.1.3 20080704 (prerelease) (Debian 4.1.2-25)) #1 Tue Mar 17 13:15:40 UTC 
> 2009
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] FP[0] enabled: Rev 1 Model 
> 19
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] The 32-bit Kernel has 
> started...
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] console [ttyB0] enabled
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] Initialized PDC Console for 
> debugging.
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] Determining PDC firmware 
> type: System Map.
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] model 00005dc0 00000481 
> 00000000 00000002 77d75e12 100000f0 00000008 000000b2 000000b2
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] vers  00000203
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] CPUID vers 19 rev 7 
> (0x00000267)
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] capabilities 0x7
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] model 9000/785/C3700
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] Total Memory: 1024 MB
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] initrd: 4f7eb000-4ffee560
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] initrd: reserving 
> 3f7eb000-3ffee560 (mem_max 40000000)
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] On node 0 totalpages: 
> 262144
> Mar 29 08:46:07 czapp005 kernel: [    0.000000]   Normal zone: 2048 pages 
> used for memmap
> Mar 29 08:46:07 czapp005 kernel: [    0.000000]   Normal zone: 0 pages 
> reserved
> Mar 29 08:46:07 czapp005 kernel: [    0.000000]   Normal zone: 260096 
> pages, LIFO batch:31
> Mar 29 08:46:07 czapp005 kernel: [    0.000000]   Movable zone: 0 pages 
> used for memmap
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] LCD display at 
> f05d0008,f05d0000 registered
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] Built 1 zonelists in Zone 
> order, mobility grouping on.  Total pages: 260096
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] Kernel command line: 
> root=/dev/mapper/safe-system HOME=/ console=tty0 sti=10/6/2/0 
> sti_font=VGA8x16 TERM=linux palo_kernel=3/vmlinux
> Mar 29 08:46:07 czapp005 kernel: [    0.000000] PID hash table entries: 
> 4096 (order: 12, 16384 bytes)
> Mar 29 08:46:07 czapp005 kernel: [17179569.184000] Console: colour dummy 
> device 160x64
> Mar 29 08:46:07 czapp005 kernel: [17179569.192000] console handover: boot 
> [ttyB0] -> real [tty0]
> Mar 29 08:46:07 czapp005 kernel: [17179569.200000] Dentry cache hash table 
> entries: 131072 (order: 7, 524288 bytes)
> Mar 29 08:46:07 czapp005 kernel: [17179569.200000] Inode-cache hash table 
> entries: 65536 (order: 6, 262144 bytes)
> Mar 29 08:46:07 czapp005 kernel: [17179569.248000] Memory: 
> 1025664k/1048576k available (1961k kernel code, 22704k reserved, 882k data, 
> 224k init)
> Mar 29 08:46:07 czapp005 kernel: [17179569.248000] virtual kernel memory 
> layout:
> Mar 29 08:46:07 czapp005 kernel: [17179569.248000]     vmalloc : 0x00008000 
> - 0x0f000000   ( 239 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179569.248000]     memory  : 0x10000000 
> - 0x50000000   (1024 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179569.248000]       .init : 0x10410000 
> - 0x10448000   ( 224 kB)
> Mar 29 08:46:07 czapp005 kernel: [17179569.248000]       .data : 0x102ea6c0 
> - 0x103c7000   ( 882 kB)
> Mar 29 08:46:07 czapp005 kernel: [17179569.248000]       .text : 0x10100000 
> - 0x102ea6c0   (1961 kB)
> Mar 29 08:46:07 czapp005 kernel: [17179569.248000] Calibrating delay 
> loop... 1495.04 BogoMIPS (lpj=2990080)
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] Security Framework 
> initialized
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] SELinux:  Disabled at 
> boot.
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] Capability LSM 
> initialized
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] Mount-cache hash table 
> entries: 512
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] Initializing cgroup 
> subsys ns
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] Initializing cgroup 
> subsys cpuacct
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] Initializing cgroup 
> subsys devices
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] net_namespace: 648 bytes
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] NET: Registered protocol 
> family 16
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] EISA bus registered
> Mar 29 08:46:07 czapp005 kernel: [17179569.340000] Searching for devices...
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] Found devices:
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] 1. Astro BC Runway Port 
> at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] 2. Elroy PCI Bridge at 
> 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] 3. Elroy PCI Bridge at 
> 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] 4. Elroy PCI Bridge at 
> 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] 5. Elroy PCI Bridge at 
> 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] 6. Allegro W2 at 
> 0xfffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] 7. Memory at 0xfed10200 
> [49] { 1, 0x0, 0x09c, 0x00009 }
> Mar 29 08:46:07 czapp005 kernel: [17179569.576000] Enabling regular chassis 
> codes support v0.05
> Mar 29 08:46:07 czapp005 kernel: [17179569.708000] CPU(s): 1 x PA8700 
> (PCX-W2) at 750.000000 MHz
> Mar 29 08:46:07 czapp005 kernel: [17179569.712000] Whole cache flush 223757 
> cycles, flushing 3440640 bytes 702747 cycles
> Mar 29 08:46:07 czapp005 kernel: [17179569.712000] Setting cache flush 
> threshold to 600 (1 CPUs online)
> Mar 29 08:46:07 czapp005 kernel: [17179569.736000] SBA found Astro 2.1 at 
> 0xfed00000
> Mar 29 08:46:07 czapp005 kernel: [17179569.736000] Elroy version TR4.0 
> (0x5) found at 0xfed30000
> Mar 29 08:46:07 czapp005 kernel: [17179569.740000] PCI: Enabled native mode 
> for NS87415 (pif=0x8f)
> Mar 29 08:46:07 czapp005 kernel: [17179569.744000] Elroy version TR4.0 
> (0x5) found at 0xfed32000
> Mar 29 08:46:07 czapp005 kernel: [17179569.744000] Elroy version TR4.0 
> (0x5) found at 0xfed38000
> Mar 29 08:46:07 czapp005 kernel: [17179569.744000] Elroy version TR4.0 
> (0x5) found at 0xfed3c000
> Mar 29 08:46:07 czapp005 kernel: [17179569.744000] iosapic: hpa not 
> registered for 0000:03:02.0
> Mar 29 08:46:07 czapp005 kernel: [17179569.752000] powersw: Soft power 
> switch at 0xf0400804 enabled.
> Mar 29 08:46:07 czapp005 kernel: [17179569.768000] NET: Registered protocol 
> family 2
> Mar 29 08:46:07 czapp005 kernel: [17179569.804000] IP route cache hash 
> table entries: 32768 (order: 5, 131072 bytes)
> Mar 29 08:46:07 czapp005 kernel: [17179569.804000] TCP established hash 
> table entries: 131072 (order: 8, 1048576 bytes)
> Mar 29 08:46:07 czapp005 kernel: [17179569.804000] TCP bind hash table 
> entries: 65536 (order: 6, 262144 bytes)
> Mar 29 08:46:07 czapp005 kernel: [17179569.804000] TCP: Hash tables 
> configured (established 131072 bind 65536)
> Mar 29 08:46:07 czapp005 kernel: [17179569.804000] TCP reno registered
> Mar 29 08:46:07 czapp005 kernel: [17179569.816000] NET: Registered protocol 
> family 1
> Mar 29 08:46:07 czapp005 kernel: [17179569.816000] checking if image is 
> initramfs... it is
> Mar 29 08:46:07 czapp005 kernel: [17179571.536000] Freeing initrd memory: 
> 8205k freed
> Mar 29 08:46:07 czapp005 kernel: [17179571.536000] Enabling PDC chassis 
> warnings support v0.05
> Mar 29 08:46:07 czapp005 kernel: [17179571.536000] unwind_init: start = 
> 0x1035de10, end = 0x103850e0, entries = 10029
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] audit: initializing 
> netlink socket (disabled)
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] type=2000 
> audit(1238309093.356:1): initialized
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] VFS: Disk quotas 
> dquot_6.5.1
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] Dquot-cache hash table 
> entries: 1024 (order 0, 4096 bytes)
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] msgmni has been set to 
> 2019
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] Block layer SCSI generic 
> (bsg) driver version 0.4 loaded (major 254)
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] io scheduler noop 
> registered
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] io scheduler 
> anticipatory registered
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] io scheduler deadline 
> registered
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] io scheduler cfq 
> registered (default)
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] SuperIO: Found NS87560 
> Legacy I/O device at 0000:00:0e.1 (IRQ 67)
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] SuperIO: Serial port 1 
> at 0x3f8
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] SuperIO: Serial port 2 
> at 0x2f8
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] SuperIO: Parallel port 
> at 0x378
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] SuperIO: Floppy 
> controller at 0x3f0
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] SuperIO: ACPI at 0x7e0
> Mar 29 08:46:07 czapp005 kernel: [17179571.540000] SuperIO: USB regulator 
> enabled
> Mar 29 08:46:07 czapp005 kernel: [17179571.544000] PDC Stable Storage 
> facility v0.30
> Mar 29 08:46:07 czapp005 kernel: [17179571.872000] STI GSC/PCI core 
> graphics driver Version 0.9a
> Mar 29 08:46:07 czapp005 kernel: [17179571.872000] STI PCI graphic ROM 
> found at f7000000 (2048 kB), fb at fa000000 (32 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179571.936000]     id 35acda30-9a02587, 
> conforms to spec rev. 8.0d
> Mar 29 08:46:07 czapp005 kernel: [17179572.068000]     graphics card name: 
> A1299B
> Mar 29 08:46:07 czapp005 kernel: [17179572.068000] sticon: Initializing STI 
> text console.
> Mar 29 08:46:07 czapp005 kernel: [17179572.144000] Console: switching to 
> colour STI console 128x48
> Mar 29 08:46:07 czapp005 kernel: [17179572.224000] stifb: 'A1299B' (id: 
> 0x35acda30) not supported.
> Mar 29 08:46:07 czapp005 kernel: [17179572.232000] Generic RTC Driver v1.07
> Mar 29 08:46:07 czapp005 kernel: [17179572.236000] Serial: 8250/16550 
> driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
> Mar 29 08:46:07 czapp005 kernel: [17179572.240000] serial8250: ttyS0 at I/O 
> 0x3f8 (irq = 3) is a 16550A
> Mar 29 08:46:07 czapp005 kernel: [17179572.244000] serial8250: ttyS1 at I/O 
> 0x2f8 (irq = 4) is a 16550A
> Mar 29 08:46:07 czapp005 kernel: [17179572.252000] brd: module loaded
> Mar 29 08:46:07 czapp005 kernel: [17179572.256000] mice: PS/2 mouse device 
> common for all mice
> Mar 29 08:46:07 czapp005 kernel: [17179572.264000] TCP cubic registered
> Mar 29 08:46:07 czapp005 kernel: [17179572.268000] NET: Registered protocol 
> family 17
> Mar 29 08:46:07 czapp005 kernel: [17179572.272000] registered taskstats 
> version 1
> Mar 29 08:46:07 czapp005 kernel: [17179572.276000] Freeing unused kernel 
> memory: 224k freed
> Mar 29 08:46:07 czapp005 kernel: [17179572.792000] SCSI subsystem 
> initialized
> Mar 29 08:46:07 czapp005 kernel: [17179573.876000] Linux Tulip driver 
> version 1.1.15-NAPI (Feb 27, 2007)
> Mar 29 08:46:07 czapp005 kernel: [17179573.888000] tulip0: no phy info, 
> aborting mtable build
> Mar 29 08:46:07 czapp005 kernel: [17179573.892000] tulip0:  MII transceiver 
> #1 config 1000 status 782d advertising 01e1.
> Mar 29 08:46:07 czapp005 kernel: [17179573.904000] eth0: Digital DS21142/43 
> Tulip rev 65 at MMIO 0xf4008000, 00:30:6e:21:ac:1a, IRQ 65.
> Mar 29 08:46:07 czapp005 kernel: [17179574.108000] usbcore: registered new 
> interface driver usbfs
> Mar 29 08:46:07 czapp005 kernel: [17179574.112000] usbcore: registered new 
> interface driver hub
> Mar 29 08:46:07 czapp005 kernel: [17179574.360000] sym0: <896> rev 0x7 at 
> pci 0000:00:0f.0 irq 68
> Mar 29 08:46:07 czapp005 kernel: [17179574.376000] libata version 3.00 
> loaded.
> Mar 29 08:46:07 czapp005 kernel: [17179574.388000] usbcore: registered new 
> device driver usb
> Mar 29 08:46:07 czapp005 kernel: [17179574.400000] ohci_hcd: 2006 August 04 
> USB 1.1 'Open' Host Controller (OHCI) Driver
> Mar 29 08:46:07 czapp005 kernel: [17179574.400000] ohci_hcd: block sizes: 
> ed 64 td 64
> Mar 29 08:46:07 czapp005 kernel: [17179574.408000] sym0: PA-RISC Firmware, 
> ID 7, Fast-40, SE, parity checking
> Mar 29 08:46:07 czapp005 kernel: [17179574.416000] sym0: SCSI BUS has been 
> reset.
> Mar 29 08:46:07 czapp005 kernel: [17179574.424000] sym0: SCSI BUS mode 
> change from SE to SE.
> Mar 29 08:46:07 czapp005 kernel: [17179574.432000] sym0: SCSI BUS has been 
> reset.
> Mar 29 08:46:07 czapp005 kernel: [17179574.436000] scsi0 : sym-2.2.3
> Mar 29 08:46:07 czapp005 kernel: [17179574.668000] sym1: <896> rev 0x7 at 
> pci 0000:00:0f.1 irq 68
> Mar 29 08:46:07 czapp005 kernel: [17179574.676000] sym1: PA-RISC Firmware, 
> ID 7, Fast-40, LVD, parity checking
> Mar 29 08:46:07 czapp005 kernel: [17179574.680000] sym1: SCSI BUS has been 
> reset.
> Mar 29 08:46:07 czapp005 kernel: [17179574.692000] scsi1 : sym-2.2.3
> Mar 29 08:46:07 czapp005 kernel: [17179574.700000] ohci_hcd 0000:00:0e.2: 
> OHCI Host Controller
> Mar 29 08:46:07 czapp005 kernel: [17179574.704000] ohci_hcd 0000:00:0e.2: 
> new USB bus registered, assigned bus number 1
> Mar 29 08:46:07 czapp005 kernel: [17179574.712000] ohci_hcd 0000:00:0e.2: 
> Using NSC SuperIO setup
> Mar 29 08:46:07 czapp005 kernel: [17179574.712000] ohci_hcd 0000:00:0e.2: 
> created debug files
> Mar 29 08:46:07 czapp005 kernel: [17179574.712000] ohci_hcd 0000:00:0e.2: 
> irq 1, io mem 0xf4007000
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> OHCI controller state
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> OHCI 1.0, NO legacy support registers
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> control 0x083 HCFS=operational CBSR=3
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> cmdstatus 0x00000 SOC=0
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> intrstatus 0x00000000
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> intrenable 0x8000001a MIE UE RD WDH
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> hcca frame #0000
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> roothub.a 00001003 POTPGT=0 NOCP NDP=3(3)
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> roothub.b 000e0000 PPCM=000e DR=0000
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> roothub.status 00008000 DRWE
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> roothub.portstatus [0] 0x00000100 PPS
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> roothub.portstatus [1] 0x00000100 PPS
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] ohci_hcd 0000:00:0e.2: 
> roothub.portstatus [2] 0x00000100 PPS
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] usb usb1: default 
> language 0x0409
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] usb usb1: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] usb usb1: 
> usb_probe_device
> Mar 29 08:46:07 czapp005 kernel: [17179574.772000] usb usb1: configuration 
> #1 chosen from 1 choice
> Mar 29 08:46:07 czapp005 kernel: [17179574.776000] usb usb1: adding 1-0:1.0 
> (config #1, interface 0)
> Mar 29 08:46:07 czapp005 kernel: [17179574.776000] usb 1-0:1.0: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179574.776000] hub 1-0:1.0: 
> usb_probe_interface
> Mar 29 08:46:07 czapp005 kernel: [17179574.776000] hub 1-0:1.0: 
> usb_probe_interface - got id
> Mar 29 08:46:07 czapp005 kernel: [17179574.776000] hub 1-0:1.0: USB hub 
> found
> Mar 29 08:46:07 czapp005 kernel: [17179574.780000] hub 1-0:1.0: 3 ports 
> detected
> Mar 29 08:46:07 czapp005 kernel: [17179574.784000] hub 1-0:1.0: standalone 
> hub
> Mar 29 08:46:07 czapp005 kernel: [17179574.784000] hub 1-0:1.0: ganged 
> power switching
> Mar 29 08:46:07 czapp005 kernel: [17179574.784000] hub 1-0:1.0: no 
> over-current protection
> Mar 29 08:46:07 czapp005 kernel: [17179574.784000] hub 1-0:1.0: power on to 
> power good time: 0ms
> Mar 29 08:46:07 czapp005 kernel: [17179574.784000] hub 1-0:1.0: local power 
> source is good
> Mar 29 08:46:07 czapp005 kernel: [17179574.784000] hub 1-0:1.0: enabling 
> power on all ports
> Mar 29 08:46:07 czapp005 kernel: [17179574.888000] usb usb1: New USB device 
> found, idVendor=1d6b, idProduct=0001
> Mar 29 08:46:07 czapp005 kernel: [17179574.892000] usb usb1: New USB device 
> strings: Mfr=3, Product=2, SerialNumber=1
> Mar 29 08:46:07 czapp005 kernel: [17179574.896000] usb usb1: Product: OHCI 
> Host Controller
> Mar 29 08:46:07 czapp005 kernel: [17179574.900000] usb usb1: Manufacturer: 
> Linux 2.6.26-1-parisc ohci_hcd
> Mar 29 08:46:07 czapp005 kernel: [17179574.904000] usb usb1: SerialNumber: 
> 0000:00:0e.2
> Mar 29 08:46:07 czapp005 kernel: [17179574.908000] hub 1-0:1.0: state 7 
> ports 3 chg 0000 evt 0006
> Mar 29 08:46:07 czapp005 kernel: [17179574.908000] ohci_hcd 0000:00:0e.2: 
> GetStatus roothub.portstatus [0] = 0x00010101 CSC PPS CCS
> Mar 29 08:46:07 czapp005 kernel: [17179574.908000] hub 1-0:1.0: port 1, 
> status 0101, change 0001, 12 Mb/s
> Mar 29 08:46:07 czapp005 kernel: [17179574.932000] Uniform Multi-Platform 
> E-IDE driver
> Mar 29 08:46:07 czapp005 kernel: [17179574.936000] ide: Assuming 33MHz 
> system bus speed for PIO modes; override with idebus=xx
> Mar 29 08:46:07 czapp005 kernel: [17179574.948000] NS87415: IDE controller 
> (0x100b:0x0002 rev 0x03) at  PCI slot 0000:00:0e.0
> Mar 29 08:46:07 czapp005 kernel: [17179574.952000] NS87415: 100% native 
> mode on irq 7
> Mar 29 08:46:07 czapp005 kernel: [17179574.960000]     ide0: BM-DMA at 
> 0x0a00-0x0a07
> Mar 29 08:46:07 czapp005 kernel: [17179574.964000]     ide1: BM-DMA at 
> 0x0a08-0x0a0f
> Mar 29 08:46:07 czapp005 kernel: [17179574.968000] Probing IDE interface 
> ide0...
> Mar 29 08:46:07 czapp005 kernel: [17179575.044000] hub 1-0:1.0: debounce: 
> port 1: total 100ms stable 100ms status 0x101
> Mar 29 08:46:07 czapp005 kernel: [17179575.116000] ohci_hcd 0000:00:0e.2: 
> GetStatus roothub.portstatus [0] = 0x00100103 PRSC PPS PES CCS
> Mar 29 08:46:07 czapp005 kernel: [17179575.172000] usb 1-1: new full speed 
> USB device using ohci_hcd and address 2
> Mar 29 08:46:07 czapp005 kernel: [17179575.248000] ohci_hcd 0000:00:0e.2: 
> GetStatus roothub.portstatus [0] = 0x00100103 PRSC PPS PES CCS
> Mar 29 08:46:07 czapp005 kernel: [17179575.328000] usb 1-1: default 
> language 0x0409
> Mar 29 08:46:07 czapp005 kernel: [17179575.336000] usb 1-1: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179575.336000] usb 1-1: 
> usb_probe_device
> Mar 29 08:46:07 czapp005 kernel: [17179575.336000] usb 1-1: configuration 
> #1 chosen from 1 choice
> Mar 29 08:46:07 czapp005 kernel: [17179575.340000] usb 1-1: adding 1-1:1.0 
> (config #1, interface 0)
> Mar 29 08:46:07 czapp005 kernel: [17179575.340000] usb 1-1:1.0: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179575.340000] usb 1-1: New USB device 
> found, idVendor=1687, idProduct=0163
> Mar 29 08:46:07 czapp005 kernel: [17179575.344000] usb 1-1: New USB device 
> strings: Mfr=1, Product=2, SerialNumber=3
> Mar 29 08:46:07 czapp005 kernel: [17179575.348000] usb 1-1: Product: USB2.0 
> FlashDisk
> Mar 29 08:46:07 czapp005 kernel: [17179575.352000] usb 1-1: Manufacturer: 
> Kingmax
> Mar 29 08:46:07 czapp005 kernel: [17179575.360000] usb 1-1: SerialNumber: 
> 020000000001B4
> Mar 29 08:46:07 czapp005 kernel: [17179575.364000] ohci_hcd 0000:00:0e.2: 
> GetStatus roothub.portstatus [1] = 0x00010301 CSC LSDA PPS CCS
> Mar 29 08:46:07 czapp005 kernel: [17179575.364000] hub 1-0:1.0: port 2, 
> status 0301, change 0001, 1.5 Mb/s
> Mar 29 08:46:07 czapp005 kernel: [17179575.372000] hda: FX4830T, ATAPI 
> CD/DVD-ROM drive
> Mar 29 08:46:07 czapp005 kernel: [17179575.436000] Initializing USB Mass 
> Storage driver...
> Mar 29 08:46:07 czapp005 kernel: [17179575.492000] hub 1-0:1.0: debounce: 
> port 2: total 100ms stable 100ms status 0x301
> Mar 29 08:46:07 czapp005 kernel: [17179575.564000] ohci_hcd 0000:00:0e.2: 
> GetStatus roothub.portstatus [1] = 0x00100303 PRSC LSDA PPS PES CCS
> Mar 29 08:46:07 czapp005 kernel: [17179575.620000] usb 1-2: new low speed 
> USB device using ohci_hcd and address 3
> Mar 29 08:46:07 czapp005 kernel: [17179575.696000] ohci_hcd 0000:00:0e.2: 
> GetStatus roothub.portstatus [1] = 0x00100303 PRSC LSDA PPS PES CCS
> Mar 29 08:46:07 czapp005 kernel: [17179575.780000] usb 1-2: skipped 1 
> descriptor after interface
> Mar 29 08:46:07 czapp005 kernel: [17179575.780000] usb 1-2: skipped 1 
> descriptor after interface
> Mar 29 08:46:07 czapp005 kernel: [17179575.780000] usb 1-2: skipped 1 
> descriptor after interface
> Mar 29 08:46:07 czapp005 kernel: [17179575.780000] usb 1-2: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179575.780000] usb 1-2: 
> usb_probe_device
> Mar 29 08:46:07 czapp005 kernel: [17179575.780000] usb 1-2: configuration 
> #1 chosen from 1 choice
> Mar 29 08:46:07 czapp005 kernel: [17179575.788000] usb 1-2: adding 1-2:1.0 
> (config #1, interface 0)
> Mar 29 08:46:07 czapp005 kernel: [17179575.788000] usb 1-2:1.0: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179575.788000] usb 1-2: adding 1-2:1.1 
> (config #1, interface 1)
> Mar 29 08:46:07 czapp005 kernel: [17179575.788000] usb 1-2:1.1: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179575.788000] usb 1-2: adding 1-2:1.2 
> (config #1, interface 2)
> Mar 29 08:46:07 czapp005 kernel: [17179575.788000] usb 1-2:1.2: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179575.788000] usb 1-2: New USB device 
> found, idVendor=05e3, idProduct=ffe0
> Mar 29 08:46:07 czapp005 kernel: [17179575.792000] usb 1-2: New USB device 
> strings: Mfr=0, Product=0, SerialNumber=0
> Mar 29 08:46:07 czapp005 kernel: [17179575.800000] hub 1-0:1.0: state 7 
> ports 3 chg 0000 evt 0004
> Mar 29 08:46:07 czapp005 kernel: [17179575.832000] usb-storage 1-1:1.0: 
> usb_probe_interface
> Mar 29 08:46:07 czapp005 kernel: [17179575.832000] usb-storage 1-1:1.0: 
> usb_probe_interface - got id
> Mar 29 08:46:07 czapp005 kernel: [17179575.832000] scsi2 : SCSI emulation 
> for USB Mass Storage devices
> Mar 29 08:46:07 czapp005 kernel: [17179575.836000] usbcore: registered new 
> interface driver usb-storage
> Mar 29 08:46:07 czapp005 kernel: [17179575.840000] USB Mass Storage support 
> registered.
> Mar 29 08:46:07 czapp005 kernel: [17179575.848000] usb-storage: device 
> found at 2
> Mar 29 08:46:07 czapp005 kernel: [17179575.848000] usb-storage: waiting for 
> device to settle before scanning
> Mar 29 08:46:07 czapp005 kernel: [17179575.956000] usbcore: registered new 
> interface driver hiddev
> Mar 29 08:46:07 czapp005 kernel: [17179575.960000] usbhid 1-2:1.0: 
> usb_probe_interface
> Mar 29 08:46:07 czapp005 kernel: [17179575.960000] usbhid 1-2:1.0: 
> usb_probe_interface - got id
> Mar 29 08:46:07 czapp005 kernel: [17179576.012000] input: HID 05e3:ffe0 as 
> /class/input/input0
> Mar 29 08:46:07 czapp005 kernel: [17179576.028000] input,hidraw0: USB HID 
> v1.00 Keyboard [HID 05e3:ffe0] on usb-0000:00:0e.2-2
> Mar 29 08:46:07 czapp005 kernel: [17179576.032000] usbhid 1-2:1.1: 
> usb_probe_interface
> Mar 29 08:46:07 czapp005 kernel: [17179576.032000] usbhid 1-2:1.1: 
> usb_probe_interface - got id
> Mar 29 08:46:07 czapp005 kernel: [17179576.052000] Probing IDE interface 
> ide1...
> Mar 29 08:46:07 czapp005 kernel: [17179576.064000] input: HID 05e3:ffe0 as 
> /class/input/input1
> Mar 29 08:46:07 czapp005 kernel: [17179576.080000] input,hidraw1: USB HID 
> v1.00 Device [HID 05e3:ffe0] on usb-0000:00:0e.2-2
> Mar 29 08:46:07 czapp005 kernel: [17179576.084000] usbhid 1-2:1.2: 
> usb_probe_interface
> Mar 29 08:46:07 czapp005 kernel: [17179576.084000] usbhid 1-2:1.2: 
> usb_probe_interface - got id
> Mar 29 08:46:07 czapp005 kernel: [17179576.100000] input: HID 05e3:ffe0 as 
> /class/input/input2
> Mar 29 08:46:07 czapp005 kernel: [17179576.120000] input,hidraw2: USB HID 
> v1.00 Mouse [HID 05e3:ffe0] on usb-0000:00:0e.2-2
> Mar 29 08:46:07 czapp005 kernel: [17179576.124000] usbcore: registered new 
> interface driver usbhid
> Mar 29 08:46:07 czapp005 kernel: [17179576.128000] usbhid: v2.6:USB HID 
> core driver
> Mar 29 08:46:07 czapp005 kernel: [17179576.620000] ide0 at 
> 0xf00-0xf07,0xe02 on irq 7
> Mar 29 08:46:07 czapp005 kernel: [17179576.624000] ide1 at 
> 0xd00-0xd07,0xb02 on irq 7
> Mar 29 08:46:07 czapp005 kernel: [17179576.712000] hda: ATAPI 48X CD-ROM 
> drive, 128kB Cache
> Mar 29 08:46:07 czapp005 kernel: [17179576.716000] Uniform CD-ROM driver 
> Revision: 3.20
> Mar 29 08:46:07 czapp005 kernel: [17179579.152000] scsi 1:0:5:0: 
> Direct-Access     HP 36.4G ST336706LC       HP03 PQ: 0 ANSI: 2
> Mar 29 08:46:07 czapp005 kernel: [17179579.160000]  target1:0:5: tagged 
> command queuing enabled, command queue depth 16.
> Mar 29 08:46:07 czapp005 kernel: [17179579.164000]  target1:0:5: Beginning 
> Domain Validation
> Mar 29 08:46:07 czapp005 kernel: [17179579.168000]  target1:0:5: 
> asynchronous
> Mar 29 08:46:07 czapp005 kernel: [17179579.184000]  target1:0:5: wide 
> asynchronous
> Mar 29 08:46:07 czapp005 kernel: [17179579.192000]  target1:0:5: FAST-40 
> WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
> Mar 29 08:46:07 czapp005 kernel: [17179579.200000]  target1:0:5: Domain 
> Validation skipping write tests
> Mar 29 08:46:07 czapp005 kernel: [17179579.208000]  target1:0:5: Ending 
> Domain Validation
> Mar 29 08:46:07 czapp005 kernel: [17179579.220000] scsi 1:0:6:0: 
> Direct-Access     HP 36.4G ST336706LC       HP03 PQ: 0 ANSI: 2
> Mar 29 08:46:07 czapp005 kernel: [17179579.224000]  target1:0:6: tagged 
> command queuing enabled, command queue depth 16.
> Mar 29 08:46:07 czapp005 kernel: [17179579.228000]  target1:0:6: Beginning 
> Domain Validation
> Mar 29 08:46:07 czapp005 kernel: [17179579.232000]  target1:0:6: 
> asynchronous
> Mar 29 08:46:07 czapp005 kernel: [17179579.248000]  target1:0:6: wide 
> asynchronous
> Mar 29 08:46:07 czapp005 kernel: [17179579.256000]  target1:0:6: FAST-40 
> WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
> Mar 29 08:46:07 czapp005 kernel: [17179579.268000]  target1:0:6: Domain 
> Validation skipping write tests
> Mar 29 08:46:07 czapp005 kernel: [17179579.272000]  target1:0:6: Ending 
> Domain Validation
> Mar 29 08:46:07 czapp005 kernel: [17179580.848000] usb-storage: device scan 
> complete
> Mar 29 08:46:07 czapp005 kernel: [17179580.852000] scsi 2:0:0:0: 
> Direct-Access     Kingmax  USB2.0 FlashDisk 0.00 PQ: 0 ANSI: 2
> Mar 29 08:46:07 czapp005 kernel: [17179581.808000] Driver 'sd' needs 
> updating - please use bus_type methods
> Mar 29 08:46:07 czapp005 kernel: [17179581.840000] sd 1:0:5:0: [sda] 
> 71132960 512-byte hardware sectors (36420 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179581.844000] sd 1:0:5:0: [sda] Write 
> Protect is off
> Mar 29 08:46:07 czapp005 kernel: [17179581.848000] sd 1:0:5:0: [sda] Mode 
> Sense: 9f 00 10 08
> Mar 29 08:46:07 czapp005 kernel: [17179581.852000] sd 1:0:5:0: [sda] Write 
> cache: enabled, read cache: enabled, supports DPO and FUA
> Mar 29 08:46:07 czapp005 kernel: [17179581.856000] sd 1:0:5:0: [sda] 
> 71132960 512-byte hardware sectors (36420 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179581.864000] sd 1:0:5:0: [sda] Write 
> Protect is off
> Mar 29 08:46:07 czapp005 kernel: [17179581.868000] sd 1:0:5:0: [sda] Mode 
> Sense: 9f 00 10 08
> Mar 29 08:46:07 czapp005 kernel: [17179581.868000] sd 1:0:5:0: [sda] Write 
> cache: enabled, read cache: enabled, supports DPO and FUA
> Mar 29 08:46:07 czapp005 kernel: [17179581.876000]  sda: sda1 sda2 sda3 
> sda4
> Mar 29 08:46:07 czapp005 kernel: [17179581.884000] sd 1:0:5:0: [sda] 
> Attached SCSI disk
> Mar 29 08:46:07 czapp005 kernel: [17179581.900000] sd 1:0:6:0: [sdb] 
> 71132960 512-byte hardware sectors (36420 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179581.908000] sd 1:0:6:0: [sdb] Write 
> Protect is off
> Mar 29 08:46:07 czapp005 kernel: [17179581.912000] sd 1:0:6:0: [sdb] Mode 
> Sense: 9f 00 10 08
> Mar 29 08:46:07 czapp005 kernel: [17179581.912000] sd 1:0:6:0: [sdb] Write 
> cache: enabled, read cache: enabled, supports DPO and FUA
> Mar 29 08:46:07 czapp005 kernel: [17179581.920000] sd 1:0:6:0: [sdb] 
> 71132960 512-byte hardware sectors (36420 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179581.924000] sd 1:0:6:0: [sdb] Write 
> Protect is off
> Mar 29 08:46:07 czapp005 kernel: [17179581.928000] sd 1:0:6:0: [sdb] Mode 
> Sense: 9f 00 10 08
> Mar 29 08:46:07 czapp005 kernel: [17179581.932000] sd 1:0:6:0: [sdb] Write 
> cache: enabled, read cache: enabled, supports DPO and FUA
> Mar 29 08:46:07 czapp005 kernel: [17179581.936000]  sdb: sdb1 sdb2 sdb3 
> sdb4
> Mar 29 08:46:07 czapp005 kernel: [17179581.944000] sd 1:0:6:0: [sdb] 
> Attached SCSI disk
> Mar 29 08:46:07 czapp005 kernel: [17179581.964000] sd 2:0:0:0: [sdc] 
> 3948543 512-byte hardware sectors (2022 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179581.968000] ohci_hcd 0000:00:0e.2: 
> urb 4fa4e960 path 1 ep2in 92120000 cc 9 --> status -181
> Mar 29 08:46:07 czapp005 kernel: [17179581.972000] sd 2:0:0:0: [sdc] Write 
> Protect is off
> Mar 29 08:46:07 czapp005 kernel: [17179581.976000] sd 2:0:0:0: [sdc] Mode 
> Sense: 00 00 00 00
> Mar 29 08:46:07 czapp005 kernel: [17179581.976000] sd 2:0:0:0: [sdc] 
> Assuming drive cache: write through
> Mar 29 08:46:07 czapp005 kernel: [17179582.004000] sd 2:0:0:0: [sdc] 
> 3948543 512-byte hardware sectors (2022 MB)
> Mar 29 08:46:07 czapp005 kernel: [17179582.008000] ohci_hcd 0000:00:0e.2: 
> urb 4fa4e960 path 1 ep2in 93120000 cc 9 --> status -181
> Mar 29 08:46:07 czapp005 kernel: [17179582.012000] sd 2:0:0:0: [sdc] Write 
> Protect is off
> Mar 29 08:46:07 czapp005 kernel: [17179582.016000] sd 2:0:0:0: [sdc] Mode 
> Sense: 00 00 00 00
> Mar 29 08:46:07 czapp005 kernel: [17179582.016000] sd 2:0:0:0: [sdc] 
> Assuming drive cache: write through
> Mar 29 08:46:07 czapp005 kernel: [17179582.020000]  sdc: unknown partition 
> table
> Mar 29 08:46:07 czapp005 kernel: [17179582.136000] sd 2:0:0:0: [sdc] 
> Attached SCSI removable disk
> Mar 29 08:46:07 czapp005 kernel: [17179616.956000] md: raid1 personality 
> registered for level 1
> Mar 29 08:46:07 czapp005 kernel: [17179617.028000] md: md0 stopped.
> Mar 29 08:46:07 czapp005 kernel: [17179617.204000] md: bind<sdb1>
> Mar 29 08:46:07 czapp005 kernel: [17179617.208000] md: bind<sda1>
> Mar 29 08:46:07 czapp005 kernel: [17179617.256000] raid1: raid set md0 
> active with 2 out of 2 mirrors
> Mar 29 08:46:07 czapp005 kernel: [17179617.532000] device-mapper: uevent: 
> version 1.0.3
> Mar 29 08:46:07 czapp005 kernel: [17179617.544000] device-mapper: ioctl: 
> 4.13.0-ioctl (2007-10-18) initialised: dm-devel@redhat.com
> Mar 29 08:46:07 czapp005 kernel: [17179620.184000] kjournald starting.  
> Commit interval 5 seconds
> Mar 29 08:46:07 czapp005 kernel: [17179620.188000] EXT3-fs: mounted 
> filesystem with ordered data mode.
> Mar 29 08:46:07 czapp005 kernel: [17179622.040000] udevd version 125 
> started
> Mar 29 08:46:07 czapp005 kernel: [17179622.332000] usb usb1: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179622.332000] usb 1-0:1.0: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179622.332000] usb 1-1: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179622.332000] usb 1-1:1.0: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179622.332000] usb 1-2: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179622.332000] usb 1-2:1.0: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179622.332000] usb 1-2:1.1: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179622.332000] usb 1-2:1.2: uevent
> Mar 29 08:46:07 czapp005 kernel: [17179627.072000] Adding 498004k swap on 
> /dev/sdb4.  Priority:-1 extents:1 across:498004k
> Mar 29 08:46:07 czapp005 kernel: [17179637.300000] EXT3 FS on dm-0, 
> internal journal
> Mar 29 08:46:07 czapp005 kernel: [17179638.544000] LASI 82596 driver - 
> Revision: 1.30
> Mar 29 08:46:07 czapp005 kernel: [17179638.588000] loop: module loaded
> Mar 29 08:46:07 czapp005 kernel: [17179642.092000] kjournald starting.  
> Commit interval 5 seconds
> Mar 29 08:46:07 czapp005 kernel: [17179642.096000] EXT3 FS on sda3, 
> internal journal
> Mar 29 08:46:07 czapp005 kernel: [17179642.100000] EXT3-fs: mounted 
> filesystem with ordered data mode.
> Mar 29 08:46:07 czapp005 kernel: [17179642.128000] kjournald starting.  
> Commit interval 5 seconds
> Mar 29 08:46:07 czapp005 kernel: [17179642.152000] EXT3 FS on dm-1, 
> internal journal
> Mar 29 08:46:07 czapp005 kernel: [17179642.156000] EXT3-fs: mounted 
> filesystem with ordered data mode.
> Mar 29 08:46:07 czapp005 kernel: [17179642.196000] kjournald starting.  
> Commit interval 5 seconds
> Mar 29 08:46:07 czapp005 kernel: [17179642.200000] EXT3 FS on dm-2, 
> internal journal
> Mar 29 08:46:07 czapp005 kernel: [17179642.204000] EXT3-fs: mounted 
> filesystem with ordered data mode.
> Mar 29 08:46:09 czapp005 kernel: [17179647.156000] eth0: Setting 
> full-duplex based on MII#1 link partner capability of 41e1.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
