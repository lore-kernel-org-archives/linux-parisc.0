From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] [BUG] 2.6.10-rc1 "INIT: PANIC: segmentation
	violation!"
Date: Tue, 2 Nov 2004 17:44:05 -0700
Message-ID: <20041103004405.GA4548@colo.lackof.org>
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

Hi all,
I've fixed the PCI-X config accessor functions and they
now work. But now the box won't boot with NFS root.
Last message repeats itself:
...
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
...

Can't ssh into the box though I can ping it.
Full console output from "ior" is appended.

BTW, I still have to deal with the "FAILED: lba_fixup_bus()" error
message. It just means resources aren't properly reported for one
PCI bus though the resources happen to already be assigned by firmware
on that particular PCI bus (not others).

thanks,
grant


Firmware Version  44.24

Duplex Console IO Dependent Code (IODC) revision 1
------------------------------------------------------------------------------
   (c) Copyright 1995-2004, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      800  MHz   Active                 Functional         33554432 33554432
      1      800  MHz   Idle                   Functional         33554432 33554432
      2      800  MHz   Idle                   Functional         33554432 33554432
      3      800  MHz   Idle                   Functional         33554432 33554432

  Central Bus Speed (in MHz)  :        200  
  Available Memory            :     524288  KB
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
Main Menu: Enter command or menu > bo ls
Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Boot IO Dependent Code (IODC) revision 3


HARD Booted.
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004

Boot image contains:
    0/vmlinux64 6583860 bytes @ 0xa000

Command line for kernel: 'root=/dev/nfs nfsroot=192.168.1.61:/home/tftpboot/ior ip=dhcp console=ttyS1 palo_kernel=0HOME=/'
Selected kernel: HOME=/ from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 64-bit kernelELF64 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 4727168 mediaptr 0x1000
Segment 1 load 00584000 size 602246 mediaptr 0x484000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.10-rc1-pa9 (grundler@gsyprf11.external.hp.com) (gcc version 3.0.4) #66 Tue Nov 2 16:22:24 PST 2004
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00008870 00000491 00000000 00000002 3e0505e7352af70f 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/800/rp3440  
parisc_cache_init: Only equivalent aliasing supported!
Total Memory: 510 Mb
Built 1 zonelists
Kernel command line: root=/dev/nfs nfsroot=192.168.1.61:/home/tftpboot/ior ip=dhcp console=ttyS1 palo_kernel=0HOME=/
PID hash table entries: 2048 (order: 11, 65536 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
Memory: 522240k available
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Storm Peak Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x887, 0x00004 }
2. Storm Peak Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x887, 0x00004 }
3. Storm Peak Slow at 0xfffffffffe798000 [152] { 0, 0x0, 0x887, 0x00004 }
4. Storm Peak Slow at 0xfffffffffe799000 [153] { 0, 0x0, 0x887, 0x00004 }
5. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
8. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
9. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
10. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
11. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
12. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
13. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
14. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
Enabling PDC_PAT chassis codes support.
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 129 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 152 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 153 failed with error 1
CPU(s): 1 x PA8800 (Mako) at 800.001500 MHz
Setting cache flush threshold to 21c5480 (1 CPUs online)
SBA found Pluto 2.3 at 0xfffffffffed00000
LBA version TR3.2 (0x32) found at 0xfffffffffed20000
LBA version TR3.2 (0x32) found at 0xfffffffffed22000
LBA version TR3.2 (0x32) found at 0xfffffffffed24000
LBA version TR3.2 (0x32) found at 0xfffffffffed26000
LBA version TR3.2 (0x32) found at 0xfffffffffed28000
LBA version TR3.2 (0x32) found at 0xfffffffffed2c000
LBA version TR3.2 (0x32) found at 0xfffffffffed2e000
FAILED: lba_fixup_bus() request for lmmio_space [fffffffff0000000/fffffffffecffffe]
SCSI subsystem initialized
unwind_init: start = 0x104482a0, end = 0x1046c8a0, entries = 9312
Performance monitoring counters enabled for Storm Peak Slow
Initializing Cryptographic API
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfffffffff4051000 (irq = 512) is a 16550A
ttyS1 at MMIO 0xfffffffff4050000 (irq = 512) is a 16550A
ttyS2 at MMIO 0xfffffffff4050010 (irq = 512) is a 16550A
ttyS3 at MMIO 0xfffffffff4050038 (irq = 512) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
tg3.c:v3.11 (October 20, 2004)
eth0: Tigon3 [partno(BCM95700A6) rev 0105 PHY(5701)] (PCI:66MHz:64-bit) 10/100/1000BaseT Ethernet 00:30:6e:4b:13:ad
eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] Split[0] WireSpeed[1] TSOcap[0] 
sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 192
sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18m
elevator: using anticipatory as default io scheduler
  Vendor: HP 73.4G  Model: ST373453LC        Rev: HPC3
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:0:0: tagged command queuing enabled, command queue depth 16.
 target0:0:0: Beginning Domain Validation
sym0:0: wide asynchronous.
sym0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 62)
 target0:0:0: Ending Domain Validation
  Vendor: HP 73.4G  Model: ST373453LC        Rev: HPC3
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:1:0: tagged command queuing enabled, command queue depth 16.
 target0:0:1: Beginning Domain Validation
sym0:1: wide asynchronous.
sym0:1: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 62)
 target0:0:1: Ending Domain Validation
sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 193
sym1: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18m
st: Version 20040403, fixed bufsize 32768, s/g segs 256
SCSI device sda: 143374738 512-byte hdwr sectors (73408 MB)
SCSI device sda: drive cache: write through
 sda: sda1 sda2
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
SCSI device sdb: 143374738 512-byte hdwr sectors (73408 MB)
SCSI device sdb: drive cache: write back
 sdb: sdb1 sdb2 sdb3
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 1, lun 0,  type 0
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 32768)
NET: Registered protocol family 1
NET: Registered protocol family 17
Sending DHCP requests .<6>tg3: eth0: Link is up at 1000 Mbps, full duplex.
tg3: eth0: Flow control is off for TX and off for RX.
.., OK
IP-Config: Got DHCP answer from 192.168.1.61, my address is 192.168.1.10
IP-Config: Complete:
      device=eth0, addr=192.168.1.10, mask=255.255.255.0, gw=192.168.1.1,
     host=192.168.1.10, domain=external.hp.com, nis-domain=(none),
     bootserver=192.168.1.61, rootserver=192.168.1.61, rootpath=/home/tftpboot/ior/
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
Looking up port of RPC 100003/2 on 192.168.1.61
Looking up port of RPC 100005/1 on 192.168.1.61
VFS: Mounted root (nfs filesystem) readonly.
Freeing unused kernel memory: 256k freed
INIT: version 2.86 booting
Activating swap.
rm: cannot remove `/dev/shm/root': Not a directory
System time was Wed Nov  3 00:34:51 UTC 2004.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Wed Nov  3 00:34:53 UTC 2004.
Cleaning up ifupdown...done.
Checking all file systems...
fsck 1.35 (28-Feb-2004)
Setting kernel variables ...
... done.
Mounting local filesystems...
Cleaning /tmp /var/run /var/lock.
Running 0dns-down to make sure resolv.conf is ok...done.
Initializing: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces...done.
Starting portmap daemon: portmap.
Starting portmapper...Mounting remote filesystems...
Loading the saved-state of the serial devices... 

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Wed Nov  3 00:34:59 UTC 2004

Initializing random number generator...done.
Recovering nvi editor sessions... done.
Setting up X server socket directory /tmp/.X11-unix...done.
Setting up ICE socket directory /tmp/.ICE-unix...done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting portmap daemon: portmap.
Starting MTA: exim4.
Starting internet superserver: inetd.
Starting OpenBSD Secure Shell server: sshd.
Starting NFS common utilities: statd.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
INIT: PANIC: segmentation violation! sleeping for 30 seconds.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
