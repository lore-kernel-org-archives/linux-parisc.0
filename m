Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7CB7482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 11:37:05 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15kUEY-0004al-00
	for parisc-linux@lists.parisc-linux.org; Fri, 21 Sep 2001 19:37:02 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15kUDR-00039P-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 19:35:53 +0200
Date: Fri, 21 Sep 2001 19:35:53 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010921193553.A11874@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Albert Strasheim <fullung@dogbert.localdomain>
Subject: [parisc-linux] nfsroot login problems on 720/50
List-ID: <linux-parisc.vger.kernel.org>

Good day,

This message was also sent to debian-hppa. I was wondering anyone on
this list had any ideas?

Regards,

Albert

----- Forwarded message from Albert Strasheim <fullung@ilink.nis.za> -----

From: Albert Strasheim <fullung@ilink.nis.za>
Subject: Re: Getting up and running (whoo!)
To: debian-hppa@lists.debian.org

Greetings,

It boots! Or something :-) After borrowing some terminators from my
friend, I have the following success to report:

I've managed to boot my 720/50 using Linux 2.4.9-pa20 (not -pa22 as I
stated in my original post)  over the LAN (with a make palo lifimage),
using a combination of rbootd (for the lifimage), bootpd (for the IP
address and such), and the userspace nfs daemon for the
baseplus-20010404.tar.gz NFS root.

The boot-up went as follows:

(c) Copyright.  Hewlett-Packard Company.  1991.
All rights reserved.

PDC ROM rev. 2.3
IODC ROM rev. 2.2
96 MB of memory configured and tested.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Selection process stopped.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Search terminated.



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: b lan

Trying lan.000000-000000.0.0
Boot path initialized.
Attempting to load IPL.


Hard booted.
palo ipl 0.94 fullung@dogbert Sun Sep 16 00:52:51 SAST 2001
0/vmlinux32 3149283 bytes @ 0x7800

Command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=10.0.1.1 ip=bootp  console=ttyS0'

Kernel: partition 0 file /vmlinux
Warning: kernel name doesn't end with 32 or 64... Guessing 32
ELF32 executable
Entry 001000d0 first 00100000 n 5
Segment 0 load 00100000 size 1714304 mediaptr 0x1000
Segment 1 load 002a4000 size 281768 mediaptr 0x1a4000
Segment 2 load 002ec000 size 385024 mediaptr 0x1e9000
Segment 3 load 00350000 size 32768 mediaptr 0x247000
Segment 4 load 0038d684 size 88032 mediaptr 0x24f684
branching to kernel entry point 0x001000d0
Linux version 2.4.9-pa20 (fullung@dogbert) (gcc version 3.0.2 20010829 (prerelease)) #6 Sun Sep 16 13:45:08 SAST 2001
FP[0] enabled: Rev 3 Model 0
The 32-bit Kernel has started...
Determining PDC firmware type: Older Legacy Box
model	00002000 00000481 00000000 00000000 77544852 000011f4 00000004 0000000d 00000000
vers	00000003
CPUID	vers 0 rev 0
model	9000/720
Total Memory: 96 Mb
On node 0 totalpages: 24576
zone(0): 24576 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf8000000, versions 0x4, 0x0, 0x77
2. Cobra Core BA (11) at 0xf082f000, versions 0x4, 0x0, 0x70
3. Cobra Core SCSI (10) at 0xf0825000, versions 0x4, 0x0, 0x71
4. Cobra Core LAN (802.3) (10) at 0xf0826000, versions 0x4, 0x0, 0x72
5. Cobra Core HIL (10) at 0xf0821000, versions 0x4, 0x0, 0x73
6. Cobra Core RS-232 (10) at 0xf0823000, versions 0x4, 0x0, 0x75
7. Cobra Core RS-232 (10) at 0xf0822000, versions 0x4, 0x0, 0x75
8. Cobra Core Centronics (10) at 0xf0824000, versions 0x4, 0x0, 0x74
9. Cobra (720) (0) at 0xfffbe000, versions 0x200, 0x0, 0x4
10. Cobra (1) at 0xfffbf000, versions 0x13, 0x0, 0x9
That's a total of 10 devices.
CPU(s): 1 x PA7000 (PCX-S) at 50.000000 MHz
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=10.0.1.1 ip=bootp  console=ttyS0
Console: colour dummy device 160x64
Calibrating delay loop... 49.76 BogoMIPS
Memory: 93884k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
Asp version 1 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
STI byte mode ROM at f8000000, hpa=f8000000
STI byte mode ROM, id 26d1488c-40a00499, conforms to spec rev. 8.02
STI device: HPA1924A
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Found HIL at 0xf0821000, IRQ 94
HIL: keyboard found at id 0
HIL: keymap loaded.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 25 4B E1 IRQ 87.
82596.c $Revision: 1.22 $
SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
sticonsole_init: searching for STI ROMs
Console: switching to colour STI console 160x64
md: linear personality registered
md: raid0 personality registered
md: raid1 personality registered
md: raid5 personality registered
raid5: measuring checksumming speed
   8regs     :    33.600 MB/sec
   8regs_prefetch:    40.800 MB/sec
   32regs    :    32.400 MB/sec
   32regs_prefetch:    41.600 MB/sec
raid5: using function: 32regs_prefetch (41.600 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
eth0: link ok.
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 10.0.1.1, my address is 10.0.1.2
IP-Config: Complete:
      device=eth0, addr=10.0.1.2, mask=255.255.255.0, gw=255.255.255.255,
     host=bob, domain=, nis-domain=(none),
     bootserver=10.0.1.1, rootserver=10.0.1.1, rootpath=
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 10.0.1.1
Looking up port of RPC 100005/1 on 10.0.1.1
VFS: Mounted root (nfs filesystem) readonly.
INIT: version 2.78 booting
rcS(13): unaligned access to 0x0007dca3 at ip=0x0005d807
Not-handled unaligned insn 0x0cd31200
Unaligned handler failed, ret = -1 INIT: Entering runlevel: 2
<4>rc(16): unaligned access to 0x0007dca3 at ip=0x0005d807
Not-handled unaligned insn 0x0cd31200
Unaligned handler failed, ret = -1 <4>rc(17): unaligned access to 0x0007dca9 at ip=0x0005db23
Not-handled unaligned insn 0x0f131200
Unaligned handler failed, ret = -1 
Debian GNU/Linux testing/unstable
pehc base tarball 2001-04-04 see /home/demo/README for more info
bob login: 

Logging in as root or demo (I modified /etc/passwd to empty passwords)
just sits there, until you hit Ctrl-C 3 or 4 times, after which it
returns to the login prompt.

So this is where I'm stuck at the moment. The unaligned stuff also makes
me wonder... perhaps it is unable to execute bash?

What's next?

Regards,

Albert

P.S. There aren't currently any SCSI devices attached, but I doubt that
makes a difference...?

----- End forwarded message -----
