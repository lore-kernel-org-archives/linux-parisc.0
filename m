Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: daemon:@dsl2.external.hp.com, kernel@dsl2.external.hp.com,
	klogd.@dsl2.external.hp.com, log@dsl2.external.hp.com,
	Starting@dsl2.external.hp.com
Message-Id: <20020524065540.DBFE4482A@dsl2.external.hp.com>
Date: Fri, 24 May 2002 00:55:40 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] PA8700 boots!
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I finally got my rp24xx machine (dual pa8700, 650Mhz) to boot!

I haven't committed the patch yet:
	ftp://ftp.parisc-linux.org/patches/sba_pa8700.diff

Problem was the IO PDIR was not coherent with the CPU and
thus wasn't seeing updates to the IO PDIR by the CPU.
Added some cache flushing/sync and some self modifying
code to patch those out on boxes that don't need it.

And that's why I haven't committed yet. I don't know
if and how that should really be done. I suspect I
need a FDC/SYNC/FIC to make sure the modified instructions
aren't in cache. I'm also not sure this is better since
it means sba_iopdir_entry() can't be inline...ie I
pay for an extra branch one way or another.

So I might toss this implementation and just use a global.

I also need to fixup the "unkown device" (PA8700 CPU)
in the hardware listing.

Lastly, the same PA8700 systems that need fdc for iopdir
also have some funny business WRT to Space ID hashing.
For those with access to HPUX source, look for flush_iopdir.
I don't pretend to understand what is wrong or what might
be broken for parisc-linux on those boxes.

grant



Firmware Version  42.00

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2001, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      650  MHz   Active                 Functional         750 KB 1.5 MB
      1      650  MHz   Idle                   Functional         750 KB 1.5 MB

  Central Bus Speed (in MHz)  :        120  
  Available Memory            :    3145728  KB
  Good Memory Required        :      25820  KB

   Primary boot path:    0/0/1/1.15          
   Alternate boot path:  0/0/2/1.15          
   Console path:         0/0/4/1.643         
   Keyboard path:        0/0/4/1.0           


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
Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 00306e-2661a3
System IP Address 192.168.0.60
Server IP Address 192.168.0.22

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl 1.0 grundler@gsyprf11.external.hp.com Wed May 22 19:48:50 PDT 2002

Boot image contains:
    0/vmlinux64 3942047 bytes @ 0x8800

Command line for kernel: 'HOME=/ TERM=vt100 root=/dev/sda3  console=ttyS0 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 64-bit kernelELF64 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 2060832 mediaptr 0x1000
Segment 1 load 002f8000 size 642208 mediaptr 0x1f9000
Segment 2 load 00398000 size 410328 mediaptr 0x296000
Segment 3 load 00400000 size 16384 mediaptr 0x2fb000
Segment 4 load 00408000 size 32768 mediaptr 0x2ff000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.18-pa25 (grundler@gsyprf11.external.hp.com) (gcc version 3.0) #22 Thu May 23 23:09:37 PDT 2002
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005e20 00000491 00000000 00000001 73a33d02 100000f0 00000008 000000b2 000000b2
vers  00000203
CPUID vers 19 rev 8 (0x00000268)
capabilities 0x5
model 9000/800/A500-6X
Total Memory: 3072 Mb
pagetable_init
On node 0 totalpages: 786432
zone(0): 786432 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=vt100 root=/dev/sda3  console=ttyS0 palo_kernel=0/vmlinux
Calibrating delay loop... 1297.61 BogoMIPS
Memory: 3043892k available
Dentry-cache hash table entries: 131072 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 9, 2097152 bytes)
Mount-cache hash table entries: 65536 (order: 8, 1048576 bytes)
Buffer-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Page-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Searching for devices...
Found devices:
1. Unknown machine (0) at 0xfffffffffffa0000 [160], versions 0x5e2, 0x0, 0x4
2. Unknown machine (0) at 0xfffffffffffa2000 [162], versions 0x5e2, 0x0, 0x4
3. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582, 0x0, 0xb
4. Elroy PCI Bridge (13) at 0xfffffffffed30000 [0/0], versions 0x782, 0x0, 0xa
5. Elroy PCI Bridge (13) at 0xfffffffffed34000 [0/2], versions 0x782, 0x0, 0xa
6. Elroy PCI Bridge (13) at 0xfffffffffed38000 [0/4], versions 0x782, 0x0, 0xa
7. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [0/6], versions 0x782, 0x0, 0xa
8. Memory (1) at 0xfffffffffed08000 [8], versions 0x9b, 0x0, 0x9
CONFIG_SMP=n  ignoring additional CPUs
CPU(s): 1 x PA8700 (PCX-W2) at 650.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
SBA FDC/SYNC needed
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba range[2] : ignoring GMMIO (0xfffffff804000000)
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
lba range[2] : ignoring GMMIO (0xfffffffb04000000)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Performance monitoring counters enabled for Unknown machine
Starting kswapd
Journalled Block Device driver loaded
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (103c,1048,103c,104b)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS00 at iomem 0xfffffffff8000000 (irq = 132) is a 16550A
ttyS01 at iomem 0xfffffffff8000008 (irq = 132) is a 16550A
ttyS02 at iomem 0xfffffffff8000010 (irq = 132) is a 16550A
ttyS03 at iomem 0xfffffffff8000030 (irq = 132) is a 16550A
ttyS04 at iomem 0xfffffffff8000038 (irq = 132) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0x0, 00:30:6E:26:61:A3, IRQ 128.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 1, function 1
sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
sym53c8xx: 53c896 detected 
sym53c875-0: rev 0x37 on pci bus 0 device 2 function 0 irq 130
sym53c875-0: ID 7, Fast-10, Parity Checking
sym53c875-1: rev 0x37 on pci bus 0 device 2 function 1 irq 131
sym53c875-1: ID 7, Fast-20, Parity Checking
sym53c896-2: rev 0x7 on pci bus 0 device 1 function 0 irq 129
sym53c896-2: ID 7, Fast-20, Parity Checking
sym53c896-2: handling phase mismatch from SCRIPTS.
sym53c896-3: rev 0x7 on pci bus 0 device 1 function 1 irq 130
sym53c896-3: ID 7, Fast-20, Parity Checking
sym53c896-3: handling phase mismatch from SCRIPTS.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
scsi2 : sym53c8xx-1.7.3c-20010512
scsi3 : sym53c8xx-1.7.3c-20010512
  Vendor: SEAGATE   Model: ST39173LC         Rev: 5912
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi3, channel 0, id 15, lun 0
sym53c896-3-<15,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 17781521 512-byte hdwr sectors (9104 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  2984.800 MB/sec
   8regs_prefetch:  2400.000 MB/sec
   32regs    :  2430.800 MB/sec
   32regs_prefetch:  2283.600 MB/sec
raid5: using function: 8regs (2984.800 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 32768 buckets, 256Kbytes
TCP: Hash tables configured (established 262144 bind 65536)
ip_conntrack (8192 buckets, 65536 max)
ip_tables: (C) 2000-2002 Netfilter core team
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 400k freed
INIT: version 2.84 booting
Activating swap.
Adding Swap: 525288k swap-space (priority -1)
Checking root file system...
fsck 1.27 (8-Mar-2002)
/dev/sda3: clean, 35126/195456 files, 306933/390912 blocks
System time was Fri May 24 06:21:30 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Fri May 24 06:19:43 UTC 2002.
Calculating module dependencies... depmod: Can't open /lib/modules/2.4.18-pa25/modules.dep for writing
done.
Loading modules: 
modprobe: Can't open dependencies file /lib/modules/2.4.18-pa25/modules.dep (No such file or directory)
Checking all file systems...
fsck 1.27 (8-Mar-2002)
/dev/sda4: clean, 19107/850304 files, 591710/1697536 blocks
Setting kernel variables.
Mounting local filesystems...
/dev/sda4 on /home type ext2 (rw,errors=remount-ro)
none on /dev/shm type shm (rw)
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: modprobe: modprobe: Can't open dependencies file /lib/modules/2.4.18-pa25/modules.dep (No such file or directory)
SIOCSIFADDR: No such device
modprobe: modprobe: Can't open dependencies file /lib/modules/2.4.18-pa25/modules.dep (No such file or directory)
eth1: ERROR while getting interface flags: No such device
modprobe: modprobe: Can't open dependencies file /lib/modules/2.4.18-pa25/modules.dep (No such file or directory)
SIOCSIFNETMASK: No such device
modprobe: modprobe: Can't open dependencies file /lib/modules/2.4.18-pa25/modules.dep (No such file or directory)
SIOCSIFBRDADDR: No such device
modprobe: modprobe: Can't open dependencies file /lib/modules/2.4.18-pa25/modules.dep (No such file or directory)
eth1: ERROR while getting interface flags: No such device
modprobe: modprobe: Can't open dependencies file /lib/modules/2.4.18-pa25/modules.dep (No such file or directory)
eth1: ERROR while getting interface flags: No such device
done.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Thu May 23 23:19:46 PDT 2002

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogdeth0: Setting full-duplex based on MII#1 link partner capability of 01e1.
