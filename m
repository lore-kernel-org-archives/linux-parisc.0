From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG maxcpus=1 still sees 2 CPUs
Date: Sat, 4 Dec 2004 23:41:12 -0700
Message-ID: <20041205064112.GA10169@colo.lackof.org>
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

Hello,
It's late and I won't have a chance to chase this bug I just noticed
when trying to boot 2.6.10-rc3-pa1 (64bit, SMP) kernel on a500.

I set "maxcpus=1" and still get the following output:
CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
Setting cache flush threshold to 231180 (1 CPUs online)

I'm thinking that while two CPUs are present, only
one is "online", it doesn't feel right to report both
in the first line above. Is this expected behavior
or should we be indicating something like
	CPU(s): 1 (of 2) x PA8500 (PCX-W) at 440.000000 MHz


Other issues:
o the box is hanging after sym2 resets the SCSI bus.
  My first guess is something is wrong with interrupt delivery.

o omitting "maxcpus=1", the box will hang for about 60 seconds
  after printing the inventory. And then prints:
	Releasing cpu 1 now, hpa=fffffffffffa2000
  and continues on to the SCSI bus resets.

I have tried both gcc 3.0.4 and 3.3.4 (hppa64 versions) with the
same results (AFAICT).

hth,
grant


Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 00306e-0c7a5e
System IP Address 192.168.0.112
Server IP Address 192.168.0.61

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004

Boot image contains:
    0/vmlinux64 7209624 bytes @ 0xa000

Command line for kernel: 'HOME=/ root=/dev/nfs nfsroot=192.168.0.61:/home/tftpboot/idiot ip=dhcp console=ttyS0 maxcpus=1 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 64-bit kernelELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 5237888 mediaptr 0x1000
Segment 1 load 00600000 size 362288 mediaptr 0x500000
Segment 2 load 0065c000 size 421608 mediaptr 0x559000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.10-rc3-pa1 (grundler@gsyprf11.external.hp.com) (gcc version 3.3.4 (Debian 1:3.3.4-13)) #97 SMP Sat Dec 4 22:07:50 PST 2004
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005cb0 00000491 00000000 00000001 5e2962dc 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 17 rev 11 (0x0000022b)
capabilities 0x1
model 9000/800/A500-44
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 Mb
 1) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 Mb
Total Memory: 4096 Mb
SMP: bootstrap CPU ID is 0
Built 2 zonelists
Kernel command line: HOME=/ root=/dev/nfs nfsroot=192.168.0.61:/home/tftpboot/idiot ip=dhcp console=ttyS0 maxcpus=1 palo_kernel=0/vmlinux
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
1. Crescendo 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5cb, 0x00004 }
2. Crescendo 440 at 0xfffffffffffa2000 [162] { 0, 0x0, 0x5cb, 0x00004 }
3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
7. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
8. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
Setting cache flush threshold to 231180 (1 CPUs online)
SBA found Astro 2.1 at 0xfffffffffed00000
LBA version TR4.0 (0x5) found at 0xfffffffffed30000
LBA version TR4.0 (0x5) found at 0xfffffffffed34000
LBA version TR4.0 (0x5) found at 0xfffffffffed38000
LBA version TR4.0 (0x5) found at 0xfffffffffed3c000
SCSI subsystem initialized
unwind_init: start = 0x104bf300, end = 0x104e7300, entries = 10240
Performance monitoring counters enabled for Crescendo 440
Initializing Cryptographic API
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfffffffff8000000 (irq = 132) is a 16550A
ttyS1 at MMIO 0xfffffffff8000008 (irq = 132) is a 16550A
ttyS2 at MMIO 0xfffffffff8000010 (irq = 132) is a 16550A
ttyS3 at MMIO 0xfffffffff8007000 (irq = 133) is a 16550A
ttyS4 at MMIO 0xfffffffff8007008 (irq = 133) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
e100: Intel(R) PRO/100 Network Driver, 3.2.3-k2-NAPI
e100: Copyright(c) 1999-2004 Intel Corporation
acenic.c: v0.92 08/05/2002  Jes Sorensen, linux-acenic@SunSITE.dk
                            http://home.cern.ch/~jes/gige/acenic.html
0000:20:00.0: Alteon AceNIC Gigabit Ethernet at 0xfffffffffa000000, irq 256
  Tigon II (Rev. 6), Firmware: 12.4.11, MAC: 00:30:6e:0f:3a:75
  PCI bus width: 64 bits, speed: 66MHz, latency: 128 clks
0000:20:00.0: Firmware up and running
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth1: Digital DS21143 Tulip rev 65 at fffffffff8020000, 00:30:6E:0C:7A:5E, IRQ 128.
sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 129
sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18m
elevator: using anticipatory as default io scheduler
sym0:0: No MSG OUT phase after selection with ATN.
eth0: Optical link UP (Full Duplex, Flow Control: )
sym0:0:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:0:0: DEVICE RESET operation started.
sym0:0:0: DEVICE RESET operation timed-out.
sym0:0:0: BUS RESET operation started.
sym0: SCSI BUS reset detected.
sym0: SCSI BUS has been reset.
sym0:0:0: BUS RESET operation complete.
sym0:0: No MSG OUT phase after selection with ATN.
sym0:0:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:0:0: HOST RESET operation started.
sym0: SCSI BUS has been reset.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
