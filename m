From: Richard Hirst <rhirst@levanta.com>
Subject: [parisc-linux] 2.6.13-rc3-pa0 booted to login prompt on B180
Date: Tue, 26 Jul 2005 23:52:46 +0100
Message-ID: <20050726225246.GE5500@levanta.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="jRHKVT23PllUwdXP"
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Patch attached; it boots to a login prompt but

a) keyboard is dead
b) serial port is dead

so ssh access only.  I included Joel's patch to gsc.c in the
attachment... no credit to me for that part.

Richard


Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 0060b0-1861d0
System IP Address 192.168.1.69
Server IP Address 192.168.1.2

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl 1.9 root@c3k Wed Jul 20 12:51:49 MDT 2005

Boot image contains:
    0/vmlinux32 5033436 bytes @ 0xa000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'HOME=/ root=/dev/sda5 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 32-bit kernelELF32 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 3443904 mediaptr 0x1000
Segment 1 load 0044c000 size 647302 mediaptr 0x34a000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.13-rc3-pa0 (richard@slab.home) (gcc version 4.0.1 (Debian 4.0.1-2)) #18 Tue Jul 26 22:14:42 UTC 2005
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005040 00000481 00000000 02020202 7742aa81 100000f0 00000004 000000ba 000000ba
vers  00000018
CPUID vers 15 rev 24 (0x000001f8)
capabilities 0x2
model 9000/778/B180L
Total Memory: 256 MB
LED display at f0190001 registered
Built 1 zonelists
Kernel command line: HOME=/ root=/dev/sda5 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 2048 (order: 11, 32768 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 262144k available
Security Framework v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 0x0008c }
2. Merlin+ 180 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03f, 0x0008c }
3. Merlin+ 180 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03f, 0x00082 }
4. Merlin+ 180 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03f, 0x00074 },  additional addresses: 0xffd01000 0xffd03000 
5. Merlin+ 180 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03f, 0x0007b }
6. Merlin+ 180 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03f, 0x00084 }
7. Merlin+ 180 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03f, 0x00084 }
8. Bluefish Add-on FW-SCSI at 0xfff88000 [8/8] { 4, 0x1, 0x013, 0x00089 }
9. Merlin+ 180 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03f, 0x00081 },  additional addresses: 0xffd0c000 0xffc00000 
10. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085 },  additional addresses: 0xf0011000 
11. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
12. Merlin L2+ 180 (9000/778/B180L) at 0xfffbe000 [62] { 0, 0x0, 0x504, 0x00004 }
13. Memory at 0xfffbf000 [63] { 1, 0x0, 0x05a, 0x00009 }
14. Dino PCI Bridge at 0xfff80000 [0] { 13, 0x2, 0x680, 0x0000a }
15. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
CPU(s): 1 x PA7300LC (PCX-L2) at 180.000000 MHz
Setting cache flush threshold to d00 (1 CPUs online)
Lasi version 0 at 0xffd00000 found.
Dino version 3.0 found at 0xfff80000
The GSCtoPCI (Dino hrev 2) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.

SCSI subsystem initialized
unwind_init: start = 0x103cb110, end = 0x103eeea0, entries = 9177
inotify syscall
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
PDC Stable Storage facility v0.09
Soft power switch enabled, polling @ 0xf0140000.
STI GSC/PCI core graphics driver Version 0.9a
    id 2d08c0a7-9a02587, conforms to spec rev. 8.07
    graphics card name: INTERNAL_EG_1024
sticon: Initializing STI text console.
Console: switching to colour STI console 128x48
Console: switching to colour frame buffer device 128x48
fb0: stifb 1024x768-8 frame buffer device, INTERNAL_EG_1024, id: 2d08c0a7, mmio: 0xf8100000
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
Serial: device 0xffd05000 not configured.
Enable support for Wax, Lasi, Asp or Dino.
Serial: device 0xfff83000 not configured.
Enable support for Wax, Lasi, Asp or Dino.
Serial: device 0xffd05000 not configured.
Enable support for Wax, Lasi, Asp or Dino.
IRQ not found for parallel device at 0xffd02000
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
loop: loaded (max 8 devices)
PPP generic driver version 2.4.2
Linux Tulip driver version 1.1.13 (December 15, 2004)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/DS21143 Tulip rev 48 at 80000080, 00:60:B0:18:61:D0, IRQ 17.
sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 16
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.1
  Vendor: SEAGATE   Model: ST34371W          Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:6: tagged command queuing enabled, command queue depth 16.
 target0:0:6: Beginning Domain Validation
 target0:0:6: asynchronous.
 target0:0:6: wide asynchronous.
 target0:0:6: Domain Validation skipping write tests
 target0:0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:6: Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
lasi700: request_irq failed!
st: Version 20050501, fixed bufsize 32768, s/g segs 256
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sda: drive cache: write back
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 < sda5 sda6 sda7 >
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 6, lun 0,  type 0
aoe: aoe_init: AoE v2.6-10 initialised.
mice: PS/2 mouse device common for all mice
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   206.400 MB/sec
   8regs_prefetch:   204.800 MB/sec
   32regs    :   232.800 MB/sec
   32regs_prefetch:   323.200 MB/sec
raid5: using function: 32regs_prefetch (323.200 MB/sec)
raid6: int32x1     66 MB/s
raid6: int32x2     83 MB/s
raid6: int32x4     98 MB/s
raid6: int32x8     72 MB/s
raid6: using algorithm int32x4 (98 MB/s)
md: raid6 personality registered as nr 8
md: md driver 0.90.2 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: bitmap version 3.38
NET: Registered protocol family 2
IP route cache hash table entries: 4096 (order: 2, 16384 bytes)
TCP established hash table entries: 16384 (order: 5, 131072 bytes)
TCP bind hash table entries: 16384 (order: 4, 65536 bytes)
TCP: Hash tables configured (established 16384 bind 16384)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 10
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 588k freed
Warning: unable to open an initial console.
Adding 184708k swap on /dev/sda6.  Priority:-1 extents:1
EXT3 FS on sda5, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda7, internal journal
EXT3-fs: mounted filesystem with ordered data mode.

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=d

Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/drivers.c,v
retrieving revision 1.24
diff -u -r1.24 drivers.c
--- arch/parisc/kernel/drivers.c	19 Jul 2005 03:49:49 -0000	1.24
+++ arch/parisc/kernel/drivers.c	26 Jul 2005 22:47:12 -0000
@@ -470,10 +470,11 @@
 	struct match_id_data d = {
 		.id = id,
 	};
-	int ret;
 
-	ret = for_each_padev(match_by_id, &d);
-	return ret ? create_tree_node(id, parent) : NULL;
+	if (device_for_each_child(parent, &d, match_by_id))
+		return d.dev;
+	else
+		return create_tree_node(id, parent);
 }
 
 static struct parisc_device *create_parisc_device(struct hardware_path *modpath)
Index: drivers/parisc/gsc.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/gsc.c,v
retrieving revision 1.21
diff -u -r1.21 gsc.c
--- drivers/parisc/gsc.c	23 Jan 2005 00:09:47 -0000	1.21
+++ drivers/parisc/gsc.c	26 Jul 2005 22:47:21 -0000
@@ -186,9 +186,13 @@
 void gsc_fixup_irqs(struct parisc_device *parent, void *ctrl,
 			void (*choose_irq)(struct parisc_device *, void *))
 {
+	extern struct device * next_device(struct klist_iter * i);
+
 	struct device *dev;
+	struct klist_iter i;
 
-	list_for_each_entry(dev, &parent->dev.children, node) {
+	klist_iter_init(&parent->dev.klist_children, &i);
+	while ((dev = next_device(&i))) {
 		struct parisc_device *padev = to_parisc_device(dev);
 
 		/* work-around for 715/64 and others which have parent 
@@ -197,6 +201,7 @@
 			return gsc_fixup_irqs(padev, ctrl, choose_irq);
 		choose_irq(padev, ctrl);
 	}
+	klist_iter_exit(&i);
 }
 
 int gsc_common_setup(struct parisc_device *parent, struct gsc_asic *gsc_asic)

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--jRHKVT23PllUwdXP--
