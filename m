Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id A4448483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Jun 2003 04:03:34 -0600 (MDT)
Message-ID: <3EF57F2C.4060509@bluehash.de>
Date: Sun, 22 Jun 2003 12:04:28 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some 2.5-testing
References: <3EEF3C94.3080300@bluehash.de>
In-Reply-To: <3EEF3C94.3080300@bluehash.de>
Content-Type: multipart/mixed;
 boundary="------------040504060700030405030907"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is a multi-part message in MIME format.
--------------040504060700030405030907
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

Hi there,

sorry for the delay, but it took some time to get beck to my HP and 
built an new kernel. With disabled HIL-Support I get a working kernel. 
Bootlog is attached. So I would like to say thank you for the great job 
you all do.
I just recognized two failures. One is: "Setting up general console 
font...set_kernel_font: Function not implemented" during an init-script 
and the other is this: "gsckbd_leds: timeout".
If  I can help to test patches to get HIL-Support working let me know.
Greetings,
    Rüdiger

--------------040504060700030405030907
Content-Type: text/plain;
 name="gandalf-2.5.72-pa1-3.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="gandalf-2.5.72-pa1-3.log"



----------------------------------------------------------------------------
BootRom Version    1.6  
Memory Size:  128 MB
----------------------------------------------------------------------------




(c) Copyright 1990-1994, Hewlett-Packard Company.
All rights reserved

Press <ESCAPE> to stop boot sequence.
----------------------------------------------------------------------------
Command                                Description
-------                                -----------
Auto [boot|search] [on|off]            Set/show auto mode
Boot [pri|alt [isl]]                   Boot from primary or alternate path
Boot [scsi|eisa.<slot>[.<addr>]] [isl] Boot from SCSI or EISA
Boot lan[.<addr>] [install] [isl]      Boot from LAN
Chassis [on|off]                       Set/show chassis codes display mode
DefaultSS                              Reboot and set EEPROM to default values
Diagnostic [on|off]                    Set/show diagnostic boot mode
Fastboot [on|off]                      Set/show fast boot mode
Help                                   Show this command menu
Information                            Show system information
LanAddress                             Show LAN station addresses
Monitor [<DEV>[.<type>]]               Set/show graphics monitor type
                                       (<DEV>=graphics|graphics_<1|2>)
Path [pri|alt [<DEV>[.<addr>]]]        Set/show boot source path
                                       (<DEV>=lan|scsi|eisa.<slot>)
Path [console [<DEV>[.<parm>]]]        Set/show boot console path
                                       (<DEV>=<RS232>|<GRAPH>
                                        <RS232>=rs232|rs232_2
                                        <parm>=<baud>.<length>.<parity>
                                        <GRAPH>=graphics|graphics_<1|2>
                                        <parm>=<monitor>)
Path [keyboard [hil|ps2]]              Set/show boot keyboard path
Pim [hpmc|toc|lpmc]                    Show PIM info
Search [ipl] [scsi|eisa]               Show potential boot devices
Search [ipl] [lan [install]]           Show potential boot LAN devices
Secure [on|off]                        Set/show security mode
----------------------------------------------------------------------------
BOOT_ADMIN> bo pri ipl





Attempting to boot.

Loading Initial Program Loader


IPL successfully loaded


Booting
palo ipl 1.2 root@b2000 Tue Jan 14 13:13:07 MST 2003


Partition Start(MB) End(MB) Id Type


1               1      22   f0 Palo


2              23      64   83 ext2


3              65     194   82 swap


4             195    2046   83 ext2



PALO(F0) partition contains:

    0/vmlinux32 3223985 bytes @ 0x48000


Information: No console specified on kernel command line. This is normal.

PALO will choose the console currently used by firmware (serial).Current command line:

2/vmlinux root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102

 0: 2/vmlinux

 1: root=/dev/sda4

 2: HOME=/

 3: devfs=mount

 4: console=ttyS0

 5: TERM=vt102


Edit which field?

(or 'b' to boot with this command line)? 0 b 0

2/vmlinux-2.5.72-pa1

Current command line:

2/vmlinux-2.5.72-pa1 root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102

 0: 2/vmlinux-2.5.72-pa1

 1: root=/dev/sda4

 2: HOME=/

 3: devfs=mount

 4: console=ttyS0

 5: TERM=vt102


Edit which field?

(or 'b' to boot with this command line)? 0b  b


Command line for kernel: 'root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.5.72-pa1'

Selected kernel: /vmlinux-2.5.72-pa1 from partition 2

ELF32 executable

Entry 00100000 first 00100000 n 3

Segment 0 load 00100000 size 2325984 mediaptr 0x1000

Segment 1 load 00338000 size 463048 mediaptr 0x239000

Segment 2 load 003ac000 size 524416 mediaptr 0x2ab000

Branching to kernel entry point 0x00100000.  If this is the last

message you see, you may need to switch your console.  This is

a common symptom -- search the FAQ and mailing list at parisc-linux.org


Linux version 2.5.72-pa1 (ruediger@gandalf) (gcc version 3.0.4) #2 Fri Jun 20 20:56:57 CEST 2003
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 000060b0 00000481 00000000 00000000 77b661a7 00000000 00000004 00000072 00000072
vers  0000000b
model 9000/715
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
  DMA zone: 32768 pages, LIFO batch:8
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.5.72-pa1
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126144k available
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
-> /dev
-> /dev/console
-> /root
POSIX conformance testing by UNIFIX
Initializing RT netlink socket
EISA bus registered
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf4000000 [0], versions 0x4, 0x0, 0x77
2. Mirage GSC Builtin Graphics (10) at 0xf8000000 [1], versions 0x13, 0x0, 0x85
3. Mirage Core BA (11) at 0xf0100000 [2], versions 0x29, 0x0, 0x81
4. Mirage Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x29, 0x0, 0x82
5. Mirage Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x29, 0x0, 0x8a
6. Mirage Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x29, 0x0, 0x8c
7. Mirage Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x29, 0x0, 0x74
8. Mirage Audio (10) at 0xf0104000 [2/0/8], versions 0x29, 0x0, 0x7b
9. Mirage Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x29, 0x0, 0x83
10. Mirage Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x29, 0x0, 0x84
11. Mirage Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x29, 0x0, 0x84
12. Mirage Wax BA (11) at 0xf0200000 [5], versions 0x13, 0x0, 0x8e
13. Mirage 100 Wax HIL (10) at 0xf0201000 [5/0/1], versions 0x13, 0x0, 0x73
14. Mirage Wax RS-232 (10) at 0xf0202000 [5/0/2], versions 0x13, 0x0, 0x8c
15. Mirage 100 (0) at 0xfffbe000 [8], versions 0x60b, 0x0, 0x4
16. Memory (1) at 0xfffbf000 [9], versions 0x4b, 0x0, 0x9
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
Lasi version 0 at 0xf0100000 found.
Wax at 0xf0200000 found.
BIO: pool of 256 setup, 14Kb (56 bytes/bio)
biovec pool[0]:   1 bvecs: 244 entries (12 bytes)
biovec pool[1]:   4 bvecs: 244 entries (48 bytes)
biovec pool[2]:  16 bvecs: 244 entries (192 bytes)
biovec pool[3]:  64 bvecs: 244 entries (768 bytes)
biovec pool[4]: 128 bvecs: 122 entries (1536 bytes)
biovec pool[5]: 256 bvecs:  61 entries (3072 bytes)
block request queues:
 4/128 requests per read queue
 4/128 requests per write queue
 enter congestion at 15
 exit congestion at 17
SCSI subsystem initialized
pty: 256 Unix98 ptys configured
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Serial: 8250/16550 driver $Revision: 1.90 $ IRQ sharing enabled
Gecko-style soft power switch enabled.
lp: driver loaded but no devices found
Generic RTC Driver v1.07
ttyS0 at MMIO 0xf0105800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xf0202800 (irq = 121) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 7A DC 08 IRQ 87.
82596.c $Revision: 1.29 $
airo:  Probing for PCI adapters
airo:  Finished probing for PCI adapters
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2
scsi0 : LASI SCSI 53c700
scsi0: (2:0) Synchronous at offset 8, period 100ns
  Vendor: PLEXTOR   Model: CD-ROM PX-20TS    Rev: 1.01
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi0: (3:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST32430N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
st: Version 20030413, fixed bufsize 32768, s/g segs 256
scsi0: (3:0) Enabling Tag Command Queuing
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4
Attached scsi disk sda at scsi0, channel 0, id 3, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
Attached scsi generic sg0 at scsi0, channel 0, id 2, lun 0,  type 5
Attached scsi generic sg1 at scsi0, channel 0, id 3, lun 0,  type 0
STI GSC/PCI core graphics driver Version 0.9a
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071A
STI word mode ROM at f0024000, hpa at f8000000
STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1024
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
mice: PS/2 mouse device common for all mice
Found HIL bus at 0xf0201000, IRQ 126
HIL: no keyboard present.
input: HIL keyboard, ID -1 at 0xf0201000 (irq 126) found and attached
Keyboard initialization sequence failled
gsckbd_leds: timeout
input: PS/2 keyboard port at 0xf0108000 (irq 69) found and attached
input: PS/2 mouse port at 0xf0108100 (irq 69) found and attached
oprofile: using timer interrupt.
NET4: Linux TCP/IP 1.0 for NET4.0
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 516k freed

INIT: version 2.84 booting
Mounting devfs on /dev
mount: devfs has wrong device number or fs type devfs not supported
Loading /etc/console/boottime.kmap.gz
Activating swap.
Adding 132920k swap on /dev/sda3.  Priority:-1 extents:1

Checking root file system...
fsck 1.34-WIP (21-May-2003)
/dev/sda4: clean, 105836/237120 files, 394653/474075 blocks
EXT3 FS 2.4-0.9.16, 02 Dec 2001 on sda4, internal journal

System time was Sun Jun 22 09:37:50 UTC 2003.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Sun Jun 22 09:37:52 UTC 2003.
Checking all file systems...
fsck 1.34-WIP (21-May-2003)
/dev/sda2: clean, 30/10944 files, 35929/43617 blocks
Setting kernel variables..
Mounting local filesystems...
/dev/sda2 on /boot type ext2 (rw)
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces... eth0: link ok.

done.
Starting portmap daemon: portmap.
Loading the saved-state of the serial devices...
Setting up general console font...set_kernel_font: Function not implemented
cannot (un)set powersave mode
[14;30]
Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Sun Jun 22 11:37:59 CEST 2003

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
Setting up X server socket directory /tmp/.X11-unix...done.

INIT: Entering runlevel: 2

Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting mouse interface server: gpm.
Starting printer spooler: lpd.
Starting OpenBSD Secure Shell server: sshd.
Starting webmin: webmin.
Setting up X font server socket directory /tmp/.font-unix...done.
Starting X font server: xfs.
Starting internet superserver: xinetd.
Restoring mixer settings: failed.
Starting NFS common utilities: statd lockd.
Starting anac(h)ronistic cron: anacron.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
Setting up X server socket directory /tmp/.X11-unix...done.

--------------040504060700030405030907--
