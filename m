Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D751482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 18:16:42 -0600 (MDT)
Date: Wed, 16 Jul 2003 20:15:28 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org,
	Randolph Chung <tausq@debian.org>, Matthew Wilcox <willy@debian.org>
Message-ID: <20030717001528.GA20610@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.6.0-test1-pa1, fails, to, boot, on, rp2430
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

pa,

My rp2430 has yet to boot into a usable userspace, it always dies at
some point after serial console setup.

Today for fun I reseated everything, added ram upto 1.5GB, and stuck in
my PCI Matrox II card into the first PCI slot.

I don't get any further than the end of the output. Any thoughts about
PCI problems would be welcome :)

The output is as follows:
---

Command line for kernel: 'console=/dev/ttyS0 root=/dev/sda2 palo_kernel=0/vmlinux64'
Selected kernel: /vmlinux64 from partition 0
ELF64 executable
Entry 00100000 first 00100000 n 1
Segment 0 load 00100000 size 4219008 mediaptr 0x1000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.0-test1-pa0 (tausq@ios) (gcc version 3.0.4) #112 Tue Jul 15 22:35:45 PDT 2003
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005e20 00000491 00000000 00000001 6dd843ae 100000f0 00000008 000000b2 000000b2
vers  00000203
CPUID vers 19 rev 8 (0x00000268)
capabilities 0x5
model 9000/800/A500-6X
Total Memory: 1536 Mb
pagetable_init
On node 0 totalpages: 393216
  DMA zone: 393216 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: console=/dev/ttyS0 root=/dev/sda2 palo_kernel=0/vmlinux64
PID hash table entries: 16 (order 4: 256 bytes)
Console: colour dummy device 160x64
Calibrating delay loop... 1294.33 BogoMIPS
Memory: 1534524k available
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
-> /dev
-> /dev/console
-> /root
POSIX conformance testing by UNIFIX
Initializing RT netlink socket
Searching for devices...
Found devices:
1. Crescendo 650 W2 (0) at 0xfffffffffffa0000 [160], versions 0x5e2, 0x0, 0x4
2. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582, 0x0, 0xb
3. Elroy PCI Bridge (13) at 0xfffffffffed30000 [0/0], versions 0x782, 0x0, 0xa
4. Elroy PCI Bridge (13) at 0xfffffffffed34000 [0/2], versions 0x782, 0x0, 0xa
5. Elroy PCI Bridge (13) at 0xfffffffffed38000 [0/4], versions 0x782, 0x0, 0xa
6. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [0/6], versions 0x782, 0x0, 0xa
7. Memory (1) at 0xfffffffffed08000 [8], versions 0x9b, 0x0, 0x9
CPU(s): 1 x PA8700 (PCX-W2) at 650.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
lba version TR4.0 (0x5) found at 0xfffffffffed30000
kernel BUG at arch/parisc/kernel/pci.c:338!
Kernel addresses on the stack:
 [<000000001010e3d8>] show_trace+0x40/0x110
 [<000000001010e224>] dump_stack+0x24/0x38
 [<0000000010117d00>] pcibios_register_hba+0x70/0xc8
 [<00000000104a3b18>] lba_common_init+0x38/0x68
 [<00000000104a3ce4>] lba_driver_callback+0x19c/0x300
 [<00000000101c9b88>] sysfs_create_dir+0xa0/0x168
 [<0000000010113a10>] parisc_driver_probe+0x48/0x90
 [<0000000010280688>] bus_match+0x70/0xb8
 [<0000000010280818>] driver_attach+0x98/0xa8
 [<0000000010280b68>] bus_add_driver+0xd8/0xf0
 [<0000000010112b70>] pdc_pat_get_irt+0x48/0x68
 [<0000000010281098>] driver_register+0x48/0x60
 [<0000000010113c28>] register_parisc_driver+0x158/0x170
 [<00000000104a3e6c>] lba_init+0x24/0x38
 [<00000000104965f4>] parisc_init+0x114/0x130
 [<000000001049096c>] do_initcalls+0x84/0x120
 [<0000000010490a50>] do_basic_setup+0x48/0x78
 [<00000000101003b8>] init+0x38/0x238
 [<000000001010947c>] ret_from_kernel_thread+0x24/0x38

lba range[2] : ignoring GMMIO (0xfffffff804000000)

PCI: No parent found for region 6 of device 0000:00:00.0 [ffffffffb7f00000:ffffffffb7f3ffff]
lba version TR4.0 (0x5) found at 0xfffffffffed34000
kernel BUG at arch/parisc/kernel/pci.c:338!
Kernel addresses on the stack:
 [<000000001010e3d8>] show_trace+0x40/0x110
 [<000000001010e224>] dump_stack+0x24/0x38
 [<0000000010117d00>] pcibios_register_hba+0x70/0xc8
 [<00000000104a3b18>] lba_common_init+0x38/0x68
 [<00000000104a3ce4>] lba_driver_callback+0x19c/0x300
 [<00000000101139b4>] claim_device+0x34/0x48
 [<0000000010113a10>] parisc_driver_probe+0x48/0x90
 [<0000000010280688>] bus_match+0x70/0xb8
 [<0000000010280818>] driver_attach+0x98/0xa8
 [<0000000010280b68>] bus_add_driver+0xd8/0xf0
 [<0000000010112b70>] pdc_pat_get_irt+0x48/0x68
 [<0000000010281098>] driver_register+0x48/0x60
 [<0000000010113c28>] register_parisc_driver+0x158/0x170
 [<00000000104a3e6c>] lba_init+0x24/0x38
 [<00000000104965f4>] parisc_init+0x114/0x130
 [<000000001049096c>] do_initcalls+0x84/0x120
 [<0000000010490a50>] do_basic_setup+0x48/0x78
 [<00000000101003b8>] init+0x38/0x238
 [<000000001010947c>] ret_from_kernel_thread+0x24/0x38

lba range[2] : ignoring GMMIO (0xfffffff904000000)
---

c.
