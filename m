From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.11-rc1-pa3 rp3440 BUG at kernel/workqueue.c:132
Date: Thu, 20 Jan 2005 22:55:41 -0700
Message-ID: <20050121055541.GH6582@colo.lackof.org>
References: <20050119074927.GB3879@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050119074927.GB3879@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jan 19, 2005 at 12:49:27AM -0700, Grant Grundler wrote:
> System paniced at boot.
> 
> The odd thing is the "more memory ranges than we support" message
> is out of place since DISCONTIGMEM is enabled.

That should have been my first clue it wasn't the kernel
that I was expecting.

Appended is the output for ion (rp3440) again on 2.6.11-rc1 kernel.
Apologies for the confusion the first time around...

This time, the kernel panics because NFS server isn't config'd right.
I'll fix that and see if it gets much further.

grant


Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Boot IO Dependent Code (IODC) revision 3


HARD Booted.
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004

Boot image contains:
    0/vmlinux64 6298528 bytes @ 0xa000

Command line for kernel: 'root=/dev/nfs nfsroot=192.168.1.61:/home/tftpboot/ion ip=dhcp console=ttyS1 palo_kernel=0HOME=/'
Selected kernel: HOME=/ from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 64-bit kernelELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4592256 mediaptr 0x1000
Segment 1 load 00564000 size 333808 mediaptr 0x463000
Segment 2 load 005b8000 size 294888 mediaptr 0x4b5000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.11-rc1-pa3-nopre (grundler@gsyprf11.external.hp.com) (gcc version 3.4.4 20041218 (prerelease) (Debian 3.4.3-6)) #5 SMP Sun Jan 16 13:18:17 PST 2005
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00008890 00000491 00000000 00000002 3e0505e7352af70e 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/800/rp3440  
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 Mb
 1) Start 0x0000004040000000 End 0x00000040ffdfffff Size   3070 Mb
Total Memory: 4094 Mb
SMP: bootstrap CPU ID is 0
Built 2 zonelists
Kernel command line: root=/dev/nfs nfsroot=192.168.1.61:/home/tftpboot/ion ip=dhcp console=ttyS1 palo_kernel=0HOME=/
PID hash table entries: 4096 (order: 12, 131072 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Memory: 4192256k available
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
Brought up 1 CPUs
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Storm Peak Fast at 0xfffffffffe780000 [128] { 0, 0x0, 0x889, 0x00004 }
2. Storm Peak Fast at 0xfffffffffe781000 [129] { 0, 0x0, 0x889, 0x00004 }
3. Storm Peak Fast at 0xfffffffffe798000 [152] { 0, 0x0, 0x889, 0x00004 }
4. Storm Peak Fast at 0xfffffffffe799000 [153] { 0, 0x0, 0x889, 0x00004 }
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
Releasing cpu 1 now, hpa=fffffffffe781000
FP[1] enabled: Rev 1 Model 20
Releasing cpu 2 now, hpa=fffffffffe798000
FP[2] enabled: Rev 1 Model 20
Releasing cpu 3 now, hpa=fffffffffe799000
FP[3] enabled: Rev 1 Model 20
CPU(s): 4 x PA8800 (Mako) at 999.999200 MHz
Setting cache flush threshold to 2606f40 (4 CPUs online)
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
unwind_init: start = 0x1043f160, end = 0x1045da10, entries = 7819
Performance monitoring counters enabled for Storm Peak Fast
Initializing Cryptographic API
PDC Stable Storage facility v0.04
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfffffffff4051000 (irq = 25) is a 16550A
ttyS1 at MMIO 0xfffffffff4050000 (irq = 25) is a 16550A
ttyS2 at MMIO 0xfffffffff4050010 (irq = 25) is a 16550A
ttyS3 at MMIO 0xfffffffff4050038 (irq = 25) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 22
sym0: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18n
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
sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 23
sym1: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18n
sym1:0:0: ABORT operation started.
sym1:0:0: ABORT operation timed-out.
sym1:0:0: DEVICE RESET operation started.
sym1:0:0: DEVICE RESET operation timed-out.
sym1:0:0: BUS RESET operation started.
sym1:0:0: BUS RESET operation timed-out.
sym1:0:0: HOST RESET operation started.
sym1: SCSI BUS has been reset.
sym1:0:0: HOST RESET operation timed-out.
scsi: Device offlined - not ready after error recovery: host 1 channel 0 id 0 lun 0
sym1:1:0: ABORT operation started.
sym1:1:0: ABORT operation timed-out.
sym1:1:0: DEVICE RESET operation started.
sym1:1:0: DEVICE RESET operation timed-out.
sym1:1:0: BUS RESET operation started.
sym1:1:0: BUS RESET operation timed-out.
sym1:1:0: HOST RESET operation started.
sym1: SCSI BUS has been reset.
sym1:1:0: HOST RESET operation timed-out.
scsi: Device offlined - not ready after error recovery: host 1 channel 0 id 1 lun 0
sym1:2:0: ABORT operation started.
sym1:2:0: ABORT operation timed-out.
sym1:2:0: DEVICE RESET operation started.
sym1:2:0: DEVICE RESET operation timed-out.
sym1:2:0: BUS RESET operation started.
sym1:2:0: BUS RESET operation timed-out.
sym1:2:0: HOST RESET operation started.
sym1: SCSI BUS has been reset.
sym1:2:0: HOST RESET operation timed-out.
scsi: Device offlined - not ready after error recovery: host 1 channel 0 id 2 lun 0
sym1:3:0: ABORT operation started.
sym1:3:0: ABORT operation timed-out.
sym1:3:0: DEVICE RESET operation started.
sym1:3:0: DEVICE RESET operation timed-out.
sym1:3:0: BUS RESET operation started.
sym1: SCSI BUS reset detected.
sym1: SCSI BUS has been reset.
sym1:3:0: BUS RESET operation complete.
sym1:3:0: HOST RESET operation started.
sym1: SCSI BUS has been reset.
sym1:3:0: HOST RESET operation complete.
scsi: Device offlined - not ready after error recovery: host 1 channel 0 id 3 lun 0
st: Version 20041025, fixed bufsize 32768, s/g segs 256
SCSI device sda: 143374738 512-byte hdwr sectors (73408 MB)
SCSI device sda: drive cache: write through
SCSI device sda: 143374738 512-byte hdwr sectors (73408 MB)
SCSI device sda: drive cache: write through
 sda: sda1 sda2 sda3
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
SCSI device sdb: 143374738 512-byte hdwr sectors (73408 MB)
SCSI device sdb: drive cache: write through
SCSI device sdb: 143374738 512-byte hdwr sectors (73408 MB)
SCSI device sdb: drive cache: write through
 sdb: sdb1 sdb2
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 1, lun 0,  type 0
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: md driver 0.90.1 MAX_MD_DEVS=256, MD_SB_DISKS=27
NET: Registered protocol family 2
IP: routing cache hash table of 8192 buckets, 192Kbytes
TCP established hash table entries: 131072 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1572864 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
IP-Config: No network devices available.
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
Looking up port of RPC 100003/2 on 192.168.1.61
RPC: sendmsg returned error 229
portmap: RPC call returned error 229
Root-NFS: Unable to get nfsd port number from server, using default
Looking up port of RPC 100005/1 on 192.168.1.61
RPC: sendmsg returned error 229
portmap: RPC call returned error 229
Root-NFS: Unable to get mountd port number from server, using default
RPC: sendmsg returned error 229
mount: RPC call returned error 229
Root-NFS: Server returned error -229 while mounting /home/tftpboot/ion
VFS: Unable to mount root fs via NFS, trying floppy.
VFS: Cannot open root device "nfs" or unknown-block(2,0)
Please append a correct "root=" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(2,0)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
