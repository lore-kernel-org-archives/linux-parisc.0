Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta05.chello.at (viemta05.chello.at [195.34.133.55])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6304C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 16:35:44 -0600 (MDT)
Received: from dot.at ([62.178.92.247]) by viemta05.chello.at
          (InterMail vK.4.03.02.00 201-232-124 license 6aea1bd1f01aef5a9a73363c16ebee43)
          with ESMTP id <20010402223539.HLCA24343.viemta05@dot.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Tue, 3 Apr 2001 00:35:39 +0200
Sender: chris@dsl2.external.hp.com
Message-ID: <3AC8FEBC.1B7F8188@dot.at>
Date: Tue, 03 Apr 2001 00:35:40 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New Kernel & SCSI problem on 720
List-ID: <linux-parisc.vger.kernel.org>

Hi PARISC/Linux hackers !

Now I built up a new C-x-tool-chain and a new kernel, and *now*
I have problems with SCSI on the 720. I had not before a kernel
about a month ago. The only problem I had in those days was
a defect floppy-scsi i/f card. 

For faster boot, all disks are disconnected. The older kernels 
never had a problem, now I have one...

Log output below.

Independent of theSCSI problem, I cannot start `init'. 
Where does this breakpoint come from ?

With friendly regards

	Christoph Plattner



Hard booted.
palo ipl root@didymos.pladom1.at Tue Apr  3 00:25:26 CEST 2001
0/vmlinux 2491775 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=vt100 root=/dev/nfs console=ttyS0'
Kernel: partition 0 file /vmlinux
ELF32 executable
Entry 00100170 first 00100000 n 5
Segment 0 load 00100000 size 1351880 mediaptr 0x1000
Segment 1 load 0024c000 size 175952 mediaptr 0x14c000
Segment 2 load 00278000 size 230488 mediaptr 0x177000
Segment 3 load 002b4000 size 8192 mediaptr 0x1b0000
Segment 4 load 002de188 size 69024 mediaptr 0x1b2188
branching to kernel entry point 0x00100170
PDC Console Initialized
Linux version 2.4.0 (root@didymos.pladom1.at) (gcc version 3.0 20010315
(prerelease)) #2 Tue Apr 3 00:28:20 CEST 2001
FP[0] enabled: Rev 3 Model 0
The 32-bit Kernel has started...
Determining PDC firmware type: Older Legacy Box
setup_cmdline(0x64cc4,0x64cc4,0x0,0x0)
PALO command line: 'HOME=/ TERM=vt100 root=/dev/nfs console=ttyS0'
PALO initrd 0-0
model   00002000 00000481 00000000 00000000 0234072e 000011f4 00000004
0000000d 00000000
vers    00000003
CPUID   vers 0 rev 0
model   9000/720
Total Memory: 64 Mb
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf8000000, versions 0x4, 0x0, 0x77, 0x0,
0x0
2. Cobra Core BA (11) at 0xf082f000, versions 0x4, 0x0, 0x70, 0x0, 0x0
3. Cobra Core SCSI (10) at 0xf0825000, versions 0x4, 0x0, 0x71, 0x0, 0x0
4. Cobra Core LAN (802.3) (10) at 0xf0826000, versions 0x4, 0x0, 0x72,
0x0, 0x0
5. Cobra Core HIL (10) at 0xf0821000, versions 0x4, 0x0, 0x73, 0x0, 0x0
6. Cobra Core RS-232 (10) at 0xf0823000, versions 0x4, 0x0, 0x75, 0x0,
0x0
7. Cobra Core RS-232 (10) at 0xf0822000, versions 0x4, 0x0, 0x75, 0x0,
0x0
8. Cobra Core Centronics (10) at 0xf0824000, versions 0x4, 0x0, 0x74,
0x0, 0x0
9. Cobra (720) (0) at 0xfffbe000, versions 0x200, 0x0, 0x4, 0x0, 0x81
10. Cobra (1) at 0xfffbf000, versions 0x13, 0x0, 0x9, 0x0, 0x0
That's a total of 10 devices.
CPU(s): 1 x PA7000 (PCX-S) at 50.000000 MHz
Kernel command line: HOME=/ TERM=vt100 root=/dev/nfs console=ttyS0
Error reading tod clock
Calibrating delay loop... 49.76 BogoMIPS
Memory: 62396k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
Found i82596 at 0xf0826000, IRQ 87
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
request_module[parport_lowlevel]: Root fs not mounted
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 24 64 06 IRQ 87.
82596.c $Revision: 1.15 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
lp0: using parport0 (interrupt-driven).
SCSI subsystem driver Revision: 1.00
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: WARNING: target data areas are not dma coherent!
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID0
scsi0: Unable to send Bus Device Reset for target 0
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID1
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID1
scsi0: Unable to send Bus Device Reset for target 1
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID1
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID2
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID2
scsi0: Unable to send Bus Device Reset for target 2
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID2
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID3
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID3
scsi0: Unable to send Bus Device Reset for target 3
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID3
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID4
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID4
scsi0: Unable to send Bus Device Reset for target 4
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID4
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID5
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID5
scsi0: Unable to send Bus Device Reset for target 5
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID5
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID6
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID6
scsi0: Unable to send Bus Device Reset for target 6
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Bad dsp on abort, 0x00057458, offset 0x41858
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI
bus and chip
scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00057458 (script[0x1d16]), dsps = 00057468, target = 0
scsi0: Failing command for ID6
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
eth0: link ok.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 196.1.1.20, my address is 196.1.1.110
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 196.1.1.20
Looking up port of RPC 100005/2 on 196.1.1.20
VFS: Mounted root (nfs filesystem) readonly.
break 0,0: pid=9 command='init'
init[9]: Breakpoint 0

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 102de010 00000000 00000000
r4-7     00000000 00000000 00000000 00000000
r8-11    00000000 00000000 00000000 00000000
r12-15   00000000 00000000 00000000 10125434
r16-19   13f1c5c0 13f1c000 102b4000 00000001
r20-23   102efcc0 102efcc0 10022780 102efcc0
r24-27   0000002e 00001000 00000000 1024c010
r28-31   00000000 00000000 13f1c9c0 10131288
sr0-3    00000000 00000000 00000000 00000001
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 00000000 00000004
 IIR: 00000000    ISR: 00000000  IOR: 00000000
ORIG_R28: 00000000





-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
