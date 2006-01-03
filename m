From: "Craig D. Lansing" <clansing@charter.net>
Subject: RE: [parisc-linux] J2240 - Almost there....
Date: Mon, 2 Jan 2006 20:19:55 -0500
Message-ID: <000401c61003$cea58c60$3401a8c0@POGO>
References: <7d01f9f00601010615v54117490o9a575fd279244524@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "'Thibaut VARENE'" <T-Bone@parisc-linux.org>,
 "'Grant Grundler'" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00601010615v54117490o9a575fd279244524@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Sorry that it took so long to reply.  I spent most of the day driving to /
from Washington, DC yesterday.  Re-installed and ran into problems as
follows:

1) Got gdm prompt (black&white, really large), but was able to login.  Mouse
was not recognized after that so I was "stuck" in the desktop.  I was able
to login OK in single user command line mode.

2) Re-installed after getting the actual "advanced" HP p1120 console specs
(instead of "simple").  Re-install failed due to "SMP CALL FUNCTION TIMED
OUT! (cpu=0), try ###" errors (I powered off the box after about 2000 of
these).  Rebooted and got message to run "dpkg --configure -a".  Did that
and packages installed.  The system now tries to start gdm (flickers a lot),
but ultimately just goes to a blinking cursor  When I reboot (shutdown -r 0)
I now get the "Welcome to your new Debian system" prompt.  I guess maybe I
should re-install again????

3) Networking appears to not be working, I assumed that is because of the
"blacklisted" FDDI card (defxx,DEFPA).  The box has an internal IP address
192.168.1.100 and I can't even ping it.  However, I cannot ping the box when
booted into HP-UX either (192.168.1.200).  Bad card (I tried the obvious of
another cable)????

To get the info. requsted below w/o a LAN, I "cheated" and started a getty
against a serial port, logged in via a Reflection session, and logged to an
output file... not pretty, but functional.  Sorry if this is more than you
wanted to see.  I have been unsuccessful trying to set up an entry in
/etc/inittab in HP-UX that will spawn a getty on the serial port equivalent
to ttyS0 in Linux... any pointers would be appreciated (it has been a long
time) then I can get the ioscan -fk output.

*******************************************
Linux Info
*******************************************

Debian GNU/Linux 3.1 howlin ttyS0

howlin login: 
Debian GNU/Linux 3.1 howlin ttyS0

howlin login: root
Password: 
Linux howlin 2.6.8-2-32-smp #1 SMP Wed Aug 24 17:55:41 UTC 2005 parisc
GNU/Linux

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent permitted
by applicable law.
howlin:~#
howlin:~# cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8200 (PCX-U+)
cpu MHz         : 236.000000
model           : 9000/782/J2240
model name      : SummitHawk U+
hversion        : 0x00005b50
sversion        : 0x00000491
I-cache         : 2048 KB
D-cache         : 2048 KB (WB, 0-way associative)
ITLB entries    : 120
DTLB entries    : 120 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (16 combined) BTLB var-entr.  : 0
instruction, 0 data (0 combined)
bogomips        : 470.22
software id     : 2002047818

processor       : 1
cpu family      : PA-RISC 2.0
cpu             : PA8200 (PCX-U+)
cpu MHz         : 236.000000
model           : 9000/782/J2240
model name      : SummitHawk U+
hversion        : 0x00005b50
sversion        : 0x00000491
I-cache         : 2048 KB
D-cache         : 2048 KB (WB, 0-way associative)
ITLB entries    : 120
DTLB entries    : 120 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (16 combined) BTLB var-entr.  : 0
instruction, 0 data (0 combined)
bogomips        : 470.22
software id     : 2002047818

howlin:~# cat /proc/iomem
00000000-7fffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-003b4fff : Kernel code
  003b5000-00513b03 : Kernel data
f0190000-f0190000 : lcd_cmd
f0190001-f0190001 : lcd_data
f1600000-f3ffffff : GSC Bus [10/]
  f1604000-f1604fff : Cujo
  f1607800-f1607807 : serial
  f1800000-f1ffffff : Cujo LMMIO 0
f4000000-f5ffffff : GSC Bus [8/]
f6000000-f7ffffff : GSC Bus [10/]
  f6000000-f7ffffff : Cujo LMMIO 1
    f6000000-f7ffffff : 0000:02:00.0
      f6100000-f64fffff : stifb mmio
      f7000000-f71fffff : stifb fb
f8000000-fff7ffff : GSC Bus [8/]
  fc000000-fc000fff : Cujo
  fc003800-fc003807 : serial
  fc004000-fc004fff : Dino [8/4]
  fc800000-fcffffff : Dino [8/4] LMMIO 0
    fc800000-fc800fff : 0000:01:13.0
      fc800000-fc800fff : sym53c8xx
    fc801000-fc8010ff : 0000:01:13.0
      fc801000-fc8010ff : sym53c8xx
    fc802000-fc80207f : 0000:01:14.0
      fc802000-fc80207f : tulip
  fd800000-fdffffff : Cujo LMMIO 0
    fd800000-fd80ffff : 0000:00:04.0
    fd810000-fd81007f : 0000:00:03.0
      fd810000-fd81007f : tulip
    fd811000-fd81107f : 0000:00:04.0
  ffd00000-ffdfffff : Lasi
    ffd00000-ffd00fff : Lasi
    ffd06000-ffd06fff : Lasi SCSI
    ffd08000-ffd08fff : GSC PS2
fff80000-fffaffff : Central Bus
  fff88000-fff88fff : U2:Uturn
  fff8a000-fff8afff : U2:Uturn
  fffa0000-fffa0fff : CPU
  fffa2000-fffa2fff : CPU
fffb0000-fffdffff : Local Broadcast
fffe0000-ffffffff : Global Broadcast
howlin:~# cat /proc/ioports
00000000-0000ffff : Cujo I/O Port
  00000080-000000ff : 0000:00:03.0
    00000080-000000ff : tulip
  00000100-0000017f : 0000:00:04.0
00010000-0001ffff : Dino I/O Port
  00010000-000100ff : 0000:01:13.0
    00010000-000100ff : sym53c8xx
  00010100-0001017f : 0000:01:14.0
    00010100-0001017f : tulip
00020000-0002ffff : Cujo I/O Port
howlin:~# cat /proc/interrupts/
cat: /proc/interrupts/: Not a directory
howlin:~# cat /proc/interrupts 
           CPU00       CPU01 
 32:     125984     124641      PARISC-CPU  timer
 33:       8458       9035      PARISC-CPU  IPI
 34:        120          0      PARISC-CPU  lasi
 35:          0       1274      PARISC-CPU  Cujo
 36:       7095          0      PARISC-CPU  Dino [8/4]
 37:          0          0      PARISC-CPU  Cujo
 69:         41          0            Lasi  GSC PS2 keyboard, GSC PS2 mouse
 86:         79          0            Lasi  lasi700
 99:          0        858            Cujo  eth0
106:          0        417            Cujo  serial
131:       7095          0      Dino [8/4]  sym53c8xx
howlin:~# dmesg
Linux version 2.6.8-2-32-smp (root@palinux) (gcc version 3.3.5 (Debian
1:3.3.5-1
3)) #1 SMP Wed Aug 24 17:55:41 UTC 2005
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005b50 00000491 00000000 00000002 7754d34a 100000f0 00000008
000000b2 00
0000b2
vers  00000501
CPUID vers 14 rev 23 (0x000001d7)
capabilities 0x2
model 9000/782/J2240
Total Memory: 2048 Mb
initrd: 4fb30000-4ffee000
initrd: reserving 3fb30000-3ffee000 (mem_max 80000000) On node 0 totalpages:
524288
  DMA zone: 524288 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
LCD display at f0190000,f0190001 registered
SMP: bootstrap CPU ID is 0
Built 1 zonelists
Kernel command line: root=/dev/sda5 HOME=/ console=tty0 sti=10/4/0/0
sti_font=VG
A8x16 TERM=linux palo_kernel=2/vmlinux
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 524288 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 262144 (order: 8, 1048576 bytes)
Memory: 2097152k available
Calibrating delay loop... 470.22 BogoMIPS Security Scaffold v1.0.0
initialized Capability LSM initialized Mount-cache hash table entries: 512
(order: 0, 4096 bytes) Brought up 1 CPUs
CPU0:  online
 domain 0: span ffffffff
  groups: 00000001 00000002 00000004 00000008 00000010 00000020 00000040
0000008 0 00000100 00000200 00000400 00000800 00001000 00002000 00004000
00008000 000100 00 00020000 00040000 00080000 00100000 00200000 00400000
00800000 01000000 02000 000 04000000 08000000 10000000 20000000 40000000
80000000
CPU1: offline
 domain 0: span ffffffff
  groups: 00000002 00000004 00000008 00000010 00000020 00000040 00000080
0000010 0 00000200 00000400 00000800 00001000 00002000 00004000 00008000
00010000 000200 00 00040000 00080000 00100000 00200000 00400000 00800000
01000000 02000000 04000 000 08000000 10000000 20000000 40000000 80000000
00000001
CPU2: offline
 domain 0: span ffffffff
  groups: 00000004 00000008 00000010 00000020 00000040 00000080 00000100
0000020 0 00000400 00000800 00001000 00002000 00004000 00008000 00010000
00020000 000400 00 00080000 00100000 00200000 00400000 00800000 01000000
02000000 04000000 08000 000 10000000 20000000 40000000 80000000 00000001
00000002
CPU3: offline
 domain 0: span ffffffff
  groups: 00000008 00000010 00000020 00000040 00000080 00000100 00000200
0000040 0 00000800 00001000 00002000 00004000 00008000 00010000 00020000
00040000 000800 00 00100000 00200000 00400000 00800000 01000000 02000000
04000000 08000000 10000 000 20000000 40000000 80000000 00000001 00000002
00000004
CPU4: offline
 domain 0: span ffffffff
  groups: 00000010 00000020 00000040 00000080 00000100 00000200 00000400
0000080 0 00001000 00002000 00004000 00008000 00010000 00020000 00040000
00080000 001000 00 00200000 00400000 00800000 01000000 02000000 04000000
08000000 10000000 20000 000 40000000 80000000 00000001 00000002 00000004
00000008
CPU5: offline
 domain 0: span ffffffff
  groups: 00000020 00000040 00000080 00000100 00000200 00000400 00000800
0000100 0 00002000 00004000 00008000 00010000 00020000 00040000 00080000
00100000 002000 00 00400000 00800000 01000000 02000000 04000000 08000000
10000000 20000000 40000 000 80000000 00000001 00000002 00000004 00000008
00000010
CPU6: offline
 domain 0: span ffffffff
  groups: 00000040 00000080 00000100 00000200 00000400 00000800 00001000
0000200 0 00004000 00008000 00010000 00020000 00040000 00080000 00100000
00200000 004000 00 00800000 01000000 02000000 04000000 08000000 10000000
20000000 40000000 80000 000 00000001 00000002 00000004 00000008 00000010
00000020
CPU7: offline
 domain 0: span ffffffff
  groups: 00000080 00000100 00000200 00000400 00000800 00001000 00002000
0000400 0 00008000 00010000 00020000 00040000 00080000 00100000 00200000
00400000 008000 00 01000000 02000000 04000000 08000000 10000000 20000000
40000000 80000000 00000
001 00000002 00000004 00000008 00000010 00000020 00000040
CPU8: offline
 domain 0: span ffffffff
  groups: 00000100 00000200 00000400 00000800 00001000 00002000 00004000
0000800 0 00010000 00020000 00040000 00080000 00100000 00200000 00400000
00800000 010000 00 02000000 04000000 08000000 10000000 20000000 40000000
80000000 00000001 00000
002 00000004 00000008 00000010 00000020 00000040 00000080
CPU9: offline
 domain 0: span ffffffff
  groups: 00000200 00000400 00000800 00001000 00002000 00004000 00008000
0001000 0 00020000 00040000 00080000 00100000 00200000 00400000 00800000
01000000 020000 00 04000000 08000000 10000000 20000000 40000000 80000000
00000001 00000002 00000
004 00000008 00000010 00000020 00000040 00000080 00000100
CPU10: offline
 domain 0: span ffffffff
  groups: 00000400 00000800 00001000 00002000 00004000 00008000 00010000
0002000 0 00040000 00080000 00100000 00200000 00400000 00800000 01000000
02000000 040000 00 08000000 10000000 20000000 40000000 80000000 00000001
00000002 00000004 00000
008 00000010 00000020 00000040 00000080 00000100 00000200
CPU11: offline
 domain 0: span ffffffff
  groups: 00000800 00001000 00002000 00004000 00008000 00010000 00020000
0004000 0 00080000 00100000 00200000 00400000 00800000 01000000 02000000
04000000 080000 00 10000000 20000000 40000000 80000000 00000001 00000002
00000004 00000008 00000 010 00000020 00000040 00000080 00000100 00000200
00000400
CPU12: offline
 domain 0: span ffffffff
  groups: 00001000 00002000 00004000 00008000 00010000 00020000 00040000
0008000 0 00100000 00200000 00400000 00800000 01000000 02000000 04000000
08000000 100000 00 20000000 40000000 80000000 00000001 00000002 00000004
00000008 00000010 00000 020 00000040 00000080 00000100 00000200 00000400
00000800
CPU13: offline
 domain 0: span ffffffff
  groups: 00002000 00004000 00008000 00010000 00020000 00040000 00080000
0010000 0 00200000 00400000 00800000 01000000 02000000 04000000 08000000
10000000 200000 00 40000000 80000000 00000001 00000002 00000004 00000008
00000010 00000020 00000 040 00000080 00000100 00000200 00000400 00000800
00001000
CPU14: offline
 domain 0: span ffffffff
  groups: 00004000 00008000 00010000 00020000 00040000 00080000 00100000
0020000 0 00400000 00800000 01000000 02000000 04000000 08000000 10000000
20000000 400000 00 80000000 00000001 00000002 00000004 00000008 00000010
00000020 00000040 00000 080 00000100 00000200 00000400 00000800 00001000
00002000
CPU15: offline
 domain 0: span ffffffff
  groups: 00008000 00010000 00020000 00040000 00080000 00100000 00200000
0040000 0 00800000 01000000 02000000 04000000 08000000 10000000 20000000
40000000 800000 00 00000001 00000002 00000004 00000008 00000010 00000020
00000040 00000080 00000 100 00000200 00000400 00000800 00001000 00002000
00004000
CPU16: offline
 domain 0: span ffffffff
  groups: 00010000 00020000 00040000 00080000 00100000 00200000 00400000
0080000 0 01000000 02000000 04000000 08000000 10000000 20000000 40000000
80000000 000000
01 00000002 00000004 00000008 00000010 00000020 00000040 00000080 00000100
00000 200 00000400 00000800 00001000 00002000 00004000 00008000
CPU17: offline
 domain 0: span ffffffff
  groups: 00020000 00040000 00080000 00100000 00200000 00400000 00800000
0100000 0 02000000 04000000 08000000 10000000 20000000 40000000 80000000
00000001 000000
02 00000004 00000008 00000010 00000020 00000040 00000080 00000100 00000200
00000 400 00000800 00001000 00002000 00004000 00008000 00010000
CPU18: offline
 domain 0: span ffffffff
  groups: 00040000 00080000 00100000 00200000 00400000 00800000 01000000
0200000 0 04000000 08000000 10000000 20000000 40000000 80000000 00000001
00000002 000000
04 00000008 00000010 00000020 00000040 00000080 00000100 00000200 00000400
00000 800 00001000 00002000 00004000 00008000 00010000 00020000
CPU19: offline
 domain 0: span ffffffff
  groups: 00080000 00100000 00200000 00400000 00800000 01000000 02000000
0400000 0 08000000 10000000 20000000 40000000 80000000 00000001 00000002
00000004 000000
08 00000010 00000020 00000040 00000080 00000100 00000200 00000400 00000800
00001 000 00002000 00004000 00008000 00010000 00020000 00040000
CPU20: offline
 domain 0: span ffffffff
  groups: 00100000 00200000 00400000 00800000 01000000 02000000 04000000
0800000 0 10000000 20000000 40000000 80000000 00000001 00000002 00000004
00000008 000000 10 00000020 00000040 00000080 00000100 00000200 00000400
00000800 00001000 00002 000 00004000 00008000 00010000 00020000 00040000
00080000
CPU21: offline
 domain 0: span ffffffff
  groups: 00200000 00400000 00800000 01000000 02000000 04000000 08000000
1000000 0 20000000 40000000 80000000 00000001 00000002 00000004 00000008
00000010 000000 20 00000040 00000080 00000100 00000200 00000400 00000800
00001000 00002000 00004 000 00008000 00010000 00020000 00040000 00080000
00100000
CPU22: offline
 domain 0: span ffffffff
  groups: 00400000 00800000 01000000 02000000 04000000 08000000 10000000
2000000 0 40000000 80000000 00000001 00000002 00000004 00000008 00000010
00000020 000000 40 00000080 00000100 00000200 00000400 00000800 00001000
00002000 00004000 00008 000 00010000 00020000 00040000 00080000 00100000
00200000
CPU23: offline
 domain 0: span ffffffff
  groups: 00800000 01000000 02000000 04000000 08000000 10000000 20000000
4000000 0 80000000 00000001 00000002 00000004 00000008 00000010 00000020
00000040 000000 80 00000100 00000200 00000400 00000800 00001000 00002000
00004000 00008000 00010 000 00020000 00040000 00080000 00100000 00200000
00400000
CPU24: offline
 domain 0: span ffffffff
  groups: 01000000 02000000 04000000 08000000 10000000 20000000 40000000
8000000 0 00000001 00000002 00000004 00000008 00000010 00000020 00000040
00000080 000001 00 00000200 00000400 00000800 00001000 00002000 00004000
00008000 00010000 00020 000 00040000 00080000 00100000 00200000 00400000
00800000
CPU25: offline
 domain 0: span ffffffff
  groups: 02000000 04000000 08000000 10000000 20000000 40000000 80000000
0000000
1 00000002 00000004 00000008 00000010 00000020 00000040 00000080 00000100
000002 00 00000400 00000800 00001000 00002000 00004000 00008000 00010000
00020000 00040 000 00080000 00100000 00200000 00400000 00800000 01000000
CPU26: offline
 domain 0: span ffffffff
  groups: 04000000 08000000 10000000 20000000 40000000 80000000 00000001
0000000
2 00000004 00000008 00000010 00000020 00000040 00000080 00000100 00000200
000004 00 00000800 00001000 00002000 00004000 00008000 00010000 00020000
00040000 00080 000 00100000 00200000 00400000 00800000 01000000 02000000
CPU27: offline
 domain 0: span ffffffff
  groups: 08000000 10000000 20000000 40000000 80000000 00000001 00000002
0000000
4 00000008 00000010 00000020 00000040 00000080 00000100 00000200 00000400
000008 00 00001000 00002000 00004000 00008000 00010000 00020000 00040000
00080000 00100 000 00200000 00400000 00800000 01000000 02000000 04000000
CPU28: offline
 domain 0: span ffffffff
  groups: 10000000 20000000 40000000 80000000 00000001 00000002 00000004
0000000
8 00000010 00000020 00000040 00000080 00000100 00000200 00000400 00000800
000010 00 00002000 00004000 00008000 00010000 00020000 00040000 00080000
00100000 00200 000 00400000 00800000 01000000 02000000 04000000 08000000
CPU29: offline
 domain 0: span ffffffff
  groups: 20000000 40000000 80000000 00000001 00000002 00000004 00000008
0000001 0 00000020 00000040 00000080 00000100 00000200 00000400 00000800
00001000 000020 00 00004000 00008000 00010000 00020000 00040000 00080000
00100000 00200000 00400 000 00800000 01000000 02000000 04000000 08000000
10000000
CPU30: offline
 domain 0: span ffffffff
  groups: 40000000 80000000 00000001 00000002 00000004 00000008 00000010
0000002 0 00000040 00000080 00000100 00000200 00000400 00000800 00001000
00002000 000040 00 00008000 00010000 00020000 00040000 00080000 00100000
00200000 00400000 00800 000 01000000 02000000 04000000 08000000 10000000
20000000
CPU31: offline
 domain 0: span ffffffff
  groups: 80000000 00000001 00000002 00000004 00000008 00000010 00000020
0000004 0 00000080 00000100 00000200 00000400 00000800 00001000 00002000
00004000 000080 00 00010000 00020000 00040000 00080000 00100000 00200000
00400000 00800000 01000 000 02000000 04000000 08000000 10000000 20000000
40000000 checking if image is initramfs...it isn't (ungzip failed); looks
like an initrd
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b } 2.
unknown device at 0xfc000000 [8/0] { 13, 0x3, 0x05d, 0x0000a },  additional
a
ddresses: 0xfd800000
3. SummitHawk Dino RS-232 at 0xfc003000 [8/0/63] { 10, 0x0, 0x05d, 0x0008c }
4. Dino PCI Bridge at 0xfc004000 [8/4] { 13, 0x3, 0x680, 0x0000a },
additional
addresses: 0xfc800000
5. SummitHawk 230 Core BA at 0xffd00000 [8/12] { 11, 0x0, 0x05c, 0x00081 },
add itional addresses: 0xffd0c000 0xffc00000 6. SummitHawk 230 Core
Centronics at 0xffd02000 [8/12/0] { 10, 0x0, 0x05c, 0x000
74 },  additional addresses: 0xffd01000 0xffd03000 7. SummitHawk 230 Core
Audio at 0xffd04000 [8/12/1] { 10, 0x4, 0x05c, 0x0007b } 8. SummitHawk 230
Core SCSI at 0xffd06000 [8/12/5] { 10, 0x0, 0x05c, 0x00082 } 9. SummitHawk
230 Core PS/2 Port at 0xffd08000 [8/12/7] { 10, 0x0, 0x05c, 0x0008
4 }
10. SummitHawk 230 Core PS/2 Port at 0xffd08100 [8/12/8] { 10, 0x0, 0x05c,
0x000
84 }
11. U2-IOA BC GSC+ Port at 0xfc03f000 [8/63] { 7, 0x1, 0x501, 0x0000c } 12.
U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b } 13.
Cujo PCI Bridge at 0xf1604000 [10/4] { 13, 0x1, 0x682, 0x0000a },  additiona
l addresses: 0xf1800000 0xf6000000 14. SummitHawk Dino RS-232 at 0xf1607000
[10/4/63] { 10, 0x0, 0x05d, 0x0008c } 15. U2-IOA BC GSC+ Port at 0xf163f000
[10/63] { 7, 0x1, 0x501, 0x0000c } 16. SummitHawk U+ at 0xfffa0000 [32] { 0,
0x0, 0x5b5, 0x00004 } 17. SummitHawk U+ at 0xfffa2000 [34] { 0, 0x0, 0x5b5,
0x00004 } 18. Memory at 0xfffb1000 [49] { 1, 0x0, 0x083, 0x00009 } Releasing
cpu 1 now, hpa=fffa2000 FP[1] enabled: Rev 0 Model 14
CPU(s): 2 x PA8200 (PCX-U+) at 236.000000 MHz Found U2 at 0xfff88000 Found
U2 at 0xfff8a000 Lasi version 0 at 0xffd00000 found.
Cujo version unknown found at 0xfc000000 Dino [8/4] version 3.1 found at
0xfc004000 Cujo version 2.0 found at 0xf1604000 Enabling Cujo 2.0 bug
workaround SCSI subsystem initialized TC classifier action (bugs to
netdev@oss.sgi.com cc hadi@cyberus.ca) STI GSC/PCI core graphics driver
Version 0.9a STI PCI graphic ROM found at f1ff0000 (64 kB), fb at f6000000
(32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1280
fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7,
mmi
o: 0xf6100000
unwind_init: start = 0x103b6720, end = 0x103d7f40, entries = 8578
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
Console: switching to colour frame buffer device 160x64 Generic RTC Driver
v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 25 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfc003800 (irq = 106) is a 16550A
ttyS1 at MMIO 0xf1607800 (irq = 170) is a 16550A RAMDISK driver initialized:
16 RAM disks of 8192K size 1024 blocksize
mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xffd08000 irq 69 @ parisc8:12:7
input: AT Raw Set 2 keyboard on parisc8:12:7
serio: GSC PS2 mouse port at 0xffd08100 irq 69 @ parisc8:12:8 HP SDC: No SDC
found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 96Kbytes
TCP: Hash tables configured (established 131072 bind 52428)
RAMDISK: cramfs filesystem found at block 0
RAMDISK: Loading 4856 blocks [1 disk] into ram disk... done.
VFS: Mounted root (cramfs filesystem) readonly.
Freeing unused kernel memory: Badness in smp_call_function at
arch/parisc/kernel
/smp.c:342
Backtrace:
 [<1011963c>] smp_call_function+0x408/0x410  [<101088fc>]
flush_data_cache+0x24/0x40  [<10107a58>] free_initmem+0x78/0x38c
[<10103d30>] init+0x304/0x410  [<10110c5c>] ret_from_kernel_thread+0x1c/0x24

344k freed
NET: Registered protocol family 1
sym0: <895> rev 0x1 at pci 0000:01:13.0 irq 131
sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18k
Using anticipatory io scheduler
  Vendor: IBM       Model: DDRS-39130WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:5:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:5:0): Beginning Domain Validation
sym0:5: wide asynchronous.
sym0:5: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:5:0): Domain Validation skipping write tests
scsi(0:0:5:0): Ending Domain Validation
  Vendor: IBM       Model: DDRS-39130WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:6:0): Beginning Domain Validation
sym0:6: wide asynchronous.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:6:0): Domain Validation skipping write tests
scsi(0:0:6:0): Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
  Vendor: TOSHIBA   Model: CD-ROM XM-5701TA  Rev: 1557
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi(1:0:2:0): Beginning Domain Validation
scsi1: (2:0) Asynchronous
scsi1: (2:0) Synchronous at offset 8, period 100ns
scsi(1:0:2:0): Domain Validation skipping write tests
scsi(1:0:2:0): Ending Domain Validation
  Vendor: HP        Model: C1537A            Rev: HP02
  Type:   Sequential-Access                  ANSI SCSI revision: 02
scsi(1:0:3:0): Beginning Domain Validation
scsi1: (3:0) Asynchronous
scsi1: (3:0) Synchronous at offset 8, period 100ns
scsi(1:0:3:0): Domain Validation skipping write tests
scsi(1:0:3:0): Ending Domain Validation
usbcore: registered new driver hub
usbcore: registered new driver usbkbd
drivers/usb/input/usbkbd.c: :USB HID Boot Protocol keyboard driver
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver Linux Tulip driver
version 1.1.13 (May 11, 2002)
tulip0:  EEPROM default media type Autosense.
tulip0:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip0: ***WARNING***: No MII transceiver found!
eth0: Digital DS21143 Tulip rev 33 at 0xfd810000, 00:60:B0:B2:FC:F5, IRQ 99.
tulip1: no phy info, aborting mtable build
tulip1:  MII transceiver #1 config 1000 status 7809 advertising 01e1.
eth1: Digital DS21143 Tulip rev 48 at 0xfc802000, 00:60:B0:A4:F3:F1, IRQ
128.
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB) SCSI device sda:
drive cache: write through
 /dev/scsi/host0/bus0/target5/lun0: p1 p2 p3 < p5 p6 > Attached scsi disk
sda at scsi0, channel 0, id 5, lun 0 SCSI device sdb: 17773524 512-byte hdwr
sectors (9100 MB) SCSI device sdb: drive cache: write through
 /dev/scsi/host0/bus0/target6/lun0:
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.20
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0 kjournald
starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Adding 353388k swap on /dev/sda6.  Priority:-1 extents:1
EXT3 FS on sda5, internal journal
ehci_hcd: block sizes: qh 128 qtd 96 itd 192 sitd 96
ohci_hcd: 2004 Feb 02 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
USB Universal Host Controller Interface driver v2.2 Attached scsi generic
sg0 at scsi0, channel 0, id 5, lun 0,  type 0 Attached scsi generic sg1 at
scsi0, channel 0, id 6, lun 0,  type 0 Attached scsi generic sg2 at scsi1,
channel 0, id 2, lun 0,  type 5 Attached scsi generic sg3 at scsi1, channel
0, id 3, lun 0,  type 1
st: Version 20040403, fixed bufsize 32768, s/g segs 256 Attached scsi tape
st0 at scsi1, channel 0, id 3, lun 0
st0: try direct i/o: yes (alignment 512 B), max page reachable by HBA
1048575 module ipv6 relocation of symbol ipv6_chk_addr is out of range
(0x3ffefffd in 17
 bits)
module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefffd
in 17
 bits)
dirmngr (pid 1983): Protection id trap (code 7) at 4000201f

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  00000000 400023a0 4000201c faf00778
r04-07  40734a58 0001fd60 00000006 00000001
r08-11  00046ea8 00046ea8 000476a8 000001f6
r12-15  00000003 faf00130 00000000 00000001
r16-19  00000000 00000000 00000000 4077ada8
r20-23  00000001 4060d57c faf00778 00000000
r24-27  4077b424 00000000 4077b378 00045ea8
r28-31  00000000 ffffffff 40002308 40754083
sr0-3   00000c22 00000c22 00000000 00000c22
sr4-7   00000c22 00000c22 00000c22 00000c22

IASQ: 00000c22 00000c22 IAOQ: 4000201f 40002023
 IIR: 43ffff40    ISR: 102401e9  IOR: 3fb7b660
 CPU:        0   CR30: 8a538000 CR31: 10468000
 ORIG_R28: 00000000
 IAOQ[0]: 0x4000201f
 IAOQ[1]: 0x40002023
 RP(r2): 0x4000201c
parport_pc: Unknown symbol dma_spin_lock
lp: driver loaded but no devices found
NET: Registered protocol family 5
module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefffd
in 17
 bits)
module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefffd
in 17
 bits)
module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefffd
in 17
 bits)












-----Original Message-----
From: varenet@gmail.com [mailto:varenet@gmail.com] On Behalf Of Thibaut
VARENE
Sent: Sunday, January 01, 2006 9:16 AM
To: Grant Grundler
Cc: Craig D. Lansing; parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost there....

On 1/1/06, Grant Grundler <grundler@parisc-linux.org> wrote:
> On Sat, Dec 31, 2005 at 11:21:06PM -0500, Craig D. Lansing wrote:
> > Duh!!!  Can you tell that it has been a long time since I've had a
"real"
> > computer to play with?
> >
> > Anyway, I now have a dual-boot (HP-UX 10 / Debian Linux) J2240.
> >
> > Here's what SAM thinks is in the system:
>
> "ioscan -fk" is the preferred output and I can
> better understand what is in the box.
> I don't understand what's really built-in or add-on
> with the SAM output.

And while you're at it, i'd love to have the output of 'cat
/proc/cpuinfo' 'cat /proc/iomem' 'cat /proc/ioports' 'cat
/proc/interrupts/' and 'dmesg' from Linux to add to this growing list
:
http://www.pateam.org/archive/logs/ ;)

Thx and happy new year to every one!

T-Bone

--
Thibaut VARENE
http://www.parisc-linux.org/~varenet/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
