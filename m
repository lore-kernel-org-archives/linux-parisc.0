From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Cell support and fix PCI PDC paths
Date: Wed, 27 Dec 2006 19:49:37 +0100
Message-ID: <200612271949.37956.deller__41433.2978347831$1416624241$gmane$org@gmx.de>
References: <20061225231328.GA5741@parisc-linux.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_BBskFHj9kJL8sAu"
Cc: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061225231328.GA5741@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_BBskFHj9kJL8sAu
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Matthew,

On Tue Dec 26 2006, Matthew Wilcox wrote:
> Grant noted that the way we construct a PDC
> address for a PCI device is wrong on some machines
> (ftp://ftp.parisc-linux.org/patches/diff-2.6.20-rc1-PCI_hwpath).
> I noticed the PDC_PAT_IO_GET_HW_FROM_PCI_CONFIG procedure in the PAT
> PDC document, and decided we should use it instead where we can.
> 
> I also noticed that the definition of the flags byte has been changed
> for PAT machines -- the bottom 6 bits now define which cell the device is
> attached to.  This explains (for example) why we get a duplicate hwpath
> for Vesa's rp8400.
> 
> We would have got wrong results from the pdc_stable driver when it tried
> to read the timeout value, so I've just disabled that sysfs file on pdc
> machines for now.
> 
> I chose to implement cellular support by tagging each parisc_device
> with a 'cell' byte, rather than the more obvious creation of a set of
> cell parisc_devices as I thought this would minimise code churn and
> memory consumption.
> 
> I didn't like the use of PF_* for flag definitions.  To me, PF_* are
> networking protocol families (eg PF_INET).  So I changed that to HWP
> for hardware path.
> 
> Testing appreciated; I've only tried it on an N-class.

I've tested the patch on a c3000, a 715/64 and an B160L.
Your patch works without obvious problems.
dmesg logs of all machines attached.

Helge


--Boundary-00=_BBskFHj9kJL8sAu
Content-Type: text/plain; charset="iso-8859-1"; name="dmesg-715_64-2620rc2.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="dmesg-715_64-2620rc2.log"

Linux version 2.6.20-rc2 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #137 Tue Dec 26 01:35:03 CET 2006
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: Snake.
model 000060a0 00000481 00000000 00000000 773c7d2c 00000000 00000004 00000072 00000072
vers  0000000c
model 9000/715
Total Memory: 160 MB
On node 0 totalpages: 40960
  DMA zone: 320 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 40640 pages, LIFO batch:7
  Normal zone: 0 pages used for memmap
Built 1 zonelists.  Total pages: 40640
Kernel command line: HOME=/ root=/dev/sda3 ip=bootp console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 1024 (order: 10, 4096 bytes)
Console: colour dummy device 128x48
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
                                 | spin |wlock |rlock |mutex | wsem | rsem |
  --------------------------------------------------------------------------
                     A-A deadlock:failed|failed|  ok  |failed|failed|failed|
                 A-B-B-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-B-C-C-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-C-A-B-C deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
                    double unlock:  ok  |  ok  |failed|  ok  |failed|failed|
                  initialize held:failed|failed|failed|failed|failed|failed|
                 bad unlock order:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
  --------------------------------------------------------------------------
              recursive read-lock:             |  ok  |             |failed|
           recursive read-lock #2:             |  ok  |             |failed|
            mixed read-write-lock:             |failed|             |failed|
            mixed write-read-lock:             |failed|             |failed|
  --------------------------------------------------------------------------
     hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/12:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/21:failed|failed|  ok  |
         hard-safe-A + irqs-on/12:failed|failed|  ok  |
         soft-safe-A + irqs-on/12:failed|failed|  ok  |
         hard-safe-A + irqs-on/21:failed|failed|  ok  |
         soft-safe-A + irqs-on/21:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |
      hard-irq lock-inversion/123:failed|failed|  ok  |
      soft-irq lock-inversion/123:failed|failed|  ok  |
      hard-irq lock-inversion/132:failed|failed|  ok  |
      soft-irq lock-inversion/132:failed|failed|  ok  |
      hard-irq lock-inversion/213:failed|failed|  ok  |
      soft-irq lock-inversion/213:failed|failed|  ok  |
      hard-irq lock-inversion/231:failed|failed|  ok  |
      soft-irq lock-inversion/231:failed|failed|  ok  |
      hard-irq lock-inversion/312:failed|failed|  ok  |
      soft-irq lock-inversion/312:failed|failed|  ok  |
      hard-irq lock-inversion/321:failed|failed|  ok  |
      soft-irq lock-inversion/321:failed|failed|  ok  |
      hard-irq read-recursion/123:  ok  |
      soft-irq read-recursion/123:  ok  |
      hard-irq read-recursion/132:  ok  |
      soft-irq read-recursion/132:  ok  |
      hard-irq read-recursion/213:  ok  |
      soft-irq read-recursion/213:  ok  |
      hard-irq read-recursion/231:  ok  |
      soft-irq read-recursion/231:  ok  |
      hard-irq read-recursion/312:  ok  |
      soft-irq read-recursion/312:  ok  |
      hard-irq read-recursion/321:  ok  |
      soft-irq read-recursion/321:  ok  |
--------------------------------------------------------
142 out of 218 testcases failed, as expected. |
----------------------------------------------------
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 156316k/163840k available (3309k kernel code, 7376k reserved, 1474k data, 368k init)
virtual kernel memory layout:
    vmalloc : 0x00810000 - 0x0f000000   ( 231 MB)
    memory  : 0x10000000 - 0x1a000000   ( 160 MB)
      .init : 0x10604000 - 0x10660000   ( 368 kB)
      .data : 0x1043b690 - 0x105ac000   (1474 kB)
      .text : 0x10100000 - 0x1043b690   (3309 kB)
Calibrating delay loop... 63.36 BogoMIPS (lpj=126720)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Mirage Jr GSC Builtin Graphics at 0xf8000000 [1] { 10, 0x0, 0x012, 0x00085 }
2. Mirage Jr Core BA at 0xf0100000 [2] { 11, 0x0, 0x028, 0x00081 }
3. Mirage Jr Core SCSI at 0xf0106000 [2/0/1] { 10, 0x0, 0x028, 0x00082 }
4. Mirage Jr Core LAN (802.3) at 0xf0107000 [2/0/2] { 10, 0x0, 0x028, 0x0008a }
5. Mirage Jr Core RS-232 at 0xf0105000 [2/0/4] { 10, 0x0, 0x028, 0x0008c }
6. Mirage Jr Core Centronics at 0xf0102000 [2/0/6] { 10, 0x0, 0x028, 0x00074 }
7. Mirage Jr Audio at 0xf0104000 [2/0/8] { 10, 0x0, 0x028, 0x0007b }
8. Mirage Jr Core PC Floppy at 0xf010a000 [2/0/10] { 10, 0x0, 0x028, 0x00083 }
9. Mirage Jr Core PS/2 Port at 0xf0108000 [2/0/11] { 10, 0x0, 0x028, 0x00084 }
10. Mirage Jr Core PS/2 Port at 0xf0108100 [2/0/12] { 10, 0x0, 0x028, 0x00084 }
11. Mirage Jr Wax EISA BA at 0xfc000000 [4] { 11, 0x0, 0x028, 0x00090 }
12. Mirage Jr Wax BA at 0xf0200000 [5] { 11, 0x0, 0x012, 0x0008e }
13. Mirage Jr Wax HIL at 0xf0201000 [5/0/1] { 10, 0x0, 0x012, 0x00073 }
14. Mirage Jr Wax RS-232 at 0xf0202000 [5/0/2] { 10, 0x0, 0x012, 0x0008c }
15. Mirage Jr (715/64) at 0xfffbe000 [8] { 0, 0x0, 0x60a, 0x00004 }
16. Memory at 0xfffbf000 [9] { 1, 0x0, 0x04a, 0x00009 }
Enabling regular chassis codes support v0.05
CPU(s): 1 x PA7100LC (PCX-L) at 64.000000 MHz
Whole cache flush 46824 cycles, flushing 5636096 bytes 644668 cycles
Setting cache flush threshold to ba0 (1 CPUs online)
Lasi version 0 at 0xf0100000 found.
LED display at f00e0000 registered
wax at 0xf0200000 found.
Wax EISA Adapter found at 0xfc000000
Enumerating EISA bus
EISA: Probing bus 0 at 4
EISA: Mainboard HWPC000 detected.
EISA: Detected 0 cards.
SCSI subsystem initialized
libata version 2.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 5, 131072 bytes)
TCP bind hash table entries: 4096 (order: 4, 81920 bytes)
TCP: Hash tables configured (established 8192 bind 4096)
TCP reno registered
Chassis warnings not supported.
unwind_init: start = 0x10530180, end = 0x1056bad0, entries = 15253
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
EISA EEPROM at 0x00810400
PDC Stable Storage facility v0.30
Gecko-style soft power switch enabled.
STI GSC/PCI core graphics driver Version 0.9a
    id 2b4ded6d-40a00499, conforms to spec rev. 8.04
    graphics card name: HPA208LCG1280
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, HPA208LCG1280, id: 2b4ded6d, mmio: 0xf8100000
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
2:0:4: ttyS0 at MMIO 0xf0105800 (irq = 18) is a 16550A
5:0:2: ttyS1 at MMIO 0xf0202800 (irq = 25) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 19 [PCSPP,TRISTATE]
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xf0107000, IRQ 17
eth0: 82596 at 0xf0107000, 08 00 09 C2 9E 60 IRQ 17.
orinoco 0.15 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel Roskin <proski@gnu.org>, et al)
orinoco_cs 0.15 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel Roskin <proski@gnu.org>, et al)
spectrum_cs 0.15 (Pavel Roskin <proski@gnu.org>, David Gibson <hermes@gibson.dropbear.id.au>, et al)
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
scsi 0:0:6:0: Direct-Access     QUANTUM  FIREBALL_TM3200S 300X PQ: 0 ANSI: 2
 target0:0:6: Beginning Domain Validation
scsi 0:0:6:0: Enabling Tag Command Queuing
 target0:0:6: asynchronous
 target0:0:6: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
 target0:0:6: Domain Validation skipping write tests
 target0:0:6: Ending Domain Validation
st: Version 20061107, fixed bufsize 32768, s/g segs 256
SCSI device sda: 6281856 512-byte hdwr sectors (3216 MB)
sda: Write Protect is off
sda: Mode Sense: a3 00 00 08
SCSI device sda: write cache: enabled, read cache: enabled, doesn't support DPO or FUA
SCSI device sda: 6281856 512-byte hdwr sectors (3216 MB)
sda: Write Protect is off
sda: Mode Sense: a3 00 00 08
SCSI device sda: write cache: enabled, read cache: enabled, doesn't support DPO or FUA
 sda: sda1 sda2 sda3 sda4
sd 0:0:6:0: Attached scsi disk sda
sd 0:0:6:0: Attached scsi generic sg0 type 0
usbmon: debugfs is not available
ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
USB Universal Host Controller Interface driver v3.0
usbcore: registered new interface driver usbhid
drivers/usb/input/hid-core.c: v2.6:USB HID core driver
serio: GSC PS/2 keyboard port at 0x0081a000 irq 22 @ 2:0:11
serio: GSC PS/2 mouse port at 0x0081c100 irq 22 @ 2:0:12
mice: PS/2 mouse device common for all mice
gscps2.c: timeout - could not write byte 0xed
gscps2.c: sending byte 0xed failed.
gscps2.c: timeout - could not write byte 0xed
gscps2.c: sending byte 0xed failed.
rtc-test rtc-test.0: rtc core: registered test as rtc0
rtc-test rtc-test.1: rtc core: registered test as rtc1
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
raid6: int32x1     19 MB/s
raid6: int32x2     29 MB/s
raid6: int32x4     34 MB/s
raid6: int32x8     25 MB/s
raid6: using algorithm int32x4 (34 MB/s)
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
raid5: measuring checksumming speed
   8regs     :    45.000 MB/sec
   8regs_prefetch:    45.000 MB/sec
   32regs    :    73.000 MB/sec
   32regs_prefetch:    73.000 MB/sec
raid5: using function: 32regs_prefetch (73.000 MB/sec)
device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-devel@redhat.com
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
rtc-test rtc-test.0: setting the system clock to 2101-08-02 02:46:25 (4152393985)
eth0: link ok.
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 192.168.178.64
IP-Config: Complete:
      device=eth0, addr=192.168.178.64, mask=255.255.255.0, gw=192.168.178.1,
     host=pa64, domain=box, nis-domain=(none),
     bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 368k freed
Adding 248580k swap on /dev/sda2.  Priority:-1 extents:1 across:248580k
EXT3 FS on sda3, internal journal
NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
NFSD: starting 90-second grace period

--Boundary-00=_BBskFHj9kJL8sAu
Content-Type: text/plain; charset="iso-8859-1"; name="dmesg-B160L-2620rc2.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="dmesg-B160L-2620rc2.log"

Linux version 2.6.20-rc2 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #137 Tue Dec 26 01:35:03 CET 2006
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005020 00000481 00000000 02020202 7794d7fe 100000f0 00000004 000000ba 000000ba
vers  00000008
CPUID vers 15 rev 8 (0x000001e8)
capabilities 0x2
model 9000/778/B160L
Total Memory: 512 MB
On node 0 totalpages: 131072
  DMA zone: 1024 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 130048 pages, LIFO batch:31
  Normal zone: 0 pages used for memmap
LED display at f0190001 registered
Built 1 zonelists.  Total pages: 130048
Kernel command line: HOME=/ root=/dev/sda3 ip=bootp console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 2048 (order: 11, 8192 bytes)
Console: colour dummy device 128x48
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
                                 | spin |wlock |rlock |mutex | wsem | rsem |
  --------------------------------------------------------------------------
                     A-A deadlock:failed|failed|  ok  |failed|failed|failed|
                 A-B-B-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-B-C-C-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-C-A-B-C deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
                    double unlock:  ok  |  ok  |failed|  ok  |failed|failed|
                  initialize held:failed|failed|failed|failed|failed|failed|
                 bad unlock order:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
  --------------------------------------------------------------------------
              recursive read-lock:             |  ok  |             |failed|
           recursive read-lock #2:             |  ok  |             |failed|
            mixed read-write-lock:             |failed|             |failed|
            mixed write-read-lock:             |failed|             |failed|
  --------------------------------------------------------------------------
     hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/12:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/21:failed|failed|  ok  |
         hard-safe-A + irqs-on/12:failed|failed|  ok  |
         soft-safe-A + irqs-on/12:failed|failed|  ok  |
         hard-safe-A + irqs-on/21:failed|failed|  ok  |
         soft-safe-A + irqs-on/21:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |
      hard-irq lock-inversion/123:failed|failed|  ok  |
      soft-irq lock-inversion/123:failed|failed|  ok  |
      hard-irq lock-inversion/132:failed|failed|  ok  |
      soft-irq lock-inversion/132:failed|failed|  ok  |
      hard-irq lock-inversion/213:failed|failed|  ok  |
      soft-irq lock-inversion/213:failed|failed|  ok  |
      hard-irq lock-inversion/231:failed|failed|  ok  |
      soft-irq lock-inversion/231:failed|failed|  ok  |
      hard-irq lock-inversion/312:failed|failed|  ok  |
      soft-irq lock-inversion/312:failed|failed|  ok  |
      hard-irq lock-inversion/321:failed|failed|  ok  |
      soft-irq lock-inversion/321:failed|failed|  ok  |
      hard-irq read-recursion/123:  ok  |
      soft-irq read-recursion/123:  ok  |
      hard-irq read-recursion/132:  ok  |
      soft-irq read-recursion/132:  ok  |
      hard-irq read-recursion/213:  ok  |
      soft-irq read-recursion/213:  ok  |
      hard-irq read-recursion/231:  ok  |
      soft-irq read-recursion/231:  ok  |
      hard-irq read-recursion/312:  ok  |
      soft-irq read-recursion/312:  ok  |
      hard-irq read-recursion/321:  ok  |
      soft-irq read-recursion/321:  ok  |
--------------------------------------------------------
142 out of 218 testcases failed, as expected. |
----------------------------------------------------
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 513152k/524288k available (3309k kernel code, 11100k reserved, 1474k data, 368k init)
virtual kernel memory layout:
    vmalloc : 0x00810000 - 0x0f000000   ( 231 MB)
    memory  : 0x10000000 - 0x30000000   ( 512 MB)
      .init : 0x10604000 - 0x10660000   ( 368 kB)
      .data : 0x1043b690 - 0x105ac000   (1474 kB)
      .text : 0x10100000 - 0x1043b690   (3309 kB)
Calibrating delay loop... 106.24 BogoMIPS (lpj=212480)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
2. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x3, 0x680, 0x0000a }
3. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 0x0008c }
4. Merlin 160 Core FW-SCSI at 0xfff8c000 [8/12] { 4, 0x0, 0x03d, 0x00089 }
5. Merlin 160 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03d, 0x00081 }, additional addresses: 0xffd0c000 0xffc00000 
6. Merlin 160 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03d, 0x0008c }
7. Merlin 160 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03d, 0x00082 }
8. Merlin 160 Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x03d, 0x0008a }
9. Merlin 160 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03d, 0x00074 }, additional addresses: 0xffd01000 0xffd03000 
10. Merlin 160 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03d, 0x0007b }
11. Merlin 160 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03d, 0x00084 }
12. Merlin 160 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03d, 0x00084 }
13. Coral SGC Graphics at 0xfa000000 [8/4] { 10, 0x0, 0x004, 0x00077 }
14. Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 }
15. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085 }, additional addresses: 0xf0011000 
16. Merlin L2 160 (9000/778/B160L) at 0xfffbe000 [62] { 0, 0x0, 0x502, 0x00004 }
17. Memory at 0xfffbf000 [63] { 1, 0x0, 0x067, 0x00009 }
18. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
Enabling regular chassis codes support v0.05
CPU(s): 1 x PA7300LC (PCX-L2) at 160.000000 MHz
Whole cache flush 25730 cycles, flushing 5636096 bytes 805908 cycles
Setting cache flush threshold to 1000 (1 CPUs online)
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xfff80000
Dino: No PCI devices enabled.
SCSI subsystem initialized
libata version 2.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 16384 (order: 4, 65536 bytes)
TCP established hash table entries: 65536 (order: 8, 1048576 bytes)
TCP bind hash table entries: 32768 (order: 7, 655360 bytes)
TCP: Hash tables configured (established 65536 bind 32768)
TCP reno registered
Enabling PDC chassis warnings support v0.05
unwind_init: start = 0x10530180, end = 0x1056bad0, entries = 15253
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
PDC Stable Storage facility v0.30
Soft power switch enabled, polling @ 0xf0140000.
STI GSC/PCI core graphics driver Version 0.9a
    id 2bcb015a-9a02587, conforms to spec rev. 8.04
    graphics card name: HPA4071B
    id 2d08c0a7-9a02587, conforms to spec rev. 8.07
    graphics card name: HPA4450AX1024
    id 2d08c0a7-9a02587, conforms to spec rev. 8.07
    graphics card name: INTERNAL_EG_X1024
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, HPA4071B, id: 2bcb015a, mmio: 0xfa100000
fb1: stifb 1024x768-8 frame buffer device, HPA4450AX1024, id: 2d08c0a7, mmio: 0xf4100000
fb2: stifb 1024x768-8 frame buffer device, INTERNAL_EG_X1024, id: 2d08c0a7, mmio: 0xf8100000
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
8:16:4: ttyS0 at MMIO 0xffd05800 (irq = 16) is a 16550A
8:0:63: ttyS1 at MMIO 0xfff83800 (irq = 22) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 19 [PCSPP,TRISTATE]
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffd07000, IRQ 18
eth0: 82596 at 0xffd07000, 08 00 09 EF 34 F5 IRQ 18.
orinoco 0.15 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel Roskin <proski@gnu.org>, et al)
orinoco_cs 0.15 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel Roskin <proski@gnu.org>, et al)
spectrum_cs 0.15 (Pavel Roskin <proski@gnu.org>, David Gibson <hermes@gibson.dropbear.id.au>, et al)
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
zalon_probe: Zalon version 1, IRQ 67
ncr53c720-0: rev 0xf irq 67
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g
scsi 0:0:6:0: Direct-Access     SEAGATE  ST32171W         HP03 PQ: 0 ANSI: 2
 target0:0:6: Beginning Domain Validation
 target0:0:6: asynchronous
 target0:0:6: wide asynchronous
 target0:0:6: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target0:0:6: Domain Validation skipping write tests
 target0:0:6: Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
scsi 1:0:1:0: CD-ROM            PHILIPS  PCA80SC          V3-0 PQ: 0 ANSI: 2
 target1:0:1: Beginning Domain Validation
 target1:0:1: asynchronous
 target1:0:1: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
 target1:0:1: Domain Validation skipping write tests
 target1:0:1: Ending Domain Validation
st: Version 20061107, fixed bufsize 32768, s/g segs 256
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
sda: Write Protect is off
sda: Mode Sense: 9f 00 10 08
SCSI device sda: write cache: disabled, read cache: enabled, supports DPO and FUA
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
sda: Write Protect is off
sda: Mode Sense: 9f 00 10 08
SCSI device sda: write cache: disabled, read cache: enabled, supports DPO and FUA
 sda: sda1 sda2 sda3
sd 0:0:6:0: Attached scsi disk sda
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.20
sr 1:0:1:0: Attached scsi CD-ROM sr0
sd 0:0:6:0: Attached scsi generic sg0 type 0
sr 1:0:1:0: Attached scsi generic sg1 type 5
usbmon: debugfs is not available
ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
USB Universal Host Controller Interface driver v3.0
usbcore: registered new interface driver usbhid
drivers/usb/input/hid-core.c: v2.6:USB HID core driver
serio: GSC PS/2 keyboard port at 0x0081a000 irq 21 @ 8:16:7
serio: GSC PS/2 mouse port at 0x0081c100 irq 21 @ 8:16:8
mice: PS/2 mouse device common for all mice
gscps2.c: timeout - could not write byte 0xed
gscps2.c: sending byte 0xed failed.
gscps2.c: timeout - could not write byte 0xed
gscps2.c: sending byte 0xed failed.
rtc-test rtc-test.0: rtc core: registered test as rtc0
rtc-test rtc-test.1: rtc core: registered test as rtc1
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
raid6: int32x1     41 MB/s
raid6: int32x2     68 MB/s
raid6: int32x4     80 MB/s
raid6: int32x8     69 MB/s
raid6: using algorithm int32x4 (80 MB/s)
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
raid5: measuring checksumming speed
   8regs     :   131.000 MB/sec
   8regs_prefetch:   131.000 MB/sec
   32regs    :   206.000 MB/sec
   32regs_prefetch:   206.000 MB/sec
raid5: using function: 32regs_prefetch (206.000 MB/sec)
device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-devel@redhat.com
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
rtc-test rtc-test.0: setting the system clock to 1987-01-05 20:01:33 (536875293)
eth0: link ok.
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 192.168.178.65
IP-Config: Complete:
      device=eth0, addr=192.168.178.65, mask=255.255.255.0, gw=192.168.178.1,
     host=b160, domain=box, nis-domain=(none),
     bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 368k freed
Adding 249232k swap on /dev/sda2.  Priority:-1 extents:1 across:249232k
EXT3 FS on sda3, internal journal

--Boundary-00=_BBskFHj9kJL8sAu
Content-Type: text/plain; charset="iso-8859-1"; name="dmesg-c3000-2620rc2.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="dmesg-c3000-2620rc2.log"

Linux version 2.6.20-rc2 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #137 Tue Dec 26 01:35:03 CET 2006
FP[0] enabled: Rev 1 Model 19
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 19 rev 11 (0x0000026b)
capabilities 0x7
model 9000/785/C3700
Total Memory: 2048 MB
On node 0 totalpages: 524288
  DMA zone: 4096 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 520192 pages, LIFO batch:31
  Normal zone: 0 pages used for memmap
LCD display at f05d0008,f05d0000 registered
Built 1 zonelists.  Total pages: 520192
Kernel command line: HOME=/ root=/dev/sda3 ip=bootp console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 16384 bytes)
Console: colour dummy device 128x48
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
                                 | spin |wlock |rlock |mutex | wsem | rsem |
  --------------------------------------------------------------------------
                     A-A deadlock:failed|failed|  ok  |failed|failed|failed|
                 A-B-B-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-B-C-C-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-C-A-B-C deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
                    double unlock:  ok  |  ok  |failed|  ok  |failed|failed|
                  initialize held:failed|failed|failed|failed|failed|failed|
                 bad unlock order:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
  --------------------------------------------------------------------------
              recursive read-lock:             |  ok  |             |failed|
           recursive read-lock #2:             |  ok  |             |failed|
            mixed read-write-lock:             |failed|             |failed|
            mixed write-read-lock:             |failed|             |failed|
  --------------------------------------------------------------------------
     hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/12:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/21:failed|failed|  ok  |
         hard-safe-A + irqs-on/12:failed|failed|  ok  |
         soft-safe-A + irqs-on/12:failed|failed|  ok  |
         hard-safe-A + irqs-on/21:failed|failed|  ok  |
         soft-safe-A + irqs-on/21:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |
      hard-irq lock-inversion/123:failed|failed|  ok  |
      soft-irq lock-inversion/123:failed|failed|  ok  |
      hard-irq lock-inversion/132:failed|failed|  ok  |
      soft-irq lock-inversion/132:failed|failed|  ok  |
      hard-irq lock-inversion/213:failed|failed|  ok  |
      soft-irq lock-inversion/213:failed|failed|  ok  |
      hard-irq lock-inversion/231:failed|failed|  ok  |
      soft-irq lock-inversion/231:failed|failed|  ok  |
      hard-irq lock-inversion/312:failed|failed|  ok  |
      soft-irq lock-inversion/312:failed|failed|  ok  |
      hard-irq lock-inversion/321:failed|failed|  ok  |
      soft-irq lock-inversion/321:failed|failed|  ok  |
      hard-irq read-recursion/123:  ok  |
      soft-irq read-recursion/123:  ok  |
      hard-irq read-recursion/132:  ok  |
      soft-irq read-recursion/132:  ok  |
      hard-irq read-recursion/213:  ok  |
      soft-irq read-recursion/213:  ok  |
      hard-irq read-recursion/231:  ok  |
      soft-irq read-recursion/231:  ok  |
      hard-irq read-recursion/312:  ok  |
      soft-irq read-recursion/312:  ok  |
      hard-irq read-recursion/321:  ok  |
      soft-irq read-recursion/321:  ok  |
--------------------------------------------------------
142 out of 218 testcases failed, as expected. |
----------------------------------------------------
Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 131072 (order: 7, 524288 bytes)
Memory: 2069376k/2097152k available (3309k kernel code, 27680k reserved, 1474k data, 368k init)
virtual kernel memory layout:
    vmalloc : 0x00008000 - 0x0f000000   ( 239 MB)
    memory  : 0x10000000 - 0x90000000   (2048 MB)
      .init : 0x10604000 - 0x10660000   ( 368 kB)
      .data : 0x1043b690 - 0x105ac000   (1474 kB)
      .text : 0x10100000 - 0x1043b690   (3309 kB)
Calibrating delay loop... 1495.04 BogoMIPS (lpj=2990080)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. Allegro W2 at 0xfffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
7. Memory at 0xfed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
Enabling regular chassis codes support v0.05
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Whole cache flush 247082 cycles, flushing 5636096 bytes 1127108 cycles
Setting cache flush threshold to 380 (1 CPUs online)
SBA found Astro 2.1 at 0xfed00000
Elroy version TR4.0 (0x5) found at 0xfed30000
PCI: Enabled native mode for NS87415 (pif=0x8f)
Elroy version TR4.0 (0x5) found at 0xfed32000
iosapic: no IRTE for 0000:01:04.0 (IRQ not connected?)
iosapic: no IRTE for 0000:01:05.0 (IRQ not connected?)
Elroy version TR4.0 (0x5) found at 0xfed38000
Elroy version TR4.0 (0x5) found at 0xfed3c000
iosapic: hpa not registered for 0000:03:02.0
SCSI subsystem initialized
libata version 2.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 65536 (order: 6, 262144 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1310720 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
Enabling PDC chassis warnings support v0.05
unwind_init: start = 0x10530180, end = 0x1056bad0, entries = 15253
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 67) 
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
PDC Stable Storage facility v0.30
Soft power switch enabled, polling @ 0xf0400804.
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f2400000 (64 kB), fb at f8000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1024
STI PCI graphic ROM found at f3800000 (2048 kB), fb at f6000000 (32 MB)
    id 35acda30-9a02587, conforms to spec rev. 8.0d
    graphics card name: A1262A
sticon: Initializing STI text console.
Console: switching to colour STI console 128x48
Console: switching to colour frame buffer device 128x48
fb0: stifb 1024x768-8 frame buffer device, PCI_GRAFFITIX1024, id: 2d08c0a7, mmio: 0xf8100000
stifb: 'A1262A' (id: 0x35acda30) not supported.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A
serial8250: ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
orinoco 0.15 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel Roskin <proski@gnu.org>, et al)
orinoco_cs 0.15 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel Roskin <proski@gnu.org>, et al)
spectrum_cs 0.15 (Pavel Roskin <proski@gnu.org>, David Gibson <hermes@gibson.dropbear.id.au>, et al)
Linux Tulip driver version 1.1.14 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/43 Tulip rev 65 at Port 0x1000, 00:30:6E:48:AA:64, IRQ 65.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1:  Index #1 - Media 10base2 (#1) described by a 21142 Serial PHY (2) block.
tulip1:  Index #2 - Media AUI (#2) described by a 21142 Serial PHY (2) block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth1: Digital DS21142/43 Tulip rev 33 at Port 0x28000, 00:60:B0:7A:12:89, IRQ 71.
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
NS87415: IDE controller at PCI slot 0000:00:0e.0
NS87415: chipset revision 3
NS87415: 100% native mode on irq 7
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:DMA, hdb:DMA
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:DMA, hdd:DMA
Probing IDE interface ide0...
hda: CD-532E-B, ATAPI CD/DVD-ROM drive
ide0 at 0xf00-0xf07,0xe02 on irq 7
Probing IDE interface ide1...
Probing IDE interface ide1...
hda: ATAPI 32X CD-ROM drive, 128kB Cache
Uniform CD-ROM driver Revision: 3.20
sym0: <896> rev 0x7 at pci 0000:00:0f.0 irq 68
sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
sym1: <896> rev 0x7 at pci 0000:00:0f.1 irq 68
sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.3
scsi 1:0:5:0: Direct-Access     SEAGATE  ST39102LC        HP01 PQ: 0 ANSI: 2
 target1:0:5: tagged command queuing enabled, command queue depth 16.
 target1:0:5: Beginning Domain Validation
 target1:0:5: asynchronous
 target1:0:5: wide asynchronous
 target1:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 15)
 target1:0:5: Domain Validation skipping write tests
 target1:0:5: Ending Domain Validation
scsi 1:0:6:0: Direct-Access     HP 36.4G ST336607LC       HPC3 PQ: 0 ANSI: 3
 target1:0:6: tagged command queuing enabled, command queue depth 16.
 target1:0:6: Beginning Domain Validation
 target1:0:6: asynchronous
 target1:0:6: wide asynchronous
 target1:0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
 target1:0:6: Domain Validation skipping write tests
 target1:0:6: Ending Domain Validation
st: Version 20061107, fixed bufsize 32768, s/g segs 256
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
sda: Write Protect is off
sda: Mode Sense: 9f 00 10 08
SCSI device sda: write cache: disabled, read cache: enabled, supports DPO and FUA
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
sda: Write Protect is off
sda: Mode Sense: 9f 00 10 08
SCSI device sda: write cache: disabled, read cache: enabled, supports DPO and FUA
 sda: sda1 sda2 sda3 sda4
sd 1:0:5:0: Attached scsi disk sda
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
sdb: Write Protect is off
sdb: Mode Sense: d3 00 10 08
SCSI device sdb: write cache: disabled, read cache: enabled, supports DPO and FUA
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
sdb: Write Protect is off
sdb: Mode Sense: d3 00 10 08
SCSI device sdb: write cache: disabled, read cache: enabled, supports DPO and FUA
 sdb: sdb1 sdb2 sdb3 sdb4
sd 1:0:6:0: Attached scsi disk sdb
sd 1:0:5:0: Attached scsi generic sg0 type 0
sd 1:0:6:0: Attached scsi generic sg1 type 0
usbmon: debugfs is not available
ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd 0000:00:0e.2: OHCI Host Controller
ohci_hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
ohci_hcd 0000:00:0e.2: irq 1, io mem 0xf2007000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
USB Universal Host Controller Interface driver v3.0
usb 1-1: new low speed USB device using ohci_hcd and address 2
usb 1-1: configuration #1 chosen from 1 choice
usb 1-2: new low speed USB device using ohci_hcd and address 3
usb 1-2: configuration #1 chosen from 1 choice
input: Logitech N48 as /class/input/input0
input: USB HID v1.00 Mouse [Logitech N48] on usb-0000:00:0e.2-1
input: SILITEK USB Keyboard and Mouse as /class/input/input1
input: USB HID v1.00 Keyboard [SILITEK USB Keyboard and Mouse] on usb-0000:00:0e.2-2
input: SILITEK USB Keyboard and Mouse as /class/input/input2
input: USB HID v1.00 Mouse [SILITEK USB Keyboard and Mouse] on usb-0000:00:0e.2-2
usbcore: registered new interface driver usbhid
drivers/usb/input/hid-core.c: v2.6:USB HID core driver
mice: PS/2 mouse device common for all mice
rtc-test rtc-test.0: rtc core: registered test as rtc0
rtc-test rtc-test.1: rtc core: registered test as rtc1
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
raid6: int32x1    308 MB/s
raid6: int32x2    389 MB/s
raid6: int32x4    469 MB/s
raid6: int32x8    467 MB/s
raid6: using algorithm int32x4 (469 MB/s)
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
raid5: measuring checksumming speed
   8regs     :  1821.000 MB/sec
   8regs_prefetch:  1727.000 MB/sec
   32regs    :  1443.000 MB/sec
   32regs_prefetch:  1436.000 MB/sec
raid5: using function: 8regs (1821.000 MB/sec)
device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-devel@redhat.com
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
rtc-test rtc-test.0: setting the system clock to 2006-12-27 18:36:35 (1167244595)
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 192.168.178.70
IP-Config: Complete:
      device=eth0, addr=192.168.178.70, mask=255.255.255.0, gw=192.168.178.1,
     host=c3000, domain=box, nis-domain=(none),
     bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 368k freed
eth0: Setting full-duplex based on MII#1 link partner capability of 05e1.
Adding 263144k swap on /dev/sda1.  Priority:-1 extents:1 across:263144k
Adding 1953784k swap on /dev/sdb3.  Priority:-2 extents:1 across:1953784k
EXT3 FS on sda3, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sdb2, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda4, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sdb4, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
hald-probe-stor(1803): unaligned access to 0xfb23bd26 at ip=0x00013fc3
hald-probe-stor(1803): unaligned access to 0xfb23bd2a at ip=0x00013fc3
hald-probe-stor(1803): unaligned access to 0xfb23bd36 at ip=0x00013fc3
hald-probe-stor(1803): unaligned access to 0xfb23bd3a at ip=0x00013fc3
hald-probe-stor(1803): unaligned access to 0xfb23bd56 at ip=0x00013fc3
hald-probe-stor(1803): unaligned access to 0xfb23bd5a at ip=0x00013fc3
hald-probe-volu(1804): unaligned access to 0xfb011c26 at ip=0x00014be7
hald-probe-volu(1804): unaligned access to 0xfb011c2a at ip=0x00014be7

--Boundary-00=_BBskFHj9kJL8sAu
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_BBskFHj9kJL8sAu--
