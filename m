From: Michael Greene <listsnews@cox.net>
Subject: [parisc-linux] Help with J5600 (Model: 9000/785/J5600)
Date: Thu, 25 Jan 2007 18:52:39 -0500
Message-ID: <epbfs6$62t$1__35418.9114099883$1416624634$gmane$org@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux@parisc-linux.org
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

I am trying to get any version of hppa linux running on an old J5600, 
but I am having no luck.  I have tried several debian and gentoo 
installs still nothing. Yesterday I attempted to use an etch cd to boot 
>from http://www.debian.org/devel/debian-installer/ (daily built images):

TST 10FD: CPU0 testing scratch RAM system state word
TST 11FD: CPU1 testing scratch RAM system state word
INI 10FC: CPU0 synchronizing
INI 11FC: CPU1 synchronizing
INI C100: CPU0 selected as monarch
INI CC11: CPU1 early rendezvous
TST 3000: verifying ROM checksum
INI 3000: ROM checksum ok
TST 3001: PDH control test
INI 3001: PDH control init
TST 3002: scratch RAM test
TST 30BC: test system clocks
INI 30BC: initialize system clocks
INI CC21: CPU1 rendezvous
INI C4CC: initialize close console
INI C4CD: close console not found
INI 3002: scratch RAM ok
INI CC21: CPU1 rendezvous
INI C30C: monarch slave check
INI 10CA: CPU0 initialize system bus arbitration
INI C300: early monarch0 selftest
INI D000: micro controller interface test
INI D005: setting domain1 fan speeds
INI D006: setting domain2 fan speeds
TST 1030: CPU0 start early selftests
WRN 1031: CPU0 early selftests skipped
INI 103C: CPU0 initialize
TST 103E: CPU0 exit early selftests
TST 1130: CPU1 start early selftests
INI C30C: monarch slave check
WRN 1131: CPU1 early selftests skipped
INI 113C: CPU1 initialize
TST 113E: CPU1 exit early selftests
INI CC21: CPU1 rendezvous
INI 10CA: CPU0 initialize system bus arbitration
INI CC31: CPU1 cache rendezvous
INI C30C: monarch slave check
INI 10CA: CPU0 initialize system bus arbitration
INI 7000: start memory DIMM scan
INI 7500: memory reset
INI 7002: initialize memory tables
WRN 7101: memory register test skipped
INI 7200: starting memory DIMM detection
INI 7201: memory DIMM detection   0% complete
INI 7210: is DIMM 00 installed?
INI 7260: 1GB DIMM in memory slot 00
INI 7201: memory DIMM detection  12% complete
INI 7211: is DIMM 01 installed?
INI 7201: memory DIMM detection  25% complete
INI 7212: is DIMM 02 installed?
INI 7201: memory DIMM detection  37% complete
INI 7213: is DIMM 03 installed?
INI 7201: memory DIMM detection  50% complete
INI 7214: is DIMM 04 installed?
INI 7201: memory DIMM detection  62% complete
INI 7215: is DIMM 05 installed?
INI 7201: memory DIMM detection  75% complete
INI 7216: is DIMM 06 installed?
INI 7201: memory DIMM detection  87% complete
INI 7217: is DIMM 07 installed?
INI 7201: memory DIMM detection 100% complete
TST 7010: start memory DIMM order check
TST 7016: start memory DIMM pair loading check
TST 7020: search for initial memory bank
TST 7030: verify DIMM 00 still works as initial memory module
INI 7307: generate memory interleave
TST 7600: destructive memory test
TST 7602: destructively test first page of memory
TST 7604:   starting 1st pass of memory test
TST 7606:   starting 2nd pass of memory test
TST 7608:   starting 3rd pass of memory test
TST 7603: destructively testing the rest of memory
TST 7604:   starting 1st pass of memory test
TST 7606:   starting 2nd pass of memory test
TST 7608:   starting 3rd pass of memory test
INI 70F0: memory DIMM scan complete
INI 8805: I/O subsystem init
INI 7300: memory configuration starting
INI 7500: memory reset
TST 7301: check for memory configuration change since last boot
INI 7303: memory unchanged--use saved configuration from NVM
INI 7304: interleave memory DIMMs
INI 7307: generate memory interleave
TST 7600: destructive memory test
WRN 7601: initialize memory only (don't test)
TST 760A: starting memory initialization
TST 760B:   memory initialization  25% complete
TST 760B:   memory initialization  50% complete
TST 760B:   memory initialization  75% complete
TST 760B:   memory initialization 100% complete
INI 730F: memory configuration complete
INI 8800: PCI BusWalk starting
INI 8801: Walking Rope 0
INI 8811: Walking Rope 1
INI 8821: Walking Rope 2
INI 8841: Walking Rope 4
INI 8861: Walking Rope 6
INI 8802: PCI BusWalk complete
INI 8803: PCI alloc complete
INI 8804: PCI config complete
WRN 4001: CPU0 late selftests skipped
INI 103C: CPU0 initialize
TST 400E: CPU0 exiting late selftests
WRN 4101: CPU1 late selftests skipped
INI 113C: CPU1 initialize
TST 410E: CPU1 exiting late selftests
INI CC41: CPU1 memory rendezvous
TST 301B: check model string
TST 301C: check/update software ID
TST C687: try to initialize graphics in slot 7
INI C687: initialized graphics in slot 7
INI 9151: initialize SERIAL_1


INI 9C51: console is SERIAL_1

Firmware Version 5.0


Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------

    (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved

------------------------------------------------------------------------------


   Processor   Speed            State           Coprocessor State  I/D Cache

   ---------  --------   ---------------------  ----------------- 
-------------

       0      552 MHz    Active                 Functional         512 
kB/1 MB
       1      552 MHz    Idle                   Functional         512 
kB/1 MB

   Central Bus Speed:                   120 MHz

   Available memory:             1073741824 bytes
   Good memory required:           87908352 bytes

   Primary boot path:    FWSCSI.6.0
   Alternate boot path:  SCSI.3.0
   Console path:         SERIAL_1.9600.8.none
   Keyboard path:        USB


CPU 0
NOTICE :  Processor self-tests have been disabled because FASTBOOT is
           enabled.  To enable self-tests, disable FASTBOOT with the 
FASTBOOT
           command in the CONFIGURATION menu and reboot the system.
NOTICE :  Memory has been initialized but not tested because FASTBOOT is
           enabled.  To test memory, disable FASTBOOT with the FASTBOOT
           command in the CONFIGURATION menu and reboot the system.


CPU 1
NOTICE :  Processor self-tests have been disabled because FASTBOOT is
           enabled.  To enable self-tests, disable FASTBOOT with the 
FASTBOOT
           command in the CONFIGURATION menu and reboot the system.


----- Main Menu 
-------------------------------------------------------------

       Command                           Description
       -------                           -----------
       BOot [PRI|ALT|<path>]             Boot from specified path
       PAth [PRI|ALT|CON|KEY [<path>]]   Display or modify a path
       SEArch [DIsplay|[[IPL] [<path>]]] Search for boot devices

       COnfiguration [<command>]         Access Configuration menu/commands
       INformation [<command>]           Access Information menu/commands
       SERvice [<command>]               Access Service menu/commands

       DIsplay                           Redisplay the current menu
       HElp [<menu>|<command>]           Display help for menu or command
       RESET                             Restart the system
-----
Main Menu: Enter command > sea


Searching for potential boot device(s)...

This may take several minutes.


To discontinue search, press any key (termination may not be immediate).



    Path Number        Device Path              Device Type

    -----------        -----------------        -----------

    P0                 SCSI.3.0                 TOSHIBA CD-ROM XM-5401TA
    P1                 SCSI.2.0                 HP      C1537A
    P2                 FWSCSI.6.0               FUJITSU MAJ3182MC


Main Menu: Enter command > bo p0

Interact with IPL (Y, N, Q)?> y

INI C740: initialize other path


Booting...

Boot IO Dependent Code (IODC) revision 0
INI C780: load IPL other path
INI CC41: CPU1 memory rendezvous
INI C30C: monarch slave check
INI 10CA: CPU0 initialize system bus arbitration




HARD Booted.

INI C7FF: launch IPL other
palo ipl 1.14 root@duet Sat Apr  8 16:08:16 EDT 2006


Boot image contains:

     0/vmlinux32 4179284 bytes @ 0xc60000

     0/vmlinux64 5784983 bytes @ 0x6db800

     0/ramdisk 4501015 bytes @ 0x287800


Information: No console specified on kernel command line. This is normal.

PALO will choose the console currently used by firmware (serial).Current 
command line:

'0/vmlinux root=/dev/ram initrd=0/ramdisk ramdisk_size=12432' 
console=ttyS0 TERM=vt102

  0: '0/vmlinux

  1: root=/dev/ram

  2: initrd=0/ramdisk

  3: ramdisk_size=12432'

  4: console=ttyS0

  5: TERM=vt102


<#>    edit the numbered field

'b'    boot with this command line

'r'    restore command line

'l'    list dir

? 0

'0/vmlinux32

Current command line:

'0/vmlinux32 root=/dev/ram initrd=0/ramdisk ramdisk_size=12432' 
console=ttyS0 TERM=vt102

  0: '0/vmlinux32

  1: root=/dev/ram

  2: initrd=0/ramdisk

  3: ramdisk_size=12432'

  4: console=ttyS0

  5: TERM=vt102


<#>    edit the numbered field

'b'    boot with this command line

'r'    restore command line

'l'    list dir

? 0 b


Command line for kernel: 'root=/dev/ram ramdisk_size=12432' 
console=ttyS0 TERM=vt102 palo_kernel=0'0/vmlinux32'

Selected kernel: '0/vmlinux32 from partition 0

Selected ramdisk: /ramdisk from partition 0

ELF32 executable

Entry 00100000 first 00100000 n 3

Segment 0 load 00100000 size 2384552 mediaptr 0x1000

Segment 1 load 00347000 size 499712 mediaptr 0x248000

Segment 2 load 003fc000 size 381062 mediaptr 0x2c2000

Loading ramdisk 4501015 bytes @ 3fba4000...

Branching to kernel entry point 0x00100000.  If this is the last

message you see, you may need to switch your console.  This is

a common symptom -- search the FAQ and mailing list at parisc-linux.org


Linux version 2.6.18-3-parisc (Debian 2.6.18-7) (waldi@debian.org) (gcc 
version 4.1.2 20061115 (prerelease) (Debian 4.1.1-20)) #1 Mon Dec 4 
09:17:59 MST 2006
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005d10 00000491 00000000 00000002 781d75ff 100000f0 00000008 
000000b2 000000b2
vers  00000300
CPUID vers 17 rev 10 (0x0000022a)
capabilities 0x3
model 9000/785/J5600
Total Memory: 1024 MB
initrd: 4fba4000-4ffeee17
initrd: reserving 3fba4000-3ffeee17 (mem_max 40000000)
LCD display at f05d0008,f05d0000 registered
Built 1 zonelists.  Total pages: 262144
Kernel command line: root=/dev/ram ramdisk_size=12432' console=ttyS0 
TERM=vt102 palo_kernel=0'0/vmlinux32
PID hash table entries: 4096 (order: 12, 16384 bytes)
start_kernel(): bug: interrupts were enabled early
Console: colour dummy device 160x64
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 1048576k available
Security Framework v1.0.0 initialized
SELinux:  Disabled at boot.
Capability LSM initialized
Mount-cache hash table entries: 512
checking if image is initramfs... it is
Freeing initrd memory: 4395k freed
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed34000 [10/2] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
7. Forte W+ 2w at 0xfffa0000 [32] { 0, 0x0, 0x5d1, 0x00004 }
8. Forte W+ 2w at 0xfffa2000 [34] { 0, 0x0, 0x5d1, 0x00004 }
9. Memory at 0xfed10200 [49] { 1, 0x0, 0x09e, 0x00009 }
Enabling regular chassis codes support v0.05
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 34 failed with error 1
CPU(s): 1 x PA8600 (PCX-W+) at 552.000000 MHz
Setting cache flush threshold to 1ec0 (1 CPUs online)
SBA found Astro 2.1 at 0xfed00000
Elroy version TR4.0 (0x5) found at 0xfed30000
PCI: Enabled native mode for NS87415 (pif=0x8f)
iosapic: 0xfed30800 : no IRT entry for slot 12, pin 1
iosapic: no IRTE for 0000:00:0c.0 (IRQ not connected?)
iosapic: 0xfed30800 : no IRT entry for slot 13, pin 1
iosapic: no IRTE for 0000:00:0d.0 (IRQ not connected?)
iosapic: 0xfed30800 : no IRT entry for slot 14, pin 4
iosapic: no IRTE for 0000:00:0e.2 (IRQ not connected?)
iosapic: 0xfed30800 : no IRT entry for slot 15, pin 1
iosapic: no IRTE for 0000:00:0f.0 (IRQ not connected?)
iosapic: 0xfed30800 : no IRT entry for slot 15, pin 1
iosapic: no IRTE for 0000:00:0f.1 (IRQ not connected?)
Elroy version TR4.0 (0x5) found at 0xfed32000
Elroy version TR4.0 (0x5) found at 0xfed34000
Elroy version TR4.0 (0x5) found at 0xfed38000
Elroy version TR4.0 (0x5) found at 0xfed3c000
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 7, 524288 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
Enabling PDC chassis warnings support v0.05
unwind_init: start = 0x10348cc0, end = 0x1036d620, entries = 9366
audit: initializing netlink socket (disabled)
audit(1169660597.080:1): initialized
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 1)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
PDC Stable Storage facility v0.30
Soft power switch enabled, polling @ 0xf0400804.
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f7000000 (128 kB), fb at fb000000 (16 MB)
     id 35acda16-9a02587, conforms to spec rev. 8.0c
     graphics card name: HPA4982A
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
stifb: 'HPA4982A' (id: 0x35acda16) not supported.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A
serial8250: ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 12432K size 1024 blocksize
mice: PS/2 mouse device common for all mice
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
Freeing unused kernel memory: 328k freed
SCSI subsystem initialized
sym0: <875> rev 0x4 at pci 0000:00:01.0 irq 65
Linux Tulip driver version 1.1.13-NAPI (May 11, 2002)
sym0: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
usbcore: registered new driver usbfs
usbcore: registered new driver hub
sym1: <896> rev 0x4 at pci 0000:00:0f.0 irq 1
sym1: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
IRQ handler type mismatch for IRQ 1
Backtrace:
  [<1014a834>] setup_irq+0x204/0x228
  [<1014a904>] request_irq+0xac/0xe8
  [<000a7fa8>] sym2_probe+0x624/0x830 [sym53c8xx]
  [<1022d2e8>] pci_device_probe+0x54/0x94
  [<1026d8cc>] driver_probe_device+0x58/0xdc
  [<1026da98>] __driver_attach+0x84/0xf0
  [<1026d1e8>] bus_for_each_dev+0x58/0x9c
  [<1026cd74>] bus_add_driver+0x78/0x148
  [<1022d4e0>] __pci_register_driver+0x44/0x78
  [<00031124>] sym2_init+0xfc/0x124 [sym53c8xx]

sym1: request irq 1 failure
sym1: giving up ...
Trying to free already-free IRQ 1
sym1: <896> rev 0x4 at pci 0000:00:0f.1 irq 1
sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
IRQ handler type mismatch for IRQ 1
Backtrace:
  [<1014a834>] setup_irq+0x204/0x228
  [<1014a904>] request_irq+0xac/0xe8
  [<000a7fa8>] sym2_probe+0x624/0x830 [sym53c8xx]
  [<1022d2e8>] pci_device_probe+0x54/0x94
  [<1026d8cc>] driver_probe_device+0x58/0xdc
  [<1026da98>] __driver_attach+0x84/0xf0
  [<1026d1e8>] bus_for_each_dev+0x58/0x9c
  [<1026cd74>] bus_add_driver+0x78/0x148
  [<1022d4e0>] __pci_register_driver+0x44/0x78
  [<00031124>] sym2_init+0xfc/0x124 [sym53c8xx]

sym1: request irq 1 failure
sym1: giving up ...
Trying to free already-free IRQ 1
sym1: <875> rev 0x4 at pci 0000:02:02.0 irq 66
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1200 status 7809 advertising 01e1.
eth0: Digital DS21142/43 Tulip rev 65 at Port 0x1000, 00:10:83:FF:1E:7E, 
IRQ 2.
NS87415: IDE controller at PCI slot 0000:00:0e.0
NS87415: chipset revision 3
NS87415: 100% native mode on irq 7
     ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:DMA, hdb:DMA
     ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:DMA, hdd:DMA
sym1: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym1: SCSI BUS has been reset.
scsi3 : sym-2.2.3
ohci_hcd 0000:00:0e.2: OHCI Host Controller
ohci_hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
IRQ handler type mismatch for IRQ 1
Backtrace:
  [<1014a834>] setup_irq+0x204/0x228
  [<1014a904>] request_irq+0xac/0xe8
  [<001086e4>] usb_add_hcd+0x324/0x654 [usbcore]
  [<00111404>] usb_hcd_pci_probe+0x21c/0x2c0 [usbcore]
  [<1022d2e8>] pci_device_probe+0x54/0x94
  [<1026d8cc>] driver_probe_device+0x58/0xdc
  [<1026da98>] __driver_attach+0x84/0xf0
  [<1026d1e8>] bus_for_each_dev+0x58/0x9c
  [<1026cd74>] bus_add_driver+0x78/0x148
  [<1022d4e0>] __pci_register_driver+0x44/0x78
  [<10143d1c>] sys_init_module+0x123c/0x13ec
  [<1010c134>] syscall_exit+0x0/0x14

ohci_hcd 0000:00:0e.2: request interrupt 1 failed
ohci_hcd 0000:00:0e.2: USB bus 1 deregistered
ohci_hcd 0000:00:0e.2: init 0000:00:0e.2 fail, -16
ohci_hcd: probe of 0000:00:0e.2 failed with error -16

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
