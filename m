From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG 2.6.9-rc2-pa9 data page fault in free_block()
Date: Sun, 26 Sep 2004 23:33:55 -0600
Message-ID: <20040927053355.GB12024@colo.lackof.org>
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

As promised, I built/booted -pa9 for a500 and it panic'd at
boot time with

Kernel Fault: Code=15 regs=000000001479c560 (Addr=00000001ffe3b618)
...
 IAOQ[0]: free_block+0xa8/0x1a0
 IAOQ[1]: free_block+0xac/0x1a0
 RP(r2): drain_array_locked+0xe4/0x118

Full console output appended.

Oh...I just noticed that's right after/while fusion driver initialized.
I couldn't get that work reliably on c3000 with 2.6.8.1 either.
So that's my first suspect. :^(

thanks,
grant



Firmware Version  40.50

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      440  MHz   Active                 Functional         512 KB   1 MB
      1      440  MHz   Idle                   Functional         512 KB   1 MB

  Central Bus Speed (in MHz)  :        111  
  Available Memory            :    5242880  KB
  Good Memory Required        :      11468  KB

   Primary boot path:    0/0/1/1.15          
   Alternate boot path:  0/0/2/1.15          
   Console path:         0/0/4/0.0           
   Keyboard path:        0/0/4/0.0           

 WARNING:  The non-destructive test bit was set, so memory was not tested 
            destructively.  Information only, no action required. 


---- Main Menu ---------------------------------------------------------------

     Command                           Description
     -------                           -----------
     BOot [PRI|ALT|<path>]             Boot from specified path
     PAth [PRI|ALT] [<path>]           Display or modify a path
     SEArch [DIsplay|IPL] [<path>]     Search for boot devices

     COnfiguration menu                Displays or sets boot values
     INformation menu                  Displays hardware information
     SERvice menu                      Displays service commands

     DIsplay                           Redisplay the current menu
     HElp [<menu>|<command>]           Display help for menu or command
     RESET                             Restart the system
----
Main Menu: Enter command or menu > bo
Interact with IPL (Y, N, or Cancel)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004

Partition Start(MB) End(MB) Id Type
1               1     513   fd RAID
2             514     524   f0 Palo
3             525    2051   fd RAID
4            2052    8682   fd RAID

PALO(F0) partition contains:
    0/vmlinux64 4862163 bytes @ 0x20140000
Current command line:
3/boot/vmlinux-smp HOME=/ TERM=linux root=/dev/md2 console=ttyS0 pdcchassis=0
 0: 3/boot/vmlinux-smp
 1: HOME=/
 2: TERM=linux
 3: root=/dev/md2
 4: console=ttyS0
 5: pdcchassis=0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0
3/boot/vmlinux-2.6.9-rc2-pa9
Current command line:
3/boot/vmlinux-2.6.9-rc2-pa9 HOME=/ TERM=linux root=/dev/md2 console=ttyS0 pdcchassis=0
 0: 3/boot/vmlinux-2.6.9-rc2-pa9
 1: HOME=/
 2: TERM=linux
 3: root=/dev/md2
 4: console=ttyS0
 5: pdcchassis=0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'HOME=/ TERM=linux root=/dev/md2 console=ttyS0 pdcchassis=0 palo_kernel=3/boot/vmlinux-2.6.9-rc2-pa9'
Selected kernel: /boot/vmlinux-2.6.9-rc2-pa9 from partition 3
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 3916160 mediaptr 0x1000
Segment 1 load 004c0000 size 288672 mediaptr 0x3be000
Segment 2 load 00508000 size 237702 mediaptr 0x405000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.9-rc2-pa9 (grundler@ios) (gcc version 3.3.4 (Debian 1:3.3.4-12)) #1 Sun Sep 26 19:37:38 PDT 2004
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005cb0 00000491 00000000 00000001 23355fdc 100000f0 00000008 000000b2 000000b2
vers  00000300
CPUID vers 17 rev 10 (0x0000022a)
capabilities 0x1
model 9000/800/A500-44
This Machine has more memory ranges than we support!
Some memory will not be used!
Total Memory: 3840 Mb
Built 1 zonelists
Kernel command line: HOME=/ TERM=linux root=/dev/md2 console=ttyS0 pdcchassis=0 palo_kernel=3/boot/vmlinux-2.6.9-rc2-pa9
PID hash table entries: 4096 (order: 12, 131072 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Memory: 3932160k available
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Crescendo 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5cb, 0x00004 }
2. Crescendo 440 at 0xfffffffffffa2000 [162] { 0, 0x0, 0x5cb, 0x00004 }
3. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
4. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
7. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
8. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of parisc-94 failed with error 1
CPU(s): 1 x PA8500 (PCX-W) at 440.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
SCSI subsystem initialized
unwind_init: start = 0x1039c1a0, end = 0x103badf0, entries = 7877
Performance monitoring counters enabled for Crescendo 440
Initializing Cryptographic API
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfffffffff8000000 (irq = 132) is a 16550A
ttyS1 at MMIO 0xfffffffff8000008 (irq = 132) is a 16550A
ttyS2 at MMIO 0xfffffffff8000010 (irq = 132) is a 16550A
ttyS3 at MMIO 0xfffffffff8005000 (irq = 133) is a 16550A
ttyS4 at MMIO 0xfffffffff8005008 (irq = 133) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Intel(R) PRO/1000 Network Driver - version 5.3.19-k2-NAPI
Copyright (c) 1999-2004 Intel Corporation.
tg3.c:v3.9 (August 30, 2004)
eth0: Tigon3 [partno(BCM95703A30U) rev 1002 PHY(5703)] (PCI:66MHz:64-bit) 10/100/1000BaseT Ethernet 00:10:18:04:15:c9
eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] Split[0] WireSpeed[1] TSOcap[1] 
sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 129
sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18k
Using anticipatory io scheduler
  Vendor: HP        Model: D5989C            Rev: 1.05
  Type:   Processor                          ANSI SCSI revision: 02
scsi(0:0:5:0): Beginning Domain Validation
scsi(0:0:5:0): Ending Domain Validation
sym0:10: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
  Vendor: HP        Model: 9.10GB A 80-DC1B  Rev: DC1B
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:10:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:10:0): Beginning Domain Validation
sym0:10: asynchronous.
sym0:10: wide asynchronous.
sym0:10: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:10:0): Domain Validation skipping write tests
scsi(0:0:10:0): Ending Domain Validation
  Vendor: HP        Model: 9.10GB A 80-S1A0  Rev: S1A0
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:11:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:11:0): Beginning Domain Validation
sym0:11: wide asynchronous.
sym0:11: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 31)
scsi(0:0:11:0): Domain Validation skipping write tests
scsi(0:0:11:0): Ending Domain Validation
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C02
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:12:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:12:0): Beginning Domain Validation
sym0:12: wide asynchronous.
sym0:12: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:12:0): Domain Validation skipping write tests
scsi(0:0:12:0): Ending Domain Validation
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:13:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:13:0): Beginning Domain Validation
sym0:13: wide asynchronous.
sym0:13: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:13:0): Domain Validation skipping write tests
scsi(0:0:13:0): Ending Domain Validation
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:14:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:14:0): Beginning Domain Validation
sym0:14: wide asynchronous.
sym0:14: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:14:0): Domain Validation skipping write tests
scsi(0:0:14:0): Ending Domain Validation
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:15:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:15:0): Beginning Domain Validation
sym0:15: wide asynchronous.
sym0:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:15:0): Domain Validation skipping write tests
scsi(0:0:15:0): Ending Domain Validation
sym1: <896> rev 0x7 at pci 0000:00:01.1 irq 130
sym1: No NVRAM, ID 7, Fast-40, SE, parity checking
sym1: SCSI BUS has been reset.
sym1: SCSI BUS mode change from SE to SE.
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18k
  Vendor: SEAGATE   Model: ST39173LC         Rev: 5912
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym1:15:0: tagged command queuing enabled, command queue depth 16.
scsi(1:0:15:0): Beginning Domain Validation
sym1:15: wide asynchronous.
sym1:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(1:0:15:0): Domain Validation skipping write tests
scsi(1:0:15:0): Ending Domain Validation
sym2: <875> rev 0x14 at pci 0000:00:02.0 irq 130
sym2: No NVRAM, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.1.18k
sym3: <875> rev 0x14 at pci 0000:00:02.1 irq 131
sym3: No NVRAM, ID 7, Fast-20, SE, parity checking
sym3: SCSI BUS has been reset.
scsi3 : sym-2.1.18k
  Vendor: SEAGATE   Model: ST39173LC         Rev: 5912
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym3:15:0: tagged command queuing enabled, command queue depth 16.
scsi(3:0:15:0): Beginning Domain Validation
sym3:15: wide asynchronous.
sym3:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(3:0:15:0): Domain Validation skipping write tests
scsi(3:0:15:0): Ending Domain Validation
sym4: <1010-66> rev 0x1 at pci 0000:20:00.0 irq 256
sym4: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym4: SCSI BUS has been reset.
scsi4 : sym-2.1.18k
  Vendor: HP        Model: 18.2GB C 80-H008  Rev: H008
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:0:0: tagged command queuing enabled, command queue depth 16.
scsi(4:0:0:0): Beginning Domain Validation
sym4:0: wide asynchronous.
sym4:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 30)
scsi(4:0:0:0): Ending Domain Validation
  Vendor: HP        Model: 18.2GB C 80-H008  Rev: H008
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:1:0: tagged command queuing enabled, command queue depth 16.
scsi(4:0:1:0): Beginning Domain Validation
sym4:1: wide asynchronous.
sym4:1: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 30)
scsi(4:0:1:0): Ending Domain Validation
  Vendor: HP 18.2G  Model: ST318452LC        Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:2:0: tagged command queuing enabled, command queue depth 16.
scsi(4:0:2:0): Beginning Domain Validation
sym4:2: wide asynchronous.
sym4:2: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
scsi(4:0:2:0): Ending Domain Validation
  Vendor: HP        Model: 18.2GB C 80-8C42  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:3:0: tagged command queuing enabled, command queue depth 16.
scsi(4:0:3:0): Beginning Domain Validation
sym4:3: wide asynchronous.
sym4:3: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
scsi(4:0:3:0): Ending Domain Validation
  Vendor: HP        Model: D5989C            Rev: 1.03
  Type:   Processor                          ANSI SCSI revision: 02
scsi(4:0:5:0): Beginning Domain Validation
scsi(4:0:5:0): Ending Domain Validation
  Vendor: HP        Model: 18.2GB C 80-F612  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:8:0: tagged command queuing enabled, command queue depth 16.
scsi(4:0:8:0): Beginning Domain Validation
sym4:8: wide asynchronous.
sym4:8: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
scsi(4:0:8:0): Ending Domain Validation
  Vendor: HP        Model: 36.4GB C 80-F612  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:9:0: tagged command queuing enabled, command queue depth 16.
scsi(4:0:9:0): Beginning Domain Validation
sym4:9: wide asynchronous.
sym4:9: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
scsi(4:0:9:0): Ending Domain Validation
sym5: <1010-66> rev 0x1 at pci 0000:20:00.1 irq 257
sym5: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym5: SCSI BUS has been reset.
scsi5 : sym-2.1.18k
st: Version 20040403, fixed bufsize 32768, s/g segs 256
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sda: drive cache: write through
 sda: sda1
Attached scsi disk sda at scsi0, channel 0, id 10, lun 0
SCSI device sdb: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sdb: drive cache: write through
 sdb: sdb1
Attached scsi disk sdb at scsi0, channel 0, id 11, lun 0
SCSI device sdc: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdc: drive cache: write through
 sdc: unknown partition table
Attached scsi disk sdc at scsi0, channel 0, id 12, lun 0
SCSI device sdd: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdd: drive cache: write through
 sdd: sdd1 sdd2
Attached scsi disk sdd at scsi0, channel 0, id 13, lun 0
SCSI device sde: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sde: drive cache: write through
 sde: sde1
Attached scsi disk sde at scsi0, channel 0, id 14, lun 0
SCSI device sdf: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sdf: drive cache: write through
 sdf: sdf1
Attached scsi disk sdf at scsi0, channel 0, id 15, lun 0
SCSI device sdg: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdg: drive cache: write back
 sdg: sdg1 sdg2 sdg3 sdg4
Attached scsi disk sdg at scsi1, channel 0, id 15, lun 0
SCSI device sdh: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdh: drive cache: write back
 sdh: sdh1 sdh2 sdh3 sdh4
Attached scsi disk sdh at scsi3, channel 0, id 15, lun 0
SCSI device sdi: 35566480 512-byte hdwr sectors (18210 MB)
SCSI device sdi: drive cache: write through
 sdi: sdi1 sdi2 sdi3
Attached scsi disk sdi at scsi4, channel 0, id 0, lun 0
SCSI device sdj: 35566480 512-byte hdwr sectors (18210 MB)
SCSI device sdj: drive cache: write through
 sdj: sdj1 sdj2
Attached scsi disk sdj at scsi4, channel 0, id 1, lun 0
SCSI device sdk: 35566480 512-byte hdwr sectors (18210 MB)
SCSI device sdk: drive cache: write through
 sdk: unknown partition table
Attached scsi disk sdk at scsi4, channel 0, id 2, lun 0
SCSI device sdl: 35566480 512-byte hdwr sectors (18210 MB)
SCSI device sdl: drive cache: write through
 sdl: sdl1
Attached scsi disk sdl at scsi4, channel 0, id 3, lun 0
SCSI device sdm: 35566480 512-byte hdwr sectors (18210 MB)
SCSI device sdm: drive cache: write through
 sdm: unknown partition table
Attached scsi disk sdm at scsi4, channel 0, id 8, lun 0
SCSI device sdn: 71132960 512-byte hdwr sectors (36420 MB)
SCSI device sdn: drive cache: write through
 sdn: unknown partition table
Attached scsi disk sdn at scsi4, channel 0, id 9, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 5, lun 0,  type 3
Attached scsi generic sg1 at scsi0, channel 0, id 10, lun 0,  type 0
Attached scsi generic sg2 at scsi0, channel 0, id 11, lun 0,  type 0
Attached scsi generic sg3 at scsi0, channel 0, id 12, lun 0,  type 0
Attached scsi generic sg4 at scsi0, channel 0, id 13, lun 0,  type 0
Attached scsi generic sg5 at scsi0, channel 0, id 14, lun 0,  type 0
Attached scsi generic sg6 at scsi0, channel 0, id 15, lun 0,  type 0
Attached scsi generic sg7 at scsi1, channel 0, id 15, lun 0,  type 0
Attached scsi generic sg8 at scsi3, channel 0, id 15, lun 0,  type 0
Attached scsi generic sg9 at scsi4, channel 0, id 0, lun 0,  type 0
Attached scsi generic sg10 at scsi4, channel 0, id 1, lun 0,  type 0
Attached scsi generic sg11 at scsi4, channel 0, id 2, lun 0,  type 0
Attached scsi generic sg12 at scsi4, channel 0, id 3, lun 0,  type 0
Attached scsi generic sg13 at scsi4, channel 0, id 5, lun 0,  type 3
Attached scsi generic sg14 at scsi4, channel 0, id 8, lun 0,  type 0
Attached scsi generic sg15 at scsi4, channel 0, id 9, lun 0,  type 0
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
NET: Registered protocol family 2
IP: routing cache hash table of 32768 buckets, 256Kbytes
TCP: Hash tables configured (established 524288 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdh4 ...
md:  adding sdh4 ...
md: sdh3 has different UUID to sdh4
md: sdh1 has different UUID to sdh4
md:  adding sdg4 ...
md: sdg3 has different UUID to sdh4
md: sdg1 has different UUID to sdh4
md: created md3
md: bind<sdg4>
md: bind<sdh4>
md: running: <sdh4><sdg4>
raid1: raid set md3 active with 2 out of 2 mirrors
md: considering sdh3 ...
md:  adding sdh3 ...
md: sdh1 has different UUID to sdh3
md:  adding sdg3 ...
md: sdg1 has different UUID to sdh3
md: created md2
md: bind<sdg3>
md: bind<sdh3>
md: running: <sdh3><sdg3>
raid1: raid set md2 active with 2 out of 2 mirrors
md: considering sdh1 ...
md:  adding sdh1 ...
md:  adding sdg1 ...
md: created md1
md: bind<sdg1>
md: bind<sdh1>
md: running: <sdh1><sdg1>
raid1: raid set md1 active with 2 out of 2 mirrors
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 236k freed
INIT: version 2.86 booting
mount: wrong fs type, bad option, bad superblock on tmpfs,
       or too many mounted file systems
Activating swap.
Checking root file system...
fsck 1.35 (28-Feb-2004)
/dev/md2: clean, 51730/195456 files, 366872/390896 blocks
EXT3 FS on md2, internal journal
mount: wrong fs type, bad option, bad superblock on tmpfs,
       or too many mounted file systems
System time was Mon Sep 27 05:27:50 UTC 2004.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Mon Sep 27 05:27:52 UTC 2004.
Cleaning up ifupdown...done.
Calculating module dependencies... done.
Loading modules...
    tulip
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth1: Digital DS21143 Tulip rev 65 at 0xfffffffff8006000, 00:30:6E:03:79:9F, IRQ 128.
    tg3
FATAL: Module tg3 not found.
    acenic
    ip_conntrack_ftp
ip_conntrack version 2.1 (8192 buckets, 65536 max) - 504 bytes per conntrack
All modules loaded.
Starting raid devices: 
done.
Checking all file systems...
fsck 1.35 (28-Feb-2004)
/dev/md3: clean, 331155/850304 files, 1402612/1697520 blocks
Setting kernel variables ...
... done.
Mounting local filesystems...
kjournald starting.  Commit interval 5 seconds
EXT3 FS on md3, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
mount: wrong fs type, bad option, bad superblock on none,
       or too many mounted file systems
/dev/md3 on /home type ext3 (rw,errors=remount-ro)
Cleaning /tmp /var/run /var/lock.
mount: wrong fs type, bad option, bad superblock on tmpfs,
       or too many mounted file systems
Initializing: /etc/network/ifstate.
Starting hotplug subsystem:
   input   
   input    [success]
   isapnp  
   isapnp   [success]
   net     
   net      [success]
   pci     
     tulip: already loaded
Fusion MPT base driver 3.01.16
Copyright (c) 1999-2004 LSI Logic Corporation
mptbase: Initiating ioc0 bringup
ioc0: 53C1030: Capabilities={Initiator}
mptbase: Initiating ioc1 bringup
ioc1: 53C1030: Capabilities={Initiator}
Backtrace:
 [<0000000010175344>] drain_array_locked+0xe4/0x118
 [<0000000010175424>] cache_reap+0xac/0x2a8
 [<00000000101584a8>] worker_thread+0x220/0x330
 [<000000001015df70>] kthread+0x130/0x140
 [<000000001010647c>] ret_from_kernel_thread+0x24/0x38


Kernel Fault: Code=15 regs=000000001479c560 (Addr=00000001ffe3b618)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001110000100001110 Not tainted
r00-03  0000000000000000 00000000105053c0 0000000010175344 00000000ffe67000
r04-07  00000000104f7bc0 00000000ffe3b600 00000000ffe66018 00000000ffe3b610
r08-11  0000000000000000 000000001056b658 0000000000000001 0000000000200200
r12-15  0000000000100100 00000000ffe3b630 00000000000000f0 00000000000000ff
r16-19  00000000f00003dc 00000000f000028c 00000000f0002aa4 000000000068f4d1
r20-23  00000000ffe3b610 00000001ffe3b610 00000000140ad688 0000000000000002
r24-27  0000000000000001 00000000ffe66010 00000000ffe67880 00000000104f7bc0
r28-31  00000000ffe71010 000000001479c530 000000001479c560 0000000000000000
sr0-3   0000000000003800 0000000000000000 0000000000000000 00000000004ed000
sr4-7   0000000000000000 0000000000000000 0000000000000000000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101747d0 00000000101747d4
 IIR: 0eb412d0    ISR: 0000000000000000  IOR: 00000001ffe3b618
 CPU:        0   CR30: 000000001479c000 CR31: 00000000104c4000
 ORIG_R28: 00000000104807a0
 IAOQ[0]: free_block+0xa8/0x1a0
 IAOQ[1]: free_block+0xac/0x1a0
 RP(r2): drain_array_locked+0xe4/0x118
Kernel panic - not syncing: Kernel Fault
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
