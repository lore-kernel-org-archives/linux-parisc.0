From: "Matej Martini" <calibrator@gmx.net>
Subject: [parisc-linux] C3600 install
Date: Sat, 12 Jun 2004 10:38:27 +0200 (MEST)
Message-ID: <22601.1087029507@www15.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

Hi

I recently bought a Visualize C3600, my first PARISC box. After playing
around with HP-UX for some days I would like to install my favoured OS ;)
on this really nice machine. FXE-graphics isn't supported so I do this via
serial line. I tried Gentoo (2.4.26-pa1) and an older Debian netinstall
(2.4.20) but I don't get far.  All I get looks like this:

---------------------------------------------------------------------------

Command line for kernel: ' root=/dev/ram0 init=/linuxrc cdroot
looptype=normal l
oop=/livecd.loop console=ttyS0 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Selected ramdisk: initrd from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing...
This box can boot either 32 or 64-bit kernels...Both kernels available,
choosing
 32-bit kernelELF32 executable
Entry 00100290 first 00100000 n 5
Segment 0 load 00100000 size 2555292 mediaptr 0x1000
Segment 1 load 00370000 size 385040 mediaptr 0x271000
Segment 2 load 003d0000 size 270336 mediaptr 0x2d0000
Segment 3 load 00418000 size 32768 mediaptr 0x312000
Segment 4 load 00477d60 size 130928 mediaptr 0x31ad60
Loading ramdisk 1107370 bytes @ 3fee0000...
Branching to kernel entry point 0x00100290.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.26-pa1-livecd-32 (root@b180l) (gcc version 3.3.2) #1 Mon
May 1
7 22:56:46 UTC 2004
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005cf0 00000481 00000000 00000002 77654da0 100000f0 00000008
000000b2 00
0000b2
vers  00000301
CPUID vers 17 rev 11 (0x0000022b)
capabilities 0x3
model 9000/785/C3600
Total Memory: 1024 Mb
initrd: 4fee0000-4ffee5aa
initrd: reserving 3fee0000-3ffee5aa (mem_max 40000000)
pagetable_init
On node 0 totalpages: 262144
zone(0): 262144 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LCD display at f05d0008,f05d0000 registered
Kernel command line:  root=/dev/ram0 init=/linuxrc cdroot looptype=normal
loop=/
livecd.loop console=ttyS0 palo_kernel=0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 1101.00 BogoMIPS
Memory: 1031372k available
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode cache hash table entries: 65536 (order: 7, 524288 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 65536 (order: 6, 262144 bytes)
Page-cache hash table entries: 262144 (order: 8, 1048576 bytes)
Searching for devices...

---------------------------------------------------------------------------

At this point the machine seems to hang. As mentioned above this is my first
PARISC box. I'm not that familiar with the hppa architecture. Maybe it's
just a silly thing I haven't noticed. So if anyone can give me a hint I
would be glad...

Matej Martini

-- 
"Sie haben neue Mails!" - Die GMX Toolbar informiert Sie beim Surfen!
Jetzt aktivieren unter http://www.gmx.net/info

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
