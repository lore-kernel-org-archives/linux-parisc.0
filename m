From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] 2.6.11-rc1-pa3 rp3440 BUG at kernel/workqueue.c:132
Date: Wed, 19 Jan 2005 00:49:27 -0700
Message-ID: <20050119074927.GB3879@colo.lackof.org>
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

System paniced at boot.

The odd thing is the "more memory ranges than we support" message
is out of place since DISCONTIGMEM is enabled.

grant


Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Boot IO Dependent Code (IODC) revision 3


HARD Booted.
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004

Boot image contains:
    0/vmlinux64 6585304 bytes @ 0xa000

Command line for kernel: '0/vmlinux64 root=/dev/nfs nfsroot=192.168.1.61:/home/tftpboot/ion ip=dhcp console=ttyS1 palo_kernel=0'
Selected kernel:  from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 64-bit kernelELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4806272 mediaptr 0x1000
Segment 1 load 00598000 size 314792 mediaptr 0x497000
Segment 2 load 005e8000 size 294584 mediaptr 0x4e4000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.9-rc1-pa0 (jejb@gsyprf11.external.hp.com) (gcc version 3.0.4) #4 SMP Mon Aug 30 07:58:13 PDT 2004
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00008890 00000491 00000000 00000002 3e0505e7352af70e 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/800/rp3440  
This Machine has more memory ranges than we support!
Some memory will not be used!
parisc_cache_init: Only equivalent aliasing supported!
Total Memory: 1024 Mb
SMP: bootstrap CPU ID is 0
Built 1 zonelists
Kernel command line: 0/vmlinux64 root=/dev/nfs nfsroot=192.168.1.61:/home/tftpboot/ion ip=dhcp console=ttyS1 palo_kernel=0
PID hash table entries: 16 (order 4: 256 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Memory: 1048576k available
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
Brought up 1 CPUs
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Storm Peak Fast at 0xfffffffffe780000 [128] { 0, 0x0, 0x889, 0x00004 }
2. Storm Peak Fast at 0xfffffffffe781000 [129] { 0, 0x0, 0x889, 0x00004 }
3. Storm Peak Fast at 0xfffffffffe798000 [152] { 0, 0x0, 0x889, 0x00004 }
4. Storm Peak Fast at 0xfffffffffe799000 [153] { 0, 0x0, 0x889, 0x00004 }
5. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
6. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
7. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
8. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
9. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
10. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
11. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
12. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
13. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
14. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
Enabling PDC_PAT chassis codes support.
Releasing cpu 1 now, hpa=fffffffffe781000
FP[1] enabled: Rev 1 Model 20
Releasing cpu 2 now, hpa=fffffffffe798000
FP[2] enabled: Rev 1 Model 20
Releasing cpu 3 now, hpa=fffffffffe799000
FP[3] enabled: Rev 1 Model 20
CPU(s): 4 x PA8800 (Mako) at 999.999700 MHz
SBA found Pluto 2.3 at 0xfffffffffed00000
lba version TR3.2 (0x32) found at 0xfffffffffed20000
lba version TR3.2 (0x32) found at 0xfffffffffed22000
lba version TR3.2 (0x32) found at 0xfffffffffed24000
lba version TR3.2 (0x32) found at 0xfffffffffed26000
lba version TR3.2 (0x32) found at 0xfffffffffed28000
kernel BUG at kernel/workqueue.c:132!
Kernel panic - not syncing: BUG!
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
