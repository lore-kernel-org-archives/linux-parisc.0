From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.10-pa4: some "Badness in smp_call_function"
	during boot time of n4k (may be the same for nicol?)
Date: Tue, 4 Jan 2005 15:28:00 +0100
Message-ID: <41C9680200002CF2@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
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

Here is the console output of the n4k (dual way, 4Gb of ram):
Linux version 2.6.10-pa4-n4kmp (root@patst006) (gcc version 3.0.4) #1 SMP=

Tue Jan 4 11:24:31 CET 2005
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005d30 00000491 00000000 00000002 27988e5d 100000f1 00000008 0000=
00b2
000000b2
vers  00000301
CPUID vers 18 rev 11 (0x0000024b)
capabilities 0x1
model 9000/800/N4000-55
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000007fffffff Size   2048 Mb
 1) Start 0x0000000180000000 End 0x00000001ffffffff Size   2048 Mb
Total Memory: 4096 Mb
SMP: bootstrap CPU ID is 0
Built 2 zonelists
Kernel command line: root=3D/dev/sda5 HOME=3D/ panic=3D120 profile=3D2 co=
nsole=3DttyS0
TERM=3Dvt102 palo_kernel=3D3/vmlinux-2.6.10-pa4-n4kmp
kernel profiling enabled (shift: 2)
PID hash table entries: 4096 (order: 12, 131072 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
Memory: 4194304k available
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
Brought up 1 CPUs
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Unknown machine at 0xfffffffffed25000 [37] { 0, 0x0, 0x5d3, 0x00000 }
2. Unknown machine at 0xfffffffffed2d000 [45] { 0, 0x0, 0x5d3, 0x00000 }
3. DEW BC Runway Port at 0xfffffffffed24000 [36] { 7, 0x0, 0x584, 0x0000c=

}
4. DEW BC Runway Port at 0xfffffffffed2c000 [44] { 7, 0x0, 0x584, 0x0000c=

}
5. Memory at 0xfffffffffedc0000 [192] { 1, 0x0, 0x090, 0x00009 }
6. IKE I/O BC Merced Port at 0xfffffffffed00000 [0] { 7, 0x0, 0x803, 0x00=
00c
}
7. Elroy PCI Bridge at 0xffffffffbffe0000 [0/0] { 13, 0x0, 0x782, 0x0000a=

}
8. Elroy PCI Bridge at 0xffffffffbffe2000 [0/1] { 13, 0x0, 0x782, 0x0000a=

}
9. Elroy PCI Bridge at 0xffffffffbffe4000 [0/2] { 13, 0x0, 0x782, 0x0000a=

}
10. Elroy PCI Bridge at 0xffffffffbffe8000 [0/4] { 13, 0x0, 0x782, 0x0000=
a
}
11. Elroy PCI Bridge at 0xffffffffbffea000 [0/5] { 13, 0x0, 0x782, 0x0000=
a
}
12. Elroy PCI Bridge at 0xffffffffbfff0000 [0/8] { 13, 0x0, 0x782, 0x0000=
a
}
13. Elroy PCI Bridge at 0xffffffffbfff4000 [0/10] { 13, 0x0, 0x782, 0x000=
0a
}
14. Elroy PCI Bridge at 0xffffffffbfff8000 [0/12] { 13, 0x0, 0x782, 0x000=
0a
}
15. IKE I/O BC Merced Port at 0xfffffffffed40000 [1] { 7, 0x0, 0x803, 0x0=
000c
}
16. Elroy PCI Bridge at 0xfffffffffece0000 [1/0] { 13, 0x0, 0x782, 0x0000=
a
}
17. Elroy PCI Bridge at 0xfffffffffece4000 [1/2] { 13, 0x0, 0x782, 0x0000=
a
}
18. Elroy PCI Bridge at 0xfffffffffece8000 [1/4] { 13, 0x0, 0x782, 0x0000=
a
}
19. Elroy PCI Bridge at 0xfffffffffecf0000 [1/8] { 13, 0x0, 0x782, 0x0000=
a
}
20. Elroy PCI Bridge at 0xfffffffffecf4000 [1/10] { 13, 0x0, 0x782, 0x000=
0a
}
21. Elroy PCI Bridge at 0xfffffffffecf8000 [1/12] { 13, 0x0, 0x782, 0x000=
0a
}
Releasing cpu 1 now, hpa=3Dfffffffffed2d000
FP[1] enabled: Rev 1 Model 16
CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz
Setting cache flush threshold to 22c380 (2 CPUs online)
SBA found Ike rev 2 at 0xfffffffffed00000
SBA found Ike rev 2 at 0xfffffffffed40000
LBA version TR4.0 (0x5) found at 0xffffffffbffe0000
Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<000000001019abec>] check_spinlock_acquired+0x24/0xb8
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8
 [<00000000102ae708>] kobject_hotplug+0x298/0x3d0

Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<000000001019abec>] check_spinlock_acquired+0x24/0xb8
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8
 [<00000000102ae708>] kobject_hotplug+0x298/0x3d0

Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<000000001019abec>] check_spinlock_acquired+0x24/0xb8
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8
 [<00000000102ae708>] kobject_hotplug+0x298/0x3d0

Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<000000001019abec>] check_spinlock_acquired+0x24/0xb8
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8
 [<00000000102ae708>] kobject_hotplug+0x298/0x3d0

iosapic: no IRTE for 0000:00:04.0 (IRQ not connected?)
Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<0000000010153e40>] __call_console_drivers+0x98/0xc8
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8
 [<00000000102ae708>] kobject_hotplug+0x298/0x3d0

LBA version TR4.0 (0x5) found at 0xffffffffbffe2000
LBA version TR4.0 (0x5) found at 0xffffffffbffe4000
LBA version TR4.0 (0x5) found at 0xffffffffbffe8000
Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<000000001010d18c>] __udivdi3+0x1c/0x30
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8
 [<00000000101543ac>] printk+0x3c/0x50

LBA version TR4.0 (0x5) found at 0xffffffffbffea000
Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<000000001010d18c>] __udivdi3+0x1c/0x30
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8
 [<00000000101543ac>] printk+0x3c/0x50

LBA version TR4.0 (0x5) found at 0xffffffffbfff0000
LBA version TR4.0 (0x5) found at 0xffffffffbfff4000
LBA version TR4.0 (0x5) found at 0xffffffffbfff8000
LBA version TR4.0 (0x5) found at 0xfffffffffece0000
LBA version TR4.0 (0x5) found at 0xfffffffffece4000
LBA version TR4.0 (0x5) found at 0xfffffffffece8000
LBA version TR4.0 (0x5) found at 0xfffffffffecf0000
LBA version TR4.0 (0x5) found at 0xfffffffffecf4000
Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<000000001010d18c>] __udivdi3+0x1c/0x30
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8
 [<00000000101543ac>] printk+0x3c/0x50

LBA version TR4.0 (0x5) found at 0xfffffffffecf8000
Badness in smp_call_function at arch/parisc/kernel/smp.c:342
Backtrace:
 [<0000000010107074>] intr_return+0x0/0x24
 [<000000001010d18c>] __udivdi3+0x1c/0x30
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<0000000010115ecc>] enable_cpu_irq+0x74/0xb0
 [<0000000010116aa8>] setup_irq+0x170/0x198
 [<00000000102b6f1c>] pci_bus_read_config_byte+0x8c/0xe0
 [<0000000010116c04>] request_irq+0x134/0x178
 [<00000000102c20ec>] iosapic_xlate_pin+0xc4/0xe8
 [<00000000102c272c>] iosapic_fixup_irq+0x14c/0x218
 [<00000000102c6d18>] lba_fixup_bus+0x110/0x428
 [<00000000102b8c48>] pci_scan_slot+0x58/0xe8
 [<0000000010121624>] pcibios_fixup_bus+0x54/0x80
 [<00000000102b8d3c>] pci_scan_child_bus+0x64/0x118
 [<0000000010300f04>] class_device_create_file+0x2c/0x40
 [<00000000102b9100>] pci_scan_bus_parented+0x2b8/0x2d8

SCSI subsystem initialized
unwind_init: start =3D 0x104a6300, end =3D 0x104c9d70, entries =3D 9127
Performance monitoring counters enabled for Unknown machine
Initializing Cryptographic API
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled=

ttyS0 at MMIO 0xffffffff80000000 (irq =3D 132) is a 16550A
ttyS1 at MMIO 0xffffffff80000008 (irq =3D 132) is a 16450
ttyS2 at MMIO 0xffffffff80000010 (irq =3D 132) is a 16550A
ttyS3 at MMIO 0xffffffff80000038 (irq =3D 132) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 1.1.13 (December 15, 2004)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at ffffffff80003000, 00:30:6E:1C:B2:0B=
,
IRQ 128.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) bloc=
k.
tulip1: ***WARNING***: No MII transceiver found!
eth1: Digital DS21143 Tulip rev 65 at ffffffff8a000000, 00:30:6E:21:14:B4=
,
IRQ 384.
sym0: <895> rev 0x1 at pci 0000:00:01.0 irq 129
sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
scsi0 : sym-2.1.18n
sym0: SCSI BUS has been reset.
elevator: using anticipatory as default io scheduler
  Vendor: SEAGATE   Model: ST39103LW         Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:8:0: tagged command queuing enabled, command queue depth 16.
 target0:0:8: Beginning Domain Validation
sym0:8: wide asynchronous.
sym0:8: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
 target0:0:8: Domain Validation skipping write tests
 target0:0:8: Ending Domain Validation
sym1: <875> rev 0x37 at pci 0000:00:02.0 irq 130
sym1: No NVRAM, ID 7, Fast-20, SE, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18n
sym2: <875> rev 0x37 at pci 0000:00:02.1 irq 131
sym2: No NVRAM, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.1.18n
st: Version 20041025, fixed bufsize 32768, s/g segs 256
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
SCSI device sda: drive cache: write back
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 sda11 sda12 >
Attached scsi disk sda at scsi0, channel 0, id 8, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 8, lun 0,  type 0
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: md driver 0.90.1 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
NET: Registered protocol family 2
IP: routing cache hash table of 8192 buckets, 192Kbytes
TCP: Hash tables configured (established 131072 bind 43690)
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: Badness in smp_call_function at arch/parisc=
/kernel/smp.c:342
Backtrace:
 [<00000000101147e8>] dump_stack+0x20/0x38
 [<00000000101209d8>] smp_call_function+0xd8/0x4c0
 [<00000000101133f0>] flush_data_cache+0x38/0x70
 [<0000000010111f78>] free_initmem+0x78/0x560
 [<0000000010111c74>] init+0x2c4/0x478
 [<000000001010647c>] ret_from_kernel_thread+0x24/0x38

320k freed
INIT: version 2.86 booting
Usage: vt-is-UTF8 [option]
valid options are:
        -q  --quiet    don't print result
        -h --help      display this help text and exit
        -V --version   display version information and exit
Activating swap.
Adding 250872k swap on /dev/sda2.  Priority:-1 extents:1
Checking root file system...
fsck 1.35 (28-Feb-2004)
/dev/sda5: clean, 68285/203008 files, 302884/406012 blocks (check in 3 mo=
unts)
EXT3 FS on sda5, internal journal
System time was Tue Jan  4 13:23:20 UTC 2005.

Any idea?

TIA,
    Joel


-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
