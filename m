From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: Hacking SuperDome
Date: Sat, 7 Feb 2009 15:29:06 +0100
Message-ID: <20090207142906.GA8553@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

thanks to Madze, I've now access to a HP Superdome;-)

I found the first show stopper, which prevents the kernel from
even throwing out the first messages. The narrow firmware detection
hangs. With the quick hack below I'm now able to boot a UP kernel
(SMP hangs when calling init_per_cpu(smp_processor_id()); in setup.c).

The bigger partition produces following boot log:

HARD Booted.
palo ipl 1.14 root@duet Sat Apr  8 16:08:16 EDT 2006

Boot image contains:
    0/vmlinux64 6484269 bytes @ 0xa000

Information: No console specified on kernel command line. This is
normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'HOME=/ ip=dhcp console=ttyS0 TERM=vt102
palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing
64-bit kernelELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4456448 mediaptr 0x1000
Segment 1 load 00588000 size 399072 mediaptr 0x441000
Segment 2 load 005ec000 size 266374 mediaptr 0x4a3000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.29-rc3-00000-g33bfad5-dirty (tsbogend@login) (gcc
version 4.2.1) #23 Sat Feb 7 15:16:57 CET 2009
unwind_init: start = 0x404788c0, end = 0x404a53c0, entries = 11440
WARNING: Out of order unwind entry! 000000004047a400 and
000000004047a410
WARNING: Out of order unwind entry! 000000004047a410 and
000000004047a420
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005e70 00000491 00000000 00000002 3e0f97abec371bc2 00000000
00000008 000000b2 000000b2
vers  00000202
CPUID vers 19 rev 1 (0x00000261)
capabilities 0x3d
model 9000/800/SD32000
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000007ffffffff Size  32768 MB
 1) Start 0x0000000800000000 End 0x00000009ffffffff Size   8192 MB
 2) Start 0x0000000a00000000 End 0x0000000bffffffff Size   8192 MB
 3) Start 0x0000000c00000000 End 0x0000000df7ffffff Size   8064 MB
Total Memory: 57216 MB
Built 4 zonelists in Zone order, mobility grouping on.  Total pages:
14447040
Kernel command line: HOME=/ ip=dhcp console=ttyS0 TERM=vt102
palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 32768 bytes)
Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes)
Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes)
Memory: 57567696k/58589184k available (2869k kernel code, 1019520k
reserved, 1434k data, 264k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000000e38000000   (57216 MB)
      .init : 0x00000000405ec000 - 0x000000004062e000   ( 264 kB)
      .data : 0x00000000403cd650 - 0x0000000040534000   (1434 kB)
      .text : 0x0000000040100000 - 0x00000000403cd650   (2869 kB)
Calibrating delay loop... 1495.04 BogoMIPS (lpj=2990080)
Security Framework initialized
Mount-cache hash table entries: 256
net_namespace: 544 bytes
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Two devices have hardware path [255].  IODC data for second device:
00404e0000abRearranging GSC cards sometimes helps
Two devices have hardware path [255].  IODC data for second device:
00404e0000abRearranging GSC cards sometimes helps
Found devices:
1. Caribe DNA Central Agent at 0xfffffffffc000000 [255] { 14, 0x0,
0x007, 0x000aa }
2. Caribe W2 800 at 0xfffffffffc078000 [10] { 0, 0x0, 0x5e7, 0x00004 }
3. Caribe W2 800 at 0xfffffffffc07a000 [11] { 0, 0x0, 0x5e7, 0x00004 }
4. Caribe W2 800 at 0xfffffffffc07c000 [12] { 0, 0x0, 0x5e7, 0x00004 }
5. Caribe W2 800 at 0xfffffffffc07e000 [13] { 0, 0x0, 0x5e7, 0x00004 }
6. Memory at 0xfffffffffc005000 [5] { 1, 0x0, 0x0a8, 0x00009 }
7. REO I/O BC Merced Port at 0xfffffff808000000 [0] { 7, 0x0, 0x804,
0x0000c }
8. Elroy PCI Bridge at 0xfffffff804000000 [0/0] { 13, 0x0, 0x782,
0x0000a }
9. Elroy PCI Bridge at 0xfffffff804002000 [0/1] { 13, 0x0, 0x782,
0x0000a }
10. Elroy PCI Bridge at 0xfffffff804004000 [0/2] { 13, 0x0, 0x782,
0x0000a }
11. Elroy PCI Bridge at 0xfffffff804006000 [0/3] { 13, 0x0, 0x782,
0x0000a }
12. Elroy PCI Bridge at 0xfffffff804008000 [0/4] { 13, 0x0, 0x782,
0x0000a }
13. Elroy PCI Bridge at 0xfffffff80400c000 [0/6] { 13, 0x0, 0x782,
0x0000a }
14. Elroy PCI Bridge at 0xfffffff804010000 [0/8] { 13, 0x0, 0x782,
0x0000a }
15. Elroy PCI Bridge at 0xfffffff804012000 [0/9] { 13, 0x0, 0x782,
0x0000a }
16. Elroy PCI Bridge at 0xfffffff804014000 [0/10] { 13, 0x0, 0x782,
0x0000a }
17. Elroy PCI Bridge at 0xfffffff804016000 [0/11] { 13, 0x0, 0x782,
0x0000a }
18. Elroy PCI Bridge at 0xfffffff804018000 [0/12] { 13, 0x0, 0x782,
0x0000a }
19. Elroy PCI Bridge at 0xfffffff80401c000 [0/14] { 13, 0x0, 0x782,
0x0000a }
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 11 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 12 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 13 failed with error 1
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Setting cache flush threshold to 180000 (1 CPUs online)
SBA found REO rev 2 at 0xfffffff808000000
Elroy version TR4.0 (0x5) found at 0xfffffff804000000
Elroy version TR4.0 (0x5) found at 0xfffffff804002000
Elroy version TR4.0 (0x5) found at 0xfffffff804004000
Elroy version TR4.0 (0x5) found at 0xfffffff804006000
Elroy version TR4.0 (0x5) found at 0xfffffff804008000
Elroy version TR4.0 (0x5) found at 0xfffffff80400c000
Elroy version TR4.0 (0x5) found at 0xfffffff804010000
Elroy version TR4.0 (0x5) found at 0xfffffff804012000
Elroy version TR4.0 (0x5) found at 0xfffffff804014000
Elroy version TR4.0 (0x5) found at 0xfffffff804016000
Elroy version TR4.0 (0x5) found at 0xfffffff804018000
Elroy version TR4.0 (0x5) found at 0xfffffff80401c000
powersw: Soft power switch support not available.
bio: create slab <bio-0> at 0
SCSI subsystem initialized
NET: Registered protocol family 2
IP route cache hash table entries: 524288 (order: 10, 4194304 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
NET: Registered protocol family 1
Chassis warnings not supported.
Performance monitoring counters enabled for Caribe W2 800
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
msgmni has been set to 32768
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
serial 0000:00:00.0: enabling device (0146 -> 0147)
0000:00:00.0: ttyS0 at MMIO 0xfffffff000000000 (irq = 65) is a 16550A
console handover: boot [ttyB0] -> real [ttyS0]
0000:00:00.0: ttyS1 at MMIO 0xfffffff000000008 (irq = 65) is a 16550A
0000:00:00.0: ttyS2 at MMIO 0xfffffff000000010 (irq = 65) is a 16550A
brd: module loaded
loop: module loaded
Linux Tulip driver version 1.1.15 (Feb 27, 2007)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/43 Tulip rev 65 at Port 0x80, 00:30:6e:0e:b2:5f,
IRQ 65.
sym53c8xx 0000:18:00.0: enabling device (0146 -> 0147)
sym0: <895> rev 0x2 at pci 0000:18:00.0 irq 67
sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
scsi 0:0:0:0: ABORT operation started
scsi 0:0:0:0: ABORT operation timed-out.
scsi 0:0:0:0: DEVICE RESET operation started

After that it hangs...

The smaller partion hangs even earlier:

HARD Booted.
palo ipl 1.14 root@duet Sat Apr  8 16:08:16 EDT 2006

Boot image contains:
    0/vmlinux64 6484269 bytes @ 0xa000

Information: No console specified on kernel command line. This is
normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'HOME=/ ip=dhcp console=ttyS0 TERM=vt102
palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing
64-bit kernelELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4456448 mediaptr 0x1000
Segment 1 load 00588000 size 399072 mediaptr 0x441000
Segment 2 load 005ec000 size 266374 mediaptr 0x4a3000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.29-rc3-00000-g33bfad5-dirty (tsbogend@login) (gcc
version 4.2.1) #23 Sat Feb 7 15:16:57 CET 2009
unwind_init: start = 0x404788c0, end = 0x404a53c0, entries = 11440
WARNING: Out of order unwind entry! 000000004047a400 and
000000004047a410
WARNING: Out of order unwind entry! 000000004047a410 and
000000004047a420
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005e70 00000491 00000000 00000002 3e0f97abec371bc2 00000000
00000008 000000b2 000000b2
vers  00000202
CPUID vers 19 rev 1 (0x00000261)
capabilities 0x3d
model 9000/800/SD32000
parisc_cache_init: Only equivalent aliasing supported!
Total Memory: 8184 MB
Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
2066460
Kernel command line: HOME=/ ip=dhcp console=ttyS0 TERM=vt102
palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 32768 bytes)
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
Memory: 8231168k/8380416k available (2869k kernel code, 148692k
reserved, 1434k data, 264k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x000000023f800000   (8184 MB)
      .init : 0x00000000405ec000 - 0x000000004062e000   ( 264 kB)
      .data : 0x00000000403cd650 - 0x0000000040534000   (1434 kB)
      .text : 0x0000000040100000 - 0x00000000403cd650   (2869 kB)
Calibrating delay loop... 1495.04 BogoMIPS (lpj=2990080)
Security Framework initialized
Mount-cache hash table entries: 256
net_namespace: 544 bytes
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Two devices have hardware path [255].  IODC data for second device:
00404e0000abRearranging GSC cards sometimes helps
Two devices have hardware path [255].  IODC data for second device:
00404e0000abRearranging GSC cards sometimes helps
Found devices:
1. Caribe DNA Central Agent at 0xfffffffffc400000 [255] { 14, 0x0,
0x007, 0x000aa }
2. Caribe W2 800 at 0xfffffffffc47a000 [11] { 0, 0x0, 0x5e7, 0x00004 }
3. Caribe W2 800 at 0xfffffffffc47c000 [12] { 0, 0x0, 0x5e7, 0x00004 }
4. Caribe W2 800 at 0xfffffffffc47e000 [13] { 0, 0x0, 0x5e7, 0x00004 }
5. Memory at 0xfffffffffc405000 [5] { 1, 0x0, 0x0a8, 0x00009 }
6. REO I/O BC Merced Port at 0xfffffff888000000 [0] { 7, 0x0, 0x804,
0x0000c }
7. Elroy PCI Bridge at 0xfffffff884000000 [0/0] { 13, 0x0, 0x782,
0x0000a }
8. Elroy PCI Bridge at 0xfffffff884002000 [0/1] { 13, 0x0, 0x782,
0x0000a }
9. Elroy PCI Bridge at 0xfffffff884004000 [0/2] { 13, 0x0, 0x782,
0x0000a }
10. Elroy PCI Bridge at 0xfffffff884006000 [0/3] { 13, 0x0, 0x782,
0x0000a }
11. Elroy PCI Bridge at 0xfffffff884008000 [0/4] { 13, 0x0, 0x782,
0x0000a }
12. Elroy PCI Bridge at 0xfffffff88400c000 [0/6] { 13, 0x0, 0x782,
0x0000a }
13. Elroy PCI Bridge at 0xfffffff884010000 [0/8] { 13, 0x0, 0x782,
0x0000a }
14. Elroy PCI Bridge at 0xfffffff884012000 [0/9] { 13, 0x0, 0x782,
0x0000a }
15. Elroy PCI Bridge at 0xfffffff884014000 [0/10] { 13, 0x0, 0x782,
0x0000a }
16. Elroy PCI Bridge at 0xfffffff884016000 [0/11] { 13, 0x0, 0x782,
0x0000a }
17. Elroy PCI Bridge at 0xfffffff884018000 [0/12] { 13, 0x0, 0x782,
0x0000a }
18. Elroy PCI Bridge at 0xfffffff88401c000 [0/14] { 13, 0x0, 0x782,
0x0000a }
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 12 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 13 failed with error 1
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Setting cache flush threshold to 180000 (1 CPUs online)
SBA found REO rev 2 at 0xfffffff888000000
Elroy version TR4.0 (0x5) found at 0xfffffff884000000


First guess would be some PCI setup issues... Any hints ?


BTW. I've tried with __PAGE_OFFSET=0x10000000 and __PAGE_OFFSET=0x40000000
and it doesn't make difference. The boot logs are from a kernel with
only the following hack:

diff --git a/arch/parisc/kernel/firmware.c
b/arch/parisc/kernel/firmware.c
index 03f26bd..a3fb7ef 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -153,12 +153,14 @@ static void convert_to_wide(unsigned long *addr)
 #ifdef CONFIG_64BIT
 void __init set_firmware_width_unlocked(void)
 {
+#if 0
        int ret;

        ret = mem_pdc_call(PDC_MODEL, PDC_MODEL_CAPABILITIES,
                __pa(pdc_result), 0);
        convert_to_wide(pdc_result);
        if (pdc_result[0] != NARROW_FIRMWARE)
+#endif
                parisc_narrow_firmware = 0;
 }

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
