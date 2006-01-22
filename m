From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] rcu torture test panics on 2-way pa8800
Date: Sun, 22 Jan 2006 00:13:08 -0700
Message-ID: <20060122071308.GA8592@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,
I accidentally include RCU_TORTURE_TEST=y in the 2.6.16-rc1-pa2
kernels I was building and it worked fine on two out of three
of the rp3440 (pa8800 CPU) boxes I'm banging on.
(trying to sort out issues with L2 that I don't understand).

Got the following panic on the 2-core 800Mz box:

BUG: soft lockup detected on CPU#0!
...
IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001010ec1c 000000001010ec20
 IIR: 0f40109c    ISR: 00000000106c1a98  IOR: 0000000000000000
 CPU:        0   CR30: 0000000011ff0000 CR31: 00000000105bc000
 ORIG_R28: 00000000105b67a8
 IAOQ[0]: _spin_lock+0x4/0x20
 IAOQ[1]: _spin_lock+0x8/0x20
 RP(r2): rcu_torture_cb+0x11c/0x178

Full console output is appended.

This test seems to be running fine on 4-way 800 Mhz and 4-way 1Ghz.
I expect the timing will be different since 4-way has to talk across
the Mckinley bus and the 2-way (2 cores in one socket) communicate
across the L2.

I'm not sure if this is another clue to the L2 caching problems or 
exposing a bug in something related to our RCU implementation.
Maybe it's both. I don't know.

Has anyone else run with RCU_TORTURE_TEST=y ?

thanks,
grant



Firmware Version  45.11

Duplex Console IO Dependent Code (IODC) revision 1
------------------------------------------------------------------------------
   (c) Copyright 1995-2004, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      800  MHz   Active                 Functional         33554432 33554432
      1      800  MHz   Idle                   Functional         33554432 33554432

  Central Bus Speed (in MHz)  :        200  
  Available Memory            :    4194300  KB
  Good Memory Required        : Not initialized. Defaults to 32 MB. 

   Primary boot path:    0/1/1/0.0           
   Alternate boot path:  0/0/2/0.3           
   Console path:         0/7/1/1.0           
   Keyboard path:        0/0/4/0.0           

   *** Manufacturing permissions ON ***
   System is hp server series



---- Main Menu ---------------------------------------------------------------

     Command                           Description
     -------                           -----------
     BOot [PRI|ALT|<path>]             Boot from specified path
     PAth [PRI|ALT|CON|KEY] [<path>]   Display or modify a path
     SEArch [DIsplay|IPL] [<path>]     Search for boot devices

     COnfiguration menu                Displays or sets boot values
     INformation menu                  Displays hardware information
     SERvice menu                      Displays service commands
     DeBug menu                        Displays debug commands
     MFG menu                          Displays manufacturing commands

     DIsplay                           Redisplay the current menu
     HElp [<menu>|<command>]           Display help for menu or command
     RESET                             Restart the system
----
Main Menu: Enter command or menu > bo
Interact with IPL (Y, N, or Cancel)?> y
...
Current command line:
1/vmlinux-2.6.16-rc1-pa1 pdcchassis=0 root=/dev/sda3 noudev panic=5 console=ttyS1
 0: 1/vmlinux-2.6.16-rc1-pa1
 1: pdcchassis=0
 2: root=/dev/sda3
 3: noudev
 4: panic=5
 5: console=ttyS1

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'pdcchassis=0 root=/dev/sda3 noudev panic=5 console=ttyS1 palo_kernel=1/vmlinux-2.6.16-rc1-pa1'
Selected kernel: /vmlinux-2.6.16-rc1-pa1 from partition 1
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4942808 mediaptr 0x1000
Segment 1 load 005b8000 size 437688 mediaptr 0x4b8000
Segment 2 load 00624000 size 545496 mediaptr 0x523000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.16-rc1-pa1 (grundler@gsyprf11) (gcc version 4.0.3 20051201 (prerelease) (Debian 4.0.2-5)) #3 SMP Thu Jan 19 17:26:22 PST 2006
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00008870 00000491 00000000 00000002 3e0505e7352af711 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/800/rp3440  
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
 1) Start 0x0000004040000000 End 0x00000040ffdfffff Size   3070 MB
Total Memory: 4094 MB
SMP: bootstrap CPU ID is 0
Built 2 zonelists
Kernel command line: pdcchassis=0 root=/dev/sda3 noudev panic=5 console=ttyS1 palo_kernel=1/vmlinux-2.6.16-rc1-pa1
PID hash table entries: 4096 (order: 12, 131072 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Memory: 4192256k available
Mount-cache hash table entries: 256
Brought up 1 CPUs
migration_cost=0
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Storm Peak Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x887, 0x00004 }
2. Storm Peak Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x887, 0x00004 }
3. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
4. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
5. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
6. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
7. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
8. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
9. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
10. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
11. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
12. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
Releasing cpu 1 now, hpa=fffffffffe781000
FP[1] enabled: Rev 1 Model 20
migration_cost=500
CPU(s): 2 x PA8800 (Mako) at 800.008700 MHz
Setting cache flush threshold to 26f9840 (2 CPUs online)
SBA found Pluto 2.3 at 0xfffffffffed00000
LBA version TR3.2 (0x32) found at 0xfffffffffed20000
LBA version TR3.2 (0x32) found at 0xfffffffffed22000
LBA version TR3.2 (0x32) found at 0xfffffffffed24000
LBA version TR3.2 (0x32) found at 0xfffffffffed26000
LBA version TR3.2 (0x32) found at 0xfffffffffed28000
LBA version TR3.2 (0x32) found at 0xfffffffffed2c000
LBA version TR3.2 (0x32) found at 0xfffffffffed2e000
LBA: Truncating lmmio_space [fffffffff0000000/fffffffffecffffe] to [fffffffff0000000,fffffffffe77ffff]
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
unwind_init: start = 0x104cf380, end = 0x104f9b90, entries = 10881
Performance monitoring counters enabled for Storm Peak Slow
rcutorture: --- Start of test: nreaders=4 stat_interval=0 verbose=0 test_no_idle_hz=0 shuffle_interval = 5
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
PDC Stable Storage facility v0.22
Soft power switch support not available.
STI GSC/PCI core graphics driver Version 0.9a
Generic RTC Driver v1.07
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 73) is a 16450
0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 73) is a 16550A
0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 73) is a 16550A
0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 73) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 70
sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.2
  Vendor: HP 36.4G  Model: ST336753LC        Rev: HPC3
  Type:   Direct-Access                      ANSI SCSI revision: 03
 target0:0:0: tagged command queuing enabled, command queue depth 16.
 target0:0:0: Beginning Domain Validation
 target0:0:0: asynchronous
 target0:0:0: FAST-40 SCSI 40.0 MB/s ST (25 ns, offset 31)
 target0:0:0: Domain Validation skipping write tests
 target0:0:0: Ending Domain Validation
sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 71
sym1: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.2
  Vendor: FUJITSU   Model: MAJ3364MC         Rev: HP12
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:2: tagged command queuing enabled, command queue depth 16.
 target1:0:2: Beginning Domain Validation
 target1:0:2: asynchronous
 target1:0:2: FAST-40 SCSI 40.0 MB/s ST (25 ns, offset 31)
 target1:0:2: Domain Validation skipping write tests
 target1:0:2: Ending Domain Validation
SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write through w/ FUA
SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write through w/ FUA
 sda: sda1 sda2 sda3
sd 0:0:0:0: Attached scsi disk sda
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
sdb: Write Protect is off
SCSI device sdb: drive cache: write back w/ FUA
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
sdb: Write Protect is off
SCSI device sdb: drive cache: write back w/ FUA
 sdb: unknown partition table
sd 1:0:2:0: Attached scsi disk sdb
sd 0:0:0:0: Attached scsi generic sg0 type 0
sd 1:0:2:0: Attached scsi generic sg1 type 0
usbmon: debugfs is not available
ehci_hcd 0000:00:01.2: EHCI Host Controller
ehci_hcd 0000:00:01.2: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:01.2: irq 68, io mem 0xffffffff80000000
ehci_hcd 0000:00:01.2: USB 2.0 started, EHCI 0.95, driver 10 Dec 2004
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.16-rc1-pa1 ehci_hcd
usb usb1: SerialNumber: 0000:00:01.2
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 5 ports detected
ohci_hcd 0000:00:01.0: OHCI Host Controller
ohci_hcd 0000:00:01.0: new USB bus registered, assigned bus number 2
ohci_hcd 0000:00:01.0: irq 66, io mem 0xffffffff80002000
usb usb2: Product: OHCI Host Controller
usb usb2: Manufacturer: Linux 2.6.16-rc1-pa1 ohci_hcd
usb usb2: SerialNumber: 0000:00:01.0
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 3 ports detected
ohci_hcd 0000:00:01.1: OHCI Host Controller
ohci_hcd 0000:00:01.1: new USB bus registered, assigned bus number 3
ohci_hcd 0000:00:01.1: irq 67, io mem 0xffffffff80001000
usb usb3: Product: OHCI Host Controller
usb usb3: Manufacturer: Linux 2.6.16-rc1-pa1 ohci_hcd
usb usb3: SerialNumber: 0000:00:01.1
usb usb3: configuration #1 chosen from 1 choice
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
usbcore: registered new driver libusual
mice: PS/2 mouse device common for all mice
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
raid5: measuring checksumming speed
   8regs     :  3840.000 MB/sec
   8regs_prefetch:  2840.000 MB/sec
   32regs    :  3816.000 MB/sec
   32regs_prefetch:  3124.000 MB/sec
raid5: using function: 8regs (3840.000 MB/sec)
md: md driver 0.90.3 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: bitmap version 4.39
Advanced Linux Sound Architecture Driver Version 1.0.11rc2 (Wed Jan 04 08:57:20 2006 UTC).
ALSA device list:
  No soundcards found.
oprofile: using timer interrupt.
NET: Registered protocol family 2
IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: Badness in smp_call_function at arch/parisc/kernel/smp.c:348
Backtrace:
 [<00000000101125f8>] dump_stack+0x18/0x28
 [<000000001011c4d8>] smp_call_function+0x90/0x398
 [<00000000101119b4>] flush_data_cache+0x2c/0x48
 [<0000000010110d48>] free_initmem+0x68/0x310
 [<000000001010fe00>] init+0x688/0x7f8
 [<000000001010347c>] ret_from_kernel_thread+0x24/0x40

536k freed
Write protecting the kernel read-only data: 356k
Failed to mount /selinux/: No such file or directory
INIT: version 2.86 booting
Activating swap...
.
Checking root file system.../dev/sda3: clean, 147172/4308992 files, 820135/8612848 blocks
.
Cleaning up ifupdown...done.
Calculating module dependencies...done.
Loading modules...
    tg3
tg3.c:v3.47 (Dec 28, 2005)
eth0: Tigon3 [partno(BCM95700A6) rev 0105 PHY(5701)] (PCI:66MHz:64-bit) 10/100/1000BaseT Ethernet 00:30:6e:4b:16:4d
eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] Split[0] WireSpeed[1] TSOcap[0] 
eth0: dma_rwctrl[76ff2d0f]
All modules loaded.
Setting the System Clock using the Hardware Clock as reference
System Clock set. Local time: Sun Jan 22 04:28:35 UTC 2006
.
Checking all file systems.../dev/sda1: clean, 50/26104 files, 79469/104388 blocks
.
Setting kernel variables ...
... done.
Mounting local filesystems.../dev/sda1 on /boot type ext2 (rw)
.
Cleaning /tmp....
Cleaning /var/run ....
Cleaning /var/lock ....
Running 0dns-down to make sure resolv.conf is ok...done.
Setting up networking...done.
Starting hotplug subsystem:
   pci     
     tg3: already loaded
     ignoring pci display device e0:02.0
   pci      [success]
   usb     
   usb      [success]
   isapnp  
   isapnp   [success]
   ide     
   ide      [success]
   input   
   input    [success]
   scsi    
     sd_mod: can't be loaded (for disk)
     sd_mod: can't be loaded (for disk)
   scsi     [success]
done.
* /etc/network/options is deprecated.
Setting up IP spoofing protection...done (rp_filter).
Configuring network interfaces...Internet Software Consortium DHCP Client 2.0pl5
Copyright 1995, 1996, 1997, 1998, 1999 The Internet Software Consortium.
All rights reserved.

Please contribute if you find this software useful.
For info, please visit http://www.isc.org/dhcp-contrib.html

Listening on LPF/eth0/00:30:6e:4b:16:4d
Sending on   LPF/eth0/00:30:6e:4b:16:4d
Sending on   Socket/fallback/fallback-net
DHCPDISCOVER on eth0 to 255.255.255.255 port 67 interval 7
tg3: eth0: Link is up at 1000 Mbps, full duplex.
tg3: eth0: Flow control is off for TX and off for RX.
DHCPDISCOVER on eth0 to 255.255.255.255 port 67 interval 14
DHCPOFFER from 192.168.1.61
DHCPREQUEST on eth0 to 255.255.255.255 port 67
DHCPACK from 192.168.1.61
bound to 192.168.1.10 -- renewal in 302400 seconds.
done.
Starting portmap daemon: portmap.
Setting the System Clock using the Hardware Clock as reference
System Clock set. Local time: Sun Jan 22 04:29:08 UTC 2006
.
Running ntpdate to synchronize clockError : Temporary failure in name resolution
.
Initializing random number generator....
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Not starting portmap daemon.  Already running.
Starting Distributed Compiler Daemon: distccd.
Starting internet superserver: inetd.
Starting network benchmark server: netserver.
Starting Name Service Cache Daemon: nscd/usr/sbin/nscd: error while loading shared libraries: unexpected reloc type 0x42
.
Starting mail transport agent: Postfix

BUG: soft lockup detected on CPU#0!

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101111111100001111 Not tainted
r00-03  0000000000000000 000000001060b740 00000000101717dc 00000000106ce558
r04-07  000000001060a740 0000000010514b3c 0000000000000001 0000000000000000
r08-11  0000000000000001 0000000011ff0240 0000000000000001 000f434be4ce66c0
r12-15  0000000011ca0970 0000000000000000 00000000ffbfffff 00000000ffffffff
r16-19  0000000011ff0240 00000000ffffffff 00000000ffffffff 000000001059fc40
r20-23  000000000800000f 000000000800000f 0000000100128d00 0000000000000000
r24-27  0000000100128d04 0000004052a16688 0000000010514b3c 000000001060a740
r28-31  0000000000000000 0000000011ff09e0 0000000011ff0a10 00000000106ce010
sr0-3   000000000028a000 0000000000000000 0000000000000000 000000000028a000
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  0000000000000802 0000000010624000 00000000101a1bd4 00000000106aa000
fr08-11  0000000000000000 0000000011c6b000 0000000011c66ac0 0000000011c6b000
fr12-15  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr16-19  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr20-23  0000000000000000 0000000000000000 000000000000dda3 000000000000000e
fr24-27  0000000000000000 000f41fa2e797100 000000000804000e 0000000000000000
fr28-31  0000000011c6b000 fffffffffffffc18 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001010ec1c 000000001010ec20
 IIR: 0f40109c    ISR: 00000000106c1a98  IOR: 0000000000000000
 CPU:        0   CR30: 0000000011ff0000 CR31: 00000000105bc000
 ORIG_R28: 00000000105b67a8
 IAOQ[0]: _spin_lock+0x4/0x20
 IAOQ[1]: _spin_lock+0x8/0x20
 RP(r2): rcu_torture_cb+0x11c/0x178

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
