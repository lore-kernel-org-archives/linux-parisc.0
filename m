From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Sun, 14 Nov 2010 18:42:14 -0500
Message-ID: <20101114234212.GA20422@hiauly1.hia.nrc.ca>
References: <20101104153507.GA7198@lackof.org> <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca> <20101110033527.GA24762@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AqsLC8rIMeq19msA"
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101110033527.GA24762@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 09 Nov 2010, John David Anglin wrote:

> On Sun, 07 Nov 2010, John David Anglin wrote:
> 
> > > In short, I'm skeptical this is a problem in lba_pci code.
> > > Much more likely to be a driver issue or possibly HW issue.
> > > I was pointing at the configs that booted on ion/ioz only to
> > > help rule out driver or HW issues. Feel free to use ion for
> > > testing this.
> > 
> > I agree.  I think the hpmc in the lba_pci code and the hpmc with
> > LBA debug messages enabled are likely related.  Do you have any idea
> > how the code could avoid shooting itself in the foot?
> > 
> > Do you think there is a SMP race in setting up the PCI bus.  I was
> > thinking of trying an identical UP build.  I believe that all processors
> > are enabled at the time the hpmc occurs.
> 
> UP kernels behaive differently.  Boot is hpmc'ing in handle_unaligned.
> The kernel dies in this block of code:
> 
> 00000000401218f4 <.L3^B18>:
>     401218f4:   e8 1f 11 35     b,l 40121194 <.L3^B2+0x20>,r0
>     401218f8:   db 85 0f e0     extrd,s ret0,63,32,r5
>     401218fc:   9f fc 20 10     cmpb,*= ret0,r31,4012190c <.L3^B18+0x18>
>     40121900:   36 7c 22 00     ldo 1100(r19),ret0
>     40121904:   bf fc 31 15     cmpb,*<> ret0,r31,40121194 <.L3^B2+0x20>
>     40121908:   34 05 3f ff     ldi -1,r5
>     4012190c:   34 16 00 00     ldi 0,r22
>     40121910:   50 d5 05 40     ldd 2a0(r6),r21
>     40121914:   50 df 05 30     ldd 298(r6),r31
>     40121918:   db 57 0b fb     extrd,u r26,63,5,r23
>     4012191c:   f2 75 00 7d     depd,z r21,60,3,r19
>     40121920:   00 1f 58 20     mtsp r31,sr1
>     40121924:   f2 a0 04 1d     depd r0,63,3,r21
> ->  40121928:   0e a0 50 d6     ldd 0(sr1,r21),r22
>     4012192c:   0e b0 50 d4     ldd 8(sr1,r21),r20
>     40121930:   96 73 00 80     subi 40,r19,r19
>     40121934:   01 73 18 40     mtsar r19
>     40121938:   d2 96 02 16     shrpd r22,r20,sar,r22
>     4012193c:   08 00 02 5c     copy r0,ret0
> 
> sr1 is 0 and r21 is 00000000c0000008, so I think we have an unaligned
> kernel load.  Not sure where it is coming from.

I've pretty much narrowed down where the unaligned load is.  It coming from
init_page_buffers.  I had to disable inlining of this function to simplify 
the code.

00000000401f9698 <init_page_buffers>:
    401f9698:   08 03 02 41     copy r3,r1
    401f969c:   08 1e 02 43     copy sp,r3
    401f96a0:   73 c1 00 88     std,ma r1,40(sp)
    401f96a4:   0f 40 10 dc     ldd 0(r26),ret0
    401f96a8:   c6 9c c0 e8     bb,>= ret0,14,401f9724 <init_page_buffers+0x8c>
    401f96ac:   db 5c 0b fd     extrd,u r26,63,3,ret0
    401f96b0:   bf 80 20 e8     cmpb,*<> r0,ret0,401f972c <init_page_buffers+0x94>
    401f96b4:   53 54 00 20     ldd 10(r26),r20
    401f96b8:   0f 40 10 dc     ldd 0(r26),ret0
    401f96bc:   db 9a 0b 9f     extrd,u ret0,60,1,r26
    401f96c0:   0b 40 28 a0     cmpclr,*= r0,r26,r0
    401f96c4:   08 14 02 53     copy r20,r19
->  401f96c8:   0e 60 10 dc     ldd 0(r19),ret0
    401f96cc:   c7 5c 40 72     bb,<,n ret0,1a,401f970c <init_page_buffers+0x74>

The problem seems to occur in accessing the page buffers for the page.
The above code has a BUG_ON checking the alignment of the page.  I then
added a BUG_ON to check the alignment of bh:

static __attribute__((__noinline__)) void
init_page_buffers(struct page *page, struct block_device *bdev,
                        sector_t block, int size)
{
	struct buffer_head *head = page_buffers(page);
	struct buffer_head *bh = head;
	int uptodate = PageUptodate(page);

	BUG_ON ((long)bh & 7);

However, with this BUG_ON the unaligned access doesn't occur...
The assembly code changes to:

00000000401f9698 <init_page_buffers>:
    401f9698:   08 03 02 41     copy r3,r1
    401f969c:   08 1e 02 43     copy sp,r3
    401f96a0:   73 c1 00 88     std,ma r1,40(sp)
    401f96a4:   0f 40 10 dc     ldd 0(r26),ret0
    401f96a8:   c6 9c c0 ea     bb,>=,n ret0,14,401f9724 <init_page_buffers+0x8c>
    401f96ac:   0f 40 10 dc     ldd 0(r26),ret0
    401f96b0:   db 94 0b 9f     extrd,u ret0,60,1,r20
    401f96b4:   9e 80 20 00     cmpb,*= r0,r20,401f96bc <init_page_buffers+0x24>
    401f96b8:   53 5a 00 20     ldd 10(r26),r26
    401f96bc:   db 5c 0b fd     extrd,u r26,63,3,ret0
    401f96c0:   bf 80 20 c8     cmpb,*<> r0,ret0,401f972c <init_page_buffers+0x94>
    401f96c4:   08 1a 02 53     copy r26,r19
    401f96c8:   0e 60 10 dc     ldd 0(r19),ret0
    401f96cc:   c7 5c 40 72     bb,<,n ret0,1a,401f970c <init_page_buffers+0x74>

There must be some kind of race in setting bh?  This is a UP build.
Any ideas.

I'm sure this came up before.  A different .config was used and the
problem disappeared.

However, the system didn't fully boot.  There was another unaligned
load in a ipv6 module.  I caught this because I still have the following
BUG_ON in unaligned.c:

dave@mx3210:~/linux/linux-2.6.36.y/arch/parisc/kernel$ git diff unaligned.c
diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index 92d977b..f13ed88 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -212,6 +212,8 @@ static int emulate_ldd(struct pt_regs *regs, int toreg, int 
 
	DPRINTF("load " RFMT ":" RFMT " to r%d for 8 bytes\n", 
		 regs->isr, regs->ior, toreg);
+       BUG_ON (regs->isr == 0);
+
#ifdef CONFIG_PA20
		   
#ifndef CONFIG_64BIT

Do we need to emulate ldd in the kernel?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hpmc4.txt"

Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.17 root@c3k Sun Mar  7 16:13:48 MST 2010
Skipping extended partition 6 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               1      31   f0 Palo
2              32     156   83 ext2
5             157    6832   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 6241289 bytes @ 0x48000

Command line for kernel: 'root=/dev/sda5 console=ttyS1 HOME=/ palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
Selected ramdisk: /initrd.img from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4550656 mediaptr 0x1000
Segment 1 load 005a39f0 size 399816 mediaptr 0x4589f0
Segment 2 load 00608000 size 184568 mediaptr 0x4bb000
Loading ramdisk 8307732 bytes @ 3f802000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.36+ (dave@mx3210) (gcc version 4.3.5 (GCC) ) #22 Sun Nov 14 16:17:49 EST 2010
unwind_init: start = 0x40493000, end = 0x404bb1d0, entries = 10269
WARNING: Out of order unwind entry! 00000000404940b0 and 00000000404940c0
WARNING: Out of order unwind entry! 00000000404940c0 and 00000000404940d0
WARNING: Out of order unwind entry! 0000000040494bf0 and 0000000040494c00
WARNING: Out of order unwind entry! 0000000040494c00 and 0000000040494c10
WARNING: Out of order unwind entry! 0000000040494eb0 and 0000000040494ec0
WARNING: Out of order unwind entry! 0000000040494ec0 and 0000000040494ed0
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00008870 00000491 00000000 00000002 3e0505e7352af711 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/800/rp3440  
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
 1) Start 0x0000000100000000 End 0x000000027fdfffff Size   6142 MB
 2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
Total Memory: 10238 MB
initrd: 7f802000-7ffee414
initrd: reserving 3f802000-3ffee414 (mem_max 27fe00000)
Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2585095
Kernel command line: root=/dev/sda5 console=ttyS1 HOME=/ palo_kernel=2/vmlinux
PID hash table entries: 4096 (order: 3, 32768 bytes)
Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Memory: 10281572k/10483712k available (2891k kernel code, 202140k reserved, 1504k data, 184k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
      .init : 0x0000000040608000 - 0x0000000040636000   ( 184 kB)
      .data : 0x00000000403d2ca0 - 0x000000004054aec0   (1504 kB)
      .text : 0x0000000040100000 - 0x00000000403d2ca0   (2891 kB)
Hierarchical RCU implementation.
	RCU-based detection of stalled CPUs is disabled.
	Verbose stalled-CPUs detection is disabled.
NR_IRQS:128
Console: colour dummy device 160x64
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
                    double unlock:failed|failed|failed|  ok  |failed|failed|
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
144 out of 218 testcases failed, as expected. |
----------------------------------------------------
Calibrating delay loop... 1597.44 BogoMIPS (lpj=3194880)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 256
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
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 129 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 152 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 153 failed with error 1
CPU(s): 1 x PA8800 (Mako) at 800.006800 MHz
Setting cache flush threshold to 134c480 (1 CPUs online)
SBA found Pluto 2.3 at 0xfffffffffed00000
Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
LBA: Truncating lmmio_space [fffffffff0000000/fffffffffecffffe] to [fffffffff0000000,fffffffffe77ffff]
powersw: Soft power switch support not available.
bio: create slab <bio-0> at 0
vgaarb: device added: PCI:0000:e0:02.0,decodes=io+mem,owns=io+mem,locks=none
vgaarb: loaded
Switching to clocksource cr16
NET: Registered protocol family 2
IP route cache hash table entries: 524288 (order: 10, 4194304 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
UDP hash table entries: 8192 (order: 6, 262144 bytes)
UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)
NET: Registered protocol family 1
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 8113k freed
Performance monitoring counters enabled for Storm Peak Slow
Initializing RT-Tester: OK
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
msgmni has been set to 20097
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Linux agpgart interface v0.103
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 72) is a 16450
0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 72) is a 16550A
console [ttyS1] enabled, bootconsole disabled
console [ttyS1] enabled, bootconsole disabled
0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 72) is a 16550A
0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 72) is a 16550A
brd: module loaded
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
mice: PS/2 mouse device common for all mice
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
TCP cubic registered
rtc-generic rtc-generic: setting system clock to 2010-11-14 21:32:16 UTC (1289770336)
Freeing unused kernel memory: 184k freed
Loading, please wait...
mount: mounting none on /dev failed: No such device
W: devtmpfs not available, falling back to tmpfs for /dev
SCSI subsystem initialized
sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 69
sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
scsi 0:0:0:0: Direct-Access     FUJITSU  MAJ3364MC        HP12 PQ: 0 ANSI: 2
scsi target0:0:0: tagged command queuing enabled, command queue depth 16.
scsi target0:0:0: Beginning Domain Validation
scsi target0:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
scsi target0:0:0: Ending Domain Validation
sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 70
sym1: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.3
tg3.c:v3.113 (August 2, 2010)
sd 0:0:0:0: [sda] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
 sda: sda1 sda2 sda3 < sda5 sda6 sda7 >
sd 0:0:0:0: [sda] Attached SCSI disk
tg3 0000:20:02.0: eth0: Tigon3 [partno(BCM95700A6) rev 0105] (PCI:66MHz:64-bit) MAC address 00:30:6e:4b:16:4d
tg3 0000:20:02.0: eth0: attached PHY is 5701 (10/100/1000Base-T Ethernet) (WireSpeed[1])
tg3 0000:20:02.0: eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[0]
tg3 0000:20:02.0: eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... done.
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda5): mounted filesystem with writeback data mode
Begin: Running /scripts/local-bottom ... done.
done.
Begin: Running /scripts/init-bottom ... done.
INIT: version 2.88 booting
Using makefile-style concurrent boot in runlevel S.
Starting the hotplug events dispatcher: udevdudev[955]: starting version 163
.
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...done.
Activating swap...Adding 979928k swap on /dev/sda6.  Priority:-1 extents:1 across:979928k 
done.
Checking root file system...fsck from util-linux-ng 2.17.2
/dev/sda5: clean, 46558/427392 files, 450409/1708906 blocks (check in 5 mounts)
done.
EXT3-fs (sda5): using internal journal
loop: module loaded
Cleaning up ifupdown....
Loading kernel modules...done.
Setting up networking....
Activating lvm and md swap...done.
Checking file systems...fsck from util-linux-ng 2.17.2
/dev/sda2: clean, 35/64256 files, 93165/128520 blocks
/dev/sda7: clean, 347218/1725136 files, 2210779/6895893 blocks (check in 3 mounts)
done.
Mounting local filesystems...EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda7): using internal journal
EXT3-fs (sda7): mounted filesystem with writeback data mode
done.
Activating swapfile swap...done.
Cleaning up temporary files....
Setting kernel variables ...done.
Configuring network interfaces...done.
Starting portmap daemon....
Starting NFS common utilities: statdtg3 0000:20:02.0: eth0: Link is up at 100 Mbps, full duplex
tg3 0000:20:02.0: eth0: Flow control is off for TX and off for RX
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
.
Cleaning up temporary files....
Setting console screen modes and fonts.
cannot (un)set powersave mode
Running scripts in rcS.d/ took 19 seconds.
INIT: Entering runlevel: 2
Using makefile-style concurrent boot in runlevel 2.
Starting portmap daemon...Already running..
Starting NFS common utilities: statd.
Starting enhanced syslogd: rsyslogd.
Starting deferred execution scheduler: atd.
Starting system message bus: dbus.
Starting periodic command scheduler: cron.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
svc: failed to register lockdv1 RPC service (errno 225).
Starting internet superserver: inetd.
Exporting directories for NFS kernel daemon....
Starting NFS kernel daemon: nfsd mountd.
SpamAssassin Mail Filter Daemon: disabled, see /etc/default/spamassassin
------------[ cut here ]------------
kernel BUG at arch/parisc/kernel/unaligned.c:215!

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000000000001111 Not tainted
r00-03  000000000804000f 000000007ef35920 0000000040119780 000000007ef35c70
r04-07  000000001c533000 000000007ef355e0 000000007ef355e0 000000007ef35434
r08-11  000000007ef3542c 000000007d216cf8 000000007cfe13a8 00000000000000e8
r12-15  000000007cfe12c0 0000000000000000 0000000000000001 00000000b41aa62a
r16-19  000000007ef355e0 000000004059faa0 000000007f88e048 000000000c000000
r20-23  0000000024000000 000000007ef3542c 0000000000000000 0000000000000006
r24-27  000000007ef3541c 0000000000000001 000000000f3010f3 00000000405e9db0
r28-31  0000000000000000 000000007ef35c40 000000007ef35e90 000000000c0010c0
sr00-03  000000000000d800 000000000000d800 0000000000000000 000000000000d800
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401219b8 00000000401219bc
 IIR: 03ffe01f    ISR: 0000000000000000  IOR: 0000000000000000
 CPU:        0   CR30: 000000007ef34000 CR31: 886904b488140042
 ORIG_R28: 0000000000000000
 IAOQ[0]: .L320+0x3c/0x70
 IAOQ[1]: .L320+0x40/0x70
 RP(r2): handle_interruption+0x2a8/0x940
Backtrace:
 [<0000000040119780>] handle_interruption+0x2a8/0x940
 [<000000001c57b460>] __tcp_v6_send_check+0xf0/0x1e8 [ipv6]
 [<000000001c57cd10>] tcp_v6_send_response+0x238/0x368 [ipv6]
 [<000000001c57cebc>] tcp_v6_send_reset+0x7c/0x218 [ipv6]
 [<000000001c57e4b8>] tcp_v6_rcv+0x3e8/0x980 [ipv6]
 [<000000001c54b0d0>] ip6_input_finish+0x188/0x438 [ipv6]
 [<000000001c54b40c>] ip6_input+0x8c/0x148 [ipv6]
 [<000000001c54bc78>] ipv6_rcv+0x3a8/0x480 [ipv6]
 [<0000000040342454>] __netif_receive_skb+0x3dc/0x4a0
 [<00000000403425c4>] process_backlog+0xac/0x188
 [<0000000040342a70>] net_rx_action+0x178/0x228
 [<000000004014d698>] __do_softirq+0x100/0x1f0
 [<0000000040115a1c>] do_softirq+0x6c/0x70
 [<000000004014db08>] local_bh_enable+0xc0/0xc8
 [<00000000403442c8>] dev_queue_xmit+0x138/0x458
 [<000000004034fc14>] neigh_resolve_output+0x154/0x310

Backtrace:
 [<0000000040118ba8>] show_stack+0x20/0x38
 [<00000000401120ac>] dump_stack+0x24/0x38
 [<00000000401193c4>] die_if_kernel+0x15c/0x270
 [<0000000040119d84>] handle_interruption+0x8ac/0x940
 [<00000000401219b8>] .L320+0x3c/0x70
 [<0000000040119780>] handle_interruption+0x2a8/0x940
 [<000000001c57b460>] __tcp_v6_send_check+0xf0/0x1e8 [ipv6]
 [<000000001c57cd10>] tcp_v6_send_response+0x238/0x368 [ipv6]
 [<000000001c57cebc>] tcp_v6_send_reset+0x7c/0x218 [ipv6]
 [<000000001c57e4b8>] tcp_v6_rcv+0x3e8/0x980 [ipv6]
 [<000000001c54b0d0>] ip6_input_finish+0x188/0x438 [ipv6]
 [<000000001c54b40c>] ip6_input+0x8c/0x148 [ipv6]
 [<000000001c54bc78>] ipv6_rcv+0x3a8/0x480 [ipv6]
 [<0000000040342454>] __netif_receive_skb+0x3dc/0x4a0
 [<00000000403425c4>] process_backlog+0xac/0x188
 [<0000000040342a70>] net_rx_action+0x178/0x228

Kernel panic - not syncing: Fatal exception in interrupt
Backtrace:
 [<0000000040118ba8>] show_stack+0x20/0x38
 [<00000000401120ac>] dump_stack+0x24/0x38
 [<000000004011219c>] panic+0xdc/0x380
 [<00000000401194ac>] die_if_kernel+0x244/0x270
 [<0000000040119d84>] handle_interruption+0x8ac/0x940
 [<00000000401219b8>] .L320+0x3c/0x70
 [<0000000040119780>] handle_interruption+0x2a8/0x940
 [<000000001c57b460>] __tcp_v6_send_check+0xf0/0x1e8 [ipv6]
 [<000000001c57cd10>] tcp_v6_send_response+0x238/0x368 [ipv6]
 [<000000001c57cebc>] tcp_v6_send_reset+0x7c/0x218 [ipv6]
 [<000000001c57e4b8>] tcp_v6_rcv+0x3e8/0x980 [ipv6]
 [<000000001c54b0d0>] ip6_input_finish+0x188/0x438 [ipv6]
 [<000000001c54b40c>] ip6_input+0x8c/0x148 [ipv6]
 [<000000001c54bc78>] ipv6_rcv+0x3a8/0x480 [ipv6]
 [<0000000040342454>] __netif_receive_skb+0x3dc/0x4a0
 [<00000000403425c4>] process_backlog+0xac/0x188


--AqsLC8rIMeq19msA--
