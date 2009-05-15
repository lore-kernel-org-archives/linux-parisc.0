From: Dirk Van Hertem <dirk.vanhertem@ieee.org>
Subject: Re: random freezes B2000 running debian hppa lenny
Date: Sat, 16 May 2009 00:40:31 +0200
Message-ID: <4A0DEF5F.6090401@ieee.org>
References: <49FB108B.9030803@ieee.org> <20090503112554.GB6617@lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000803000503010300030909"
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090503112554.GB6617@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------000803000503010300030909
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Dear Grant,
Dear linux-parisc enthousiasts,

Sorry for the late reply: in the last week, my vt220 terminal died and
the power supply of my old (i386) server died as well, so I was busy
with other things.

I attached the "ser pim" output to this email, I hope it helps. If you
need any other information, please ask, I hope I'll be more responsive
next time...

Dirk

Grant Grundler wrote:
> [ moved debian-hppa to BCC and added linux-parisc to CC ]
> 
> On Fri, May 01, 2009 at 05:08:59PM +0200, Dirk Van Hertem wrote:
>> hello,
>>
>> My hppa box (B2000) experiences some problems: it freezes after a few
>> (2-6) hours.
>>
>> On the led display I get the following error codes:
>>
>> FLT CBFC: SYS BD
>> bus timeout
>> OS HPMC bz err
>> Bad OS HPMC len
>> HPMC initiated
> 
> Hi Dirk,
> Given the PCI listing you gave below, I agree the HPMC is likely caused by
> the Promise SATA card.
> 
>> I don't have screen nor keyboard attached to it so debugging is a bit
>> difficult.
> 
> AFAIK, the only way to debug this is to capture the HPMC dump.
> The HPMC dump can only be capture via serial console. :(
> (ie run "ser pim" at PDC prompt from a terminal emulator like minicom)
> 
>> System:
>> Debian lenny (stable), rather clean install
>>
>> $ uname -a
>> Linux coulomb 2.6.26-2-parisc #1 Fri Mar 27 03:29:17 UTC 2009 parisc
>> GNU/Linux
>>
>>
>> The machines has the following lspci:
>>
>> 00:0c.0 Ethernet controller: Digital Equipment Corporation DECchip
>> 21142/43 (rev 41)
>> 00:0d.0 Multimedia audio controller: Analog Devices AD1889 sound chip
>> 00:0e.0 IDE interface: National Semiconductor Corporation 87415/87560
>> IDE (rev 03)
>> 00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O (rev 01)
>> 00:0e.2 USB Controller: National Semiconductor Corporation USB
>> Controller (rev 02)
>> 00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c895a (rev 01)
>> 01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
>> 01:04.0 Mass storage controller: Promise Technology, Inc. PDC40718 (SATA
>> 300 TX4) (rev 02)
>>
>> Of which the last entry might well be the problem.
>>
>> This is a promise card for my 3* 1TB sata disks. They seem to be
>> initialized correctly, I made software raid with mdadm, but not I get
>> the following:
>>
>> $ cat /proc/mdstat
>> Personalities : [linear] [multipath] [raid0] [raid1] [raid6] [raid5]
>> [raid4] [raid10]
>> md0 : active raid5 sdc1[0] sde1[3] sdd1[1]
>>       1953519872 blocks level 5, 64k chunk, algorithm 2 [3/2] [UU_]
>>       [=>...................]  recovery =  5.8% (56795292/976759936)
>> finish=451.9min speed=33920K/sec
>>
>> unused devices: <none>
>>
>> This keeps on running for a few hours, until the machine gets unresponsive.
>>
>> I don't think I get anything strange in syslog, kernel.log, messages,...
>>
>> So, my questions:
>> * Is this sata promise card the fault?
> 
> Likely, yes.
> 
>> * on the web, the errors on the display seemed to indicate hardware
>> problems, but any insight on that?
> 
> HW caught the error. Unless this happens w/o Promise care present,
> I'm not inclined to believe this is a HW problem.
> 
>> * Best ways to solve this?
> 
> Capture "ser pim" output (aka PIM dump).
> 
>> * Did I forget something?
>>
>> Dirk
>>
>> PS: Next thing I'll try is to remove the promise card to see if that was
>> the problem
>> PPS: dmesg in attach
> 
> thanks!
> grant
> 
>> -- 
>> Dirk Van Hertem                       Dirk.VanHertem@esat.kuleuven.be
>> Electrical Engineering Department  http://www.esat.kuleuven.be/electa
>> K.U. Leuven, ESAT-ELECTA                         tel: +32-16-32.18.95
>> 10, Kasteelpark Arenberg, B-3001 Heverlee        fax: +32-16-32.19.85
> 
>> [    0.000000] Initializing cgroup subsys cpu
>> [    0.000000] Linux version 2.6.26-2-parisc (Debian 2.6.26-15) (dannf@debian.org) (gcc version 4.1.3 20080704 (prerelease) (Debian 4.1.2-25)) #1 Fri Mar 27 03:29:17 UTC 2009
>> [    0.000000] FP[0] enabled: Rev 1 Model 16
>> [    0.000000] The 32-bit Kernel has started...
>> [    0.000000] console [ttyB0] enabled
>> [    0.000000] Initialized PDC Console for debugging.
>> [    0.000000] Determining PDC firmware type: System Map.
>> [    0.000000] model 00005d00 00000481 00000000 00000002 782d3480 100000f0 00000008 000000b2 000000b2
>> [    0.000000] vers  00000301
>> [    0.000000] CPUID vers 17 rev 11 (0x0000022b)
>> [    0.000000] capabilities 0x3
>> [    0.000000] model 9000/785/B2000
>> [    0.000000] Total Memory: 1024 MB
>> [    0.000000] initrd: 4f8ce000-4ffedfb5
>> [    0.000000] initrd: reserving 3f8ce000-3ffedfb5 (mem_max 40000000)
>> [    0.000000] On node 0 totalpages: 262144
>> [    0.000000]   Normal zone: 2048 pages used for memmap
>> [    0.000000]   Normal zone: 0 pages reserved
>> [    0.000000]   Normal zone: 260096 pages, LIFO batch:31
>> [    0.000000]   Movable zone: 0 pages used for memmap
>> [    0.000000] LCD display at f05d0008,f05d0000 registered
>> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 260096
>> [    0.000000] Kernel command line: root=/dev/sdb5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
>> [    0.000000] PID hash table entries: 4096 (order: 12, 16384 bytes)
>> [17179569.184000] Console: colour dummy device 160x64
>> [17179569.248000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
>> [17179569.348000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
>> [17179569.532000] Memory: 1026560k/1048576k available (1961k kernel code, 21792k reserved, 882k data, 224k init)
>> [17179569.660000] virtual kernel memory layout:
>> [17179569.660000]     vmalloc : 0x00008000 - 0x0f000000   ( 239 MB)
>> [17179569.660000]     memory  : 0x10000000 - 0x50000000   (1024 MB)
>> [17179569.660000]       .init : 0x10410000 - 0x10448000   ( 224 kB)
>> [17179569.660000]       .data : 0x102ea6b4 - 0x103c7000   ( 882 kB)
>> [17179569.660000]       .text : 0x10100000 - 0x102ea6b4   (1961 kB)
>> [17179570.112000] Calibrating delay loop... 798.72 BogoMIPS (lpj=1597440)
>> [17179570.204000] Security Framework initialized
>> [17179570.260000] SELinux:  Disabled at boot.
>> [17179570.312000] Capability LSM initialized
>> [17179570.368000] Mount-cache hash table entries: 512
>> [17179570.428000] Initializing cgroup subsys ns
>> [17179570.484000] Initializing cgroup subsys cpuacct
>> [17179570.548000] Initializing cgroup subsys devices
>> [17179570.612000] net_namespace: 648 bytes
>> [17179570.660000] NET: Registered protocol family 16
>> [17179570.724000] EISA bus registered
>> [17179570.768000] Searching for devices...
>> [17179571.020000] Found devices:
>> [17179571.060000] 1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
>> [17179571.160000] 2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
>> [17179571.264000] 3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
>> [17179571.364000] 4. Kazoo W+ at 0xfffa0000 [32] { 0, 0x0, 0x5d0, 0x00004 }
>> [17179571.452000] 5. Memory at 0xfed10200 [49] { 1, 0x0, 0x09d, 0x00009 }
>> [17179571.536000] Enabling regular chassis codes support v0.05
>> [17179571.736000] CPU(s): 1 x PA8600 (PCX-W+) at 400.000000 MHz
>> [17179571.812000] Whole cache flush 115727 cycles, flushing 3440640 bytes 467519 cycles
>> [17179571.812000] Setting cache flush threshold to 1980 (1 CPUs online)
>> [17179571.920000] SBA found Astro 2.1 at 0xfed00000
>> [17179571.984000] Elroy version TR4.0 (0x5) found at 0xfed30000
>> [17179572.060000] PCI: Enabled native mode for NS87415 (pif=0x8f)
>> [17179572.140000] Elroy version TR4.0 (0x5) found at 0xfed32000
>> [17179572.232000] powersw: Soft power switch at 0xf0400804 enabled.
>> [17179572.324000] NET: Registered protocol family 2
>> [17179572.424000] IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
>> [17179572.520000] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
>> [17179572.624000] TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
>> [17179572.716000] TCP: Hash tables configured (established 131072 bind 65536)
>> [17179572.808000] TCP reno registered
>> [17179572.864000] NET: Registered protocol family 1
>> [17179572.924000] checking if image is initramfs... it is
>> [17179575.908000] Freeing initrd memory: 7295k freed
>> [17179575.976000] Enabling PDC chassis warnings support v0.05
>> [17179576.048000] unwind_init: start = 0x1035de10, end = 0x103850f0, entries = 10030
>> [17179576.144000] WARNING: Out of order unwind entry! 1035f810 and 1035f820
>> [17179576.232000] WARNING: Out of order unwind entry! 1035f820 and 1035f830
>> [17179576.324000] audit: initializing netlink socket (disabled)
>> [17179576.396000] type=2000 audit(1241188257.212:1): initialized
>> [17179576.472000] VFS: Disk quotas dquot_6.5.1
>> [17179576.528000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
>> [17179576.620000] msgmni has been set to 2019
>> [17179576.676000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
>> [17179576.776000] io scheduler noop registered
>> [17179576.832000] io scheduler anticipatory registered
>> [17179576.896000] io scheduler deadline registered
>> [17179576.956000] io scheduler cfq registered (default)
>> [17179577.020000] SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 67) 
>> [17179577.120000] SuperIO: Serial port 1 at 0x3f8
>> [17179577.176000] SuperIO: Serial port 2 at 0x2f8
>> [17179577.236000] SuperIO: Parallel port at 0x378
>> [17179577.292000] SuperIO: Floppy controller at 0x3f0
>> [17179577.356000] SuperIO: ACPI at 0x7e0
>> [17179577.404000] SuperIO: USB regulator enabled
>> [17179577.464000] PDC Stable Storage facility v0.30
>> [17179577.836000] STI GSC/PCI core graphics driver Version 0.9a
>> [17179577.912000] sti 0000:01:00.0: enabling SERR and PARITY (0046 -> 0146)
>> [17179578.000000] STI PCI graphic ROM found at f4840000 (128 kB), fb at fb000000 (16 MB)
>> [17179578.228000]     id 35acda16-9a02587, conforms to spec rev. 8.0c
>> [17179578.312000]     graphics card name: HPA4982A
>> [17179578.368000] sticon: Initializing STI text console.
>> [17179578.436000] Console: switching to colour STI console 160x64
>> [17179578.788000] stifb: 'HPA4982A' (id: 0x35acda16) not supported.
>> [17179578.876000] Generic RTC Driver v1.07
>> [17179578.928000] Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
>> [17179579.036000] serial8250: ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A
>> [17179579.116000] console handover: boot [ttyB0] -> real [ttyS0]
>> [17179579.192000] serial8250: ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A
>> [17179579.276000] brd: module loaded
>> [17179579.316000] mice: PS/2 mouse device common for all mice
>> [17179579.384000] TCP cubic registered
>> [17179579.424000] NET: Registered protocol family 17
>> [17179579.484000] registered taskstats version 1
>> [17179579.536000] Freeing unused kernel memory: 224k freed
>> [17179580.348000] SCSI subsystem initialized
>> [17179581.996000] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
>> [17179582.080000] tulip0: no phy info, aborting mtable build
>> [17179582.144000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
>> [17179582.248000] eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xf4005000, 00:30:6e:08:0a:7f, IRQ 65.
>> [17179582.544000] usbcore: registered new interface driver usbfs
>> [17179582.612000] usbcore: registered new interface driver hub
>> [17179582.704000] sym0: <895a> rev 0x1 at pci 0000:00:0f.0 irq 68
>> [17179582.804000] libata version 3.00 loaded.
>> [17179582.824000] sym0: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
>> [17179582.904000] sym0: SCSI BUS has been reset.
>> [17179582.964000] scsi0 : sym-2.2.3
>> [17179583.008000] usbcore: registered new device driver usb
>> [17179583.096000] ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver
>> [17179583.096000] ohci_hcd: block sizes: ed 64 td 64
>> [17179583.100000] ohci_hcd 0000:00:0e.2: OHCI Host Controller
>> [17179583.168000] ohci_hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
>> [17179583.260000] ohci_hcd 0000:00:0e.2: Using NSC SuperIO setup
>> [17179583.260000] ohci_hcd 0000:00:0e.2: created debug files
>> [17179583.260000] ohci_hcd 0000:00:0e.2: irq 1, io mem 0xf4004000
>> [17179583.384000] ohci_hcd 0000:00:0e.2: OHCI controller state
>> [17179583.384000] ohci_hcd 0000:00:0e.2: OHCI 1.0, NO legacy support registers
>> [17179583.384000] ohci_hcd 0000:00:0e.2: control 0x083 HCFS=operational CBSR=3
>> [17179583.384000] ohci_hcd 0000:00:0e.2: cmdstatus 0x00000 SOC=0
>> [17179583.384000] ohci_hcd 0000:00:0e.2: intrstatus 0x00000000
>> [17179583.384000] ohci_hcd 0000:00:0e.2: intrenable 0x8000001a MIE UE RD WDH
>> [17179583.384000] ohci_hcd 0000:00:0e.2: hcca frame #0000
>> [17179583.384000] ohci_hcd 0000:00:0e.2: roothub.a 00001003 POTPGT=0 NOCP NDP=3(3)
>> [17179583.384000] ohci_hcd 0000:00:0e.2: roothub.b 000e0000 PPCM=000e DR=0000
>> [17179583.384000] ohci_hcd 0000:00:0e.2: roothub.status 00008000 DRWE
>> [17179583.384000] ohci_hcd 0000:00:0e.2: roothub.portstatus [0] 0x00000100 PPS
>> [17179583.384000] ohci_hcd 0000:00:0e.2: roothub.portstatus [1] 0x00000100 PPS
>> [17179583.384000] ohci_hcd 0000:00:0e.2: roothub.portstatus [2] 0x00000100 PPS
>> [17179583.384000] usb usb1: default language 0x0409
>> [17179583.384000] usb usb1: uevent
>> [17179583.384000] usb usb1: usb_probe_device
>> [17179583.384000] usb usb1: configuration #1 chosen from 1 choice
>> [17179583.452000] usb usb1: adding 1-0:1.0 (config #1, interface 0)
>> [17179583.452000] usb 1-0:1.0: uevent
>> [17179583.452000] hub 1-0:1.0: usb_probe_interface
>> [17179583.452000] hub 1-0:1.0: usb_probe_interface - got id
>> [17179583.452000] hub 1-0:1.0: USB hub found
>> [17179583.500000] hub 1-0:1.0: 3 ports detected
>> [17179583.552000] hub 1-0:1.0: standalone hub
>> [17179583.552000] hub 1-0:1.0: ganged power switching
>> [17179583.552000] hub 1-0:1.0: no over-current protection
>> [17179583.552000] hub 1-0:1.0: power on to power good time: 0ms
>> [17179583.552000] hub 1-0:1.0: local power source is good
>> [17179583.552000] hub 1-0:1.0: enabling power on all ports
>> [17179583.656000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
>> [17179583.740000] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>> [17179583.828000] usb usb1: Product: OHCI Host Controller
>> [17179583.892000] usb usb1: Manufacturer: Linux 2.6.26-2-parisc ohci_hcd
>> [17179583.968000] usb usb1: SerialNumber: 0000:00:0e.2
>> [17179584.032000] sata_promise 0000:01:04.0: version 2.12
>> [17179584.032000] scsi1 : sata_promise
>> [17179584.112000] Uniform Multi-Platform E-IDE driver
>> [17179584.168000] ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
>> [17179584.268000] scsi2 : sata_promise
>> [17179584.312000] scsi3 : sata_promise
>> [17179584.352000] scsi4 : sata_promise
>> [17179584.396000] ata1: SATA max UDMA/133 mmio m4096@0xf4820000 ata 0xf4820380 irq 70
>> [17179584.484000] ata2: SATA max UDMA/133 mmio m4096@0xf4820000 ata 0xf4820280 irq 70
>> [17179584.576000] ata3: SATA max UDMA/133 mmio m4096@0xf4820000 ata 0xf4820200 irq 70
>> [17179584.668000] ata4: SATA max UDMA/133 mmio m4096@0xf4820000 ata 0xf4820300 irq 70
>> [17179584.760000] hub 1-0:1.0: state 7 ports 3 chg 0000 evt 0000
>> [17179584.792000] NS87415: IDE controller (0x100b:0x0002 rev 0x03) at  PCI slot 0000:00:0e.0
>> [17179584.892000] NS87415: 100% native mode on irq 7
>> [17179584.948000]     ide0: BM-DMA at 0x0900-0x0907
>> [17179585.008000]     ide1: BM-DMA at 0x0908-0x090f
>> [17179585.060000] Probing IDE interface ide0...
>> [17179585.184000] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
>> [17179585.284000] ata1.00: ATA-8: Hitachi HDT721010SLA360, ST6OA31B, max UDMA/133
>> [17179585.368000] ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 0/32)
>> [17179585.468000] ata1.00: configured for UDMA/133
>> [17179585.692000] hda: FX4830T, ATAPI CD/DVD-ROM drive
>> [17179585.856000] ata2: SATA link down (SStatus 0 SControl 300)
>> [17179586.240000] ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
>> [17179586.340000] ata3.00: ATA-8: Hitachi HDT721010SLA360, ST6OA31B, max UDMA/133
>> [17179586.424000] ata3.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 0/32)
>> [17179586.524000] ata3.00: configured for UDMA/133
>> [17179586.692000] Probing IDE interface ide1...
>> [17179586.896000] ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
>> [17179586.996000] ata4.00: ATA-8: Hitachi HDT721010SLA360, ST6OA31B, max UDMA/133
>> [17179587.080000] ata4.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 0/32)
>> [17179587.180000] ata4.00: configured for UDMA/133
>> [17179587.232000] scsi: waiting for bus probes to complete ...
>> [17179587.524000] ide0 at 0xe00-0xe07,0xd02 on irq 7
>> [17179587.580000] ide1 at 0xb00-0xb07,0xa02 on irq 7
>> [17179587.636000] scsi 0:0:5:0: Direct-Access     IBM      IC35L073UCDY10-0 S27T PQ: 0 ANSI: 3
>> [17179587.736000]  target0:0:5: tagged command queuing enabled, command queue depth 16.
>> [17179587.828000]  target0:0:5: Beginning Domain Validation
>> [17179587.892000]  target0:0:5: asynchronous
>> [17179587.944000]  target0:0:5: wide asynchronous
>> [17179587.996000]  target0:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
>> [17179588.084000]  target0:0:5: Domain Validation skipping write tests
>> [17179588.160000]  target0:0:5: Ending Domain Validation
>> [17179588.220000] scsi 0:0:6:0: Direct-Access     QUANTUM  ATLAS5-9LVD      HP04 PQ: 0 ANSI: 3
>> [17179588.320000]  target0:0:6: tagged command queuing enabled, command queue depth 16.
>> [17179588.412000]  target0:0:6: Beginning Domain Validation
>> [17179588.476000]  target0:0:6: asynchronous
>> [17179588.528000]  target0:0:6: wide asynchronous
>> [17179588.580000]  target0:0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
>> [17179588.668000]  target0:0:6: Domain Validation skipping write tests
>> [17179588.744000]  target0:0:6: Ending Domain Validation
>> [17179591.132000] scsi 1:0:0:0: Direct-Access     ATA      Hitachi HDT72101 ST6O PQ: 0 ANSI: 5
>> [17179591.304000] scsi 3:0:0:0: Direct-Access     ATA      Hitachi HDT72101 ST6O PQ: 0 ANSI: 5
>> [17179591.440000] Driver 'sd' needs updating - please use bus_type methods
>> [17179591.608000] scsi 4:0:0:0: Direct-Access     ATA      Hitachi HDT72101 ST6O PQ: 0 ANSI: 5
>> [17179591.732000] sd 0:0:5:0: [sda] 143374650 512-byte hardware sectors (73408 MB)
>> [17179592.108000] sd 0:0:5:0: [sda] Write Protect is off
>> [17179592.168000] sd 0:0:5:0: [sda] Mode Sense: cb 00 00 08
>> [17179592.296000] hda: ATAPI 48X CD-ROM drive, 128kB Cache
>> [17179592.356000] Uniform CD-ROM driver Revision: 3.20
>> [17179592.524000] sd 0:0:5:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
>> [17179592.640000] sd 0:0:5:0: [sda] 143374650 512-byte hardware sectors (73408 MB)
>> [17179592.728000] sd 0:0:5:0: [sda] Write Protect is off
>> [17179592.788000] sd 0:0:5:0: [sda] Mode Sense: cb 00 00 08
>> [17179592.788000] sd 0:0:5:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
>> [17179592.904000]  sda: sda1
>> [17179592.964000] sd 0:0:5:0: [sda] Attached SCSI disk
>> [17179593.044000] sd 0:0:6:0: [sdb] 17773524 512-byte hardware sectors (9100 MB)
>> [17179593.140000] sd 0:0:6:0: [sdb] Write Protect is off
>> [17179593.204000] sd 0:0:6:0: [sdb] Mode Sense: e3 00 10 08
>> [17179593.232000] sd 0:0:6:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
>> [17179593.348000] sd 0:0:6:0: [sdb] 17773524 512-byte hardware sectors (9100 MB)
>> [17179593.432000] sd 0:0:6:0: [sdb] Write Protect is off
>> [17179593.496000] sd 0:0:6:0: [sdb] Mode Sense: e3 00 10 08
>> [17179593.496000] sd 0:0:6:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
>> [17179593.600000]  sdb: sdb1 sdb2 sdb3 < sdb5 sdb6 sdb7 sdb8 > sdb4
>> [17179593.724000] sd 0:0:6:0: [sdb] Attached SCSI disk
>> [17179593.792000] sd 1:0:0:0: [sdc] 1953525168 512-byte hardware sectors (1000205 MB)
>> [17179593.884000] sd 1:0:0:0: [sdc] Write Protect is off
>> [17179593.944000] sd 1:0:0:0: [sdc] Mode Sense: 00 3a 00 00
>> [17179593.944000] sd 1:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [17179594.056000] sd 1:0:0:0: [sdc] 1953525168 512-byte hardware sectors (1000205 MB)
>> [17179594.148000] sd 1:0:0:0: [sdc] Write Protect is off
>> [17179594.208000] sd 1:0:0:0: [sdc] Mode Sense: 00 3a 00 00
>> [17179594.208000] sd 1:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [17179594.320000]  sdc: sdc1
>> [17179594.364000] sd 1:0:0:0: [sdc] Attached SCSI disk
>> [17179594.432000] sd 3:0:0:0: [sdd] 1953525168 512-byte hardware sectors (1000205 MB)
>> [17179594.520000] sd 3:0:0:0: [sdd] Write Protect is off
>> [17179594.584000] sd 3:0:0:0: [sdd] Mode Sense: 00 3a 00 00
>> [17179594.584000] sd 3:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [17179594.696000] sd 3:0:0:0: [sdd] 1953525168 512-byte hardware sectors (1000205 MB)
>> [17179594.784000] sd 3:0:0:0: [sdd] Write Protect is off
>> [17179594.844000] sd 3:0:0:0: [sdd] Mode Sense: 00 3a 00 00
>> [17179594.844000] sd 3:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [17179594.956000]  sdd: sdd1
>> [17179595.004000] sd 3:0:0:0: [sdd] Attached SCSI disk
>> [17179595.068000] sd 4:0:0:0: [sde] 1953525168 512-byte hardware sectors (1000205 MB)
>> [17179595.160000] sd 4:0:0:0: [sde] Write Protect is off
>> [17179595.220000] sd 4:0:0:0: [sde] Mode Sense: 00 3a 00 00
>> [17179595.220000] sd 4:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [17179595.332000] sd 4:0:0:0: [sde] 1953525168 512-byte hardware sectors (1000205 MB)
>> [17179595.424000] sd 4:0:0:0: [sde] Write Protect is off
>> [17179595.484000] sd 4:0:0:0: [sde] Mode Sense: 00 3a 00 00
>> [17179595.484000] sd 4:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [17179595.596000]  sde: sde1
>> [17179595.640000] sd 4:0:0:0: [sde] Attached SCSI disk
>> [17179596.980000] md: linear personality registered for level -1
>> [17179597.088000] md: multipath personality registered for level -4
>> [17179597.200000] md: raid0 personality registered for level 0
>> [17179597.312000] md: raid1 personality registered for level 1
>> [17179597.416000] xor: measuring software checksum speed
>> [17179597.496000]    8regs     :   943.000 MB/sec
>> [17179597.568000]    8regs_prefetch:   933.000 MB/sec
>> [17179597.644000]    32regs    :   960.000 MB/sec
>> [17179597.716000]    32regs_prefetch:   945.000 MB/sec
>> [17179597.772000] xor: using function: 32regs (960.000 MB/sec)
>> [17179597.848000] async_tx: api initialized (sync-only)
>> [17179598.012000] raid6: int32x1    183 MB/s
>> [17179598.128000] raid6: int32x2    230 MB/s
>> [17179598.244000] raid6: int32x4    272 MB/s
>> [17179598.360000] raid6: int32x8    213 MB/s
>> [17179598.408000] raid6: using algorithm int32x4 (272 MB/s)
>> [17179598.468000] md: raid6 personality registered for level 6
>> [17179598.536000] md: raid5 personality registered for level 5
>> [17179598.604000] md: raid4 personality registered for level 4
>> [17179598.896000] md: raid10 personality registered for level 10
>> [17179599.136000] md: bind<sdd1>
>> [17179599.172000] md: bind<sde1>
>> [17179599.208000] md: bind<sdc1>
>> [17179599.324000] raid5: device sdc1 operational as raid disk 0
>> [17179599.392000] raid5: device sdd1 operational as raid disk 1
>> [17179599.460000] raid5: allocated 3176kB for md0
>> [17179599.512000] raid5: raid level 5 set md0 active with 2 out of 3 devices, algorithm 2
>> [17179599.608000] RAID5 conf printout:
>> [17179599.648000]  --- rd:3 wd:2
>> [17179599.684000]  disk 0, o:1, dev:sdc1
>> [17179599.728000]  disk 1, o:1, dev:sdd1
>> [17179600.672000] EXT3-fs: INFO: recovery required on readonly filesystem.
>> [17179600.752000] EXT3-fs: write access will be enabled during recovery.
>> [17179601.128000] kjournald starting.  Commit interval 5 seconds
>> [17179601.196000] EXT3-fs: recovery complete.
>> [17179601.244000] EXT3-fs: mounted filesystem with ordered data mode.
>> [17179603.920000] udevd version 125 started
>> [17179604.124000] usb usb1: uevent
>> [17179604.124000] usb 1-0:1.0: uevent
>> [17179609.280000] Adding 489940k swap on /dev/sdb7.  Priority:-1 extents:1 across:489940k
>> [17179609.764000] EXT3 FS on sdb5, internal journal
>> [17179610.860000] LASI 82596 driver - Revision: 1.30
>> [17179610.980000] loop: module loaded
>> [17179616.900000] RAID5 conf printout:
>> [17179616.944000]  --- rd:3 wd:2
>> [17179616.980000]  disk 0, o:1, dev:sdc1
>> [17179617.024000]  disk 1, o:1, dev:sdd1
>> [17179617.072000]  disk 2, o:1, dev:sde1
>> [17179617.116000] md: recovery of RAID array md0
>> [17179617.168000] md: minimum _guaranteed_  speed: 1000 KB/sec/disk.
>> [17179617.240000] md: using maximum available idle IO bandwidth (but not more than 200000 KB/sec) for recovery.
>> [17179617.360000] md: using 128k window, over a total of 976759936 blocks.
>> [17179632.056000] kjournald starting.  Commit interval 5 seconds
>> [17179632.140000] EXT3 FS on sdb8, internal journal
>> [17179632.196000] EXT3-fs: mounted filesystem with ordered data mode.
>> [17179632.312000] kjournald starting.  Commit interval 5 seconds
>> [17179632.392000] EXT3 FS on sdb4, internal journal
>> [17179632.448000] EXT3-fs: mounted filesystem with ordered data mode.
>> [17179632.556000] kjournald starting.  Commit interval 5 seconds
>> [17179632.632000] EXT3 FS on sdb6, internal journal
>> [17179632.688000] EXT3-fs: mounted filesystem with ordered data mode.
>> [17179632.816000] kjournald starting.  Commit interval 5 seconds
>> [17179632.920000] EXT3 FS on sda1, internal journal
>> [17179632.976000] EXT3-fs: mounted filesystem with ordered data mode.
>> [17179633.408000] kjournald starting.  Commit interval 5 seconds
>> [17179633.512000] EXT3 FS on md0, internal journal
>> [17179633.564000] EXT3-fs: mounted filesystem with ordered data mode.
>> [17179639.712000] eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.
> 
> 


-- 
Dirk Van Hertem                       Dirk.VanHertem@esat.kuleuven.be
Electrical Engineering Department  http://www.esat.kuleuven.be/electa
K.U. Leuven, ESAT-ELECTA                         tel: +32-16-32.18.95
10, Kasteelpark Arenberg, B-3001 Heverlee        fax: +32-16-32.19.85

--------------000803000503010300030909
Content-Type: text/plain;
 name="ser_pim.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ser_pim.txt"

Main Menu: Enter command > ser pim

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp =
  Fri May  15 20:19:22 GMT 2009    (20:09:05:15:20:19:22)

HPMC Chassis Codes = 2cbf0  2500b  2cbf2  2cbfc

General Registers 0 - 31
00-03   0000000000000000  000000001021d000  00000000000fca38  000000004df4c074
04-07   0000000000000000  000000004df4d380  000000000008073c  000000004df4c000
08-11   0000000000102598  0000000000013000  0000000000000000  0000000000013000
12-15   0000000000000000  0000000000000005  00000000001ca06c  00000000f0400004
16-19   000000004e1f8540  00000000f000017c  00000000f0000174  000000004df4c000
20-23   0000000000000001  0000000000066004  0000000000066000  000000004f497b30
24-27   0000000000000001  ffffffff80000000  000000004df4c074  00000000103850f0
28-31   0000000001000000  0000000000066380  000000004e1f8bc0  0000000000000004

<Press any key to continue (q to quit)>

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   000000000000003a  0000000000000000  00000000000000c0  0000000000000001
12-15   0000000000000000  0000000000000000  000000000010d000  00000000fe000000
16-19   000002aeeacf3b1a  0000000000000000  0000000000070464  000000000ff6009c
20-23   00000000a627ffd2  0000000008066004  000000ff0004ff0e  0000000080000000
24-27   00000000003c7000  000000003e402000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  000000004e1f8000  0000000011111111
Space Registers 0 - 7

00-03   00000000          00000000          00000000          0000001d
04-07   00000000          00000000          00000000          00000000
<Press any key to continue (q to quit)>

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000070468
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fff4820004
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  0000000000000000
04-07   7ff7ffffffffffff  41d25c49fb800000  000000058c000000  7ff7ffffffffffff
08-11   000000000000fe9c  000000024f415bc0  4f415bc800000000  1056c58000000003
12-15   5555555555555555  5555555555555555  5555555555555555  5555555555555555
16-19   5555555555555555  5555555555555555  5555555555555555  5555555555555555
20-23   5555555555555555  5555555555555555  0000008099999e4f  003a2c6a00000000
24-27   0000000000000000  000000001d163500  00001c3e103d2b48  1022b1c810263260
28-31   ffffffff00001c3e  103990b01018c6ec  103990b000000190  4f42428010115ed0

<Press any key to continue (q to quit)>


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81041008000000
Available Memory             = 0x0000000040000000
CPU Diagnose Register 2      = 0x0301000000000004
CPU Status Register 0        = 0x2420c20000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0xc100f0fff4820004
Read Short LOG               = 0xc1a0f0fff4820004
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0xc1bff0fffed08040
RUN_DATA_LOW                 = 0xc1bff0fffed08040
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc1bff0fffed08040
System Responder Path        = 0x00ffffff0a010400


HPMC PIM Analysis Information:

Timestamp =
  Fri May  15 20:19:22 GMT 2009    (20:09:05:15:20:19:22)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

A Data I/O Fetch Timeout occurred while CPU 0 was
requesting information from a device at the path 10/1/4/0 (PCI slot 4).


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not log
any additional information about the HPMC.

<Press any key to continue (q to quit)>

-----------------  Processor 0 LPMC Information ------------------

Check Type                   = 0x00000000
I/D Cache Parity Info        = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000


-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000

<Press any key to continue (q to quit)>

<Press any key to continue (q to quit)>

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000000000
CPU State                    = 0x00000000
<Press any key to continue (q to quit)>

Memory Error Log Information:

Timestamp =
  Fri May  15 20:19:22 GMT 2009    (20:09:05:15:20:19:22)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged


I/O Module Error Log Information:

Timestamp =
  Fri May  15 20:19:22 GMT 2009    (20:09:05:15:20:19:22)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    ----------   0x1e0cc2a9   ------------------
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    ----------   0x4e0cc009   ------------------
   5    ----------   0x5e0cc009   ------------------
   6    ----------   0x6e0cc009   ------------------
   7    ----------   0x7e0cc009   ------------------
Main Menu: Enter command >



--------------000803000503010300030909--
