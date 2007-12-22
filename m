From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Fri, 21 Dec 2007 23:02:36 -0500 (EST)
Message-ID: <200712220402.lBM42boT022861@hiauly1.hia.nrc.ca>
References: <20071218052112.GB16467@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@hera.kernel.org, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071218052112.GB16467@fattire.cabal.ca> from "Kyle McMartin" at Dec 18, 2007 00:21:12 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Mon, Dec 17, 2007 at 11:20:15PM -0500, John David Anglin wrote:
> > > you need -rc5, iirc i put some changes i nthere too.

Tried -rc6.  It also crashed on boot.  Console log is below.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.14 root@duet Sat Apr  8 16:08:16 EDT 2006

Partition Start(MB) End(MB) Id Type
1               1     191   f0 Palo
2             192    1526   82 swap
3            1527   34732   83 ext2

PALO(F0) partition contains:
PALO is formatted EXT2/3
Command line for kernel: ' root=/dev/sda3 console=ttyS0 palo_kernel=1/vmlinux'
Selected kernel: /vmlinux from partition 1
Selected ramdisk: /initrd.img from partition 1
ELF64 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 5013504 mediaptr 0x1000
Segment 1 load 00608000 size 566144 mediaptr 0x4c9000
Loading ramdisk 3388537 bytes @ 3fcb3000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.24-rc6 (dave@gsyprf11) (gcc version 4.2.3 20071123 (prerelease) (Debian 4.2.2-4)) #1 SMP Fri Dec 21 19:07:38 PST 2007
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005e30 00000491 00000000 00000001 312b7146 100000f0 00000008 000000b2 000000b2
vers  00000203
CPUID vers 19 rev 8 (0x00000268)
capabilities 0x5
model 9000/800/A500-7X
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 MB
 1) Start 0x0000000100000000 End 0x00000001ffffffff Size   4096 MB
 2) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 MB
Total Memory: 8192 MB
initrd: 7fcb3000-7ffee479
initrd: reserving 3fcb3000-3ffee479 (mem_max 200000000)
SMP: bootstrap CPU ID is 0
Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2068480
Kernel command line:  root=/dev/sda3 console=ttyS0 palo_kernel=1/vmlinux
PID hash table entries: 4096 (order: 12, 32768 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
Memory: 8234192k/8388608k available (3309k kernel code, 152804k reserved, 1538k data, 188k init)
virtual kernel memory layout:
  vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
  memory  : 0x0000000040000000 - 0x0000001140000000   (69632 MB)
  .init : 0x0000000040664000 - 0x0000000040693000   ( 188 kB)
  .data : 0x000000004043b568 - 0x00000000405bc000   (1538 kB)
  .text : 0x0000000040100000 - 0x000000004043b568   (3309 kB)
Mount-cache hash table entries: 256
Brought up 1 CPUs
net_namespace: 120 bytes
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Crescendo 750 W2 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5e3, 0x00004 }
2. Crescendo 750 W2 at 0xfffffffffffa2000 [162] { 0, 0x0, 0x5e3, 0x00004 }
3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
7. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
8. Elroy PCI Bridge at
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************

********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         FLASH     ON         ON
LED State: System Running.  Unexpected Reboot.  Non-critical Error Detected.
Check Chassis and Console Logs for error messages.

processor                 system panic               1B00

***** EARLY BOOT VFP : SYSTEM ALERT *****
SYSTEM NAME: gsyprf11c
DATE: 12/22/2007 TIME: 03:45:54
ALERT LEVEL: 12 = Software failure

REASON FOR ALERT
SOURCE: 1 = processor
SOURCE DETAIL: 1 = processor general   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         FLASH     ON         ON
LED State: System Running.  Unexpected Reboot.  Non-critical Error Detected.
Check Chassis and Console Logs for error messages.

0xA0E000C01100B009 00000000 00000520 - type 20 = major change in system state
0x58E008C01100B009 00006B0B 16032D36 - type 11 = Timestamp 12/22/2007 03:45:54
A/a: ack read of this entry - Q/q: quit Virtual Front Panel Display
Anything else redisplay the log entry
->Choice:Timeout!
*****************************************

***** EARLY BOOT VFP : SYSTEM ALERT *****
SYSTEM NAME: gsyprf11c
DATE: 12/22/2007 TIME: 03:45:55
ALERT LEVEL: 12 = Software failure

REASON FOR ALERT
SOURCE: 1 = processor
SOURCE DETAIL: 1 = processor general   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         FLASH     ON         ON
							 LED State: System Running.  Unexpected Reboot.  Non-critical Error Detected.
Check Chassis and Console Logs for error messages.

0xA0E000C01100B009 00000000 00000520 - type 20 = major change in system state
0x58E008C01100B009 00006B0B 16032D37 - type 11 = Timestamp 12/22/2007 03:45:55
A/a: ack read of this entry - Q/q: quit Virtual Front Panel Display
Anything else redisplay the log entry

