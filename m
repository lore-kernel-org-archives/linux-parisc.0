Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA28546
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Apr 2000 02:12:49 -0600
Message-ID: <20000411081221.9559.qmail@web512.mail.yahoo.com>
Date: Tue, 11 Apr 2000 01:12:21 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] Kernel build with CONFIG_IODC_CONSOLE fails
To: Gyula Matics <gyula_matics@hp.com>
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-760313750-955440741=:27233"
List-ID: <linux-parisc.vger.kernel.org>

--0-760313750-955440741=:27233
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

after Gyula's fix I was able to to compile the kernel
with CONFIG_IODC_CONSOLE. However booting this kernel
results in the (in)famous message "Kernel panic:
Attempted to kill init!".

In the beginning of the boot log there is a
"iodc_con_init" message, but the message "Console:
switching to IODC console" is missing. Instead there
are the following messages:

tty_open
not again
Warning: unable to open an initial console.

which seem to indicate that opening the IODC console
has failed. I have attached the complete boot log to
this message.

Ulrich
--- Gyula Matics <gyula_matics@hp.com> wrote:
> Hi Ulrich,
> 
> I just committed a small fix that should make it
> compile again.
> 
> Gyula
> 

__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
--0-760313750-955440741=:27233
Content-Type: text/plain; name="bootlog.txt"
Content-Description: bootlog.txt
Content-Disposition: inline; filename="bootlog.txt"

              (c) Copyright Hewlett-Packard Company, 1991, 1992
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, 91, 92

PDC ROM rev. 1.4
IODC ROM rev. 1.2
48 MB of memory have been configured.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Selection process stopped.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.6.0                 HP      C2490AM
P1                    scsi.5.0                 NEC     CD-ROM DRIVE:465
P2                    scsi.4.0                 NEC     CD-ROM DRIVE:465
P3                    scsi.3.0                 NEC     CD-ROM DRIVE:465
P4                    scsi.2.0                 NEC     CD-ROM DRIVE:465
P5                    scsi.1.0                 NEC     CD-ROM DRIVE:465
P6                    scsi.0.0                 NEC     CD-ROM DRIVE:465
P7                    lan.0004ac-4425c5.0.0    be8135



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: b p7

Trying lan.0004ac-4425c5.0.0
Boot path initialized.
Attempting to load IPL.


Hard booted.
palo ipl root@Ullis_PC Mon Apr 10 21:29:42 MEST 2000
0/vmlinux 1851223 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/ram initrd=0/ramdisk'
0/ramdisk 870400 bytes @ 0x1ca757
Kernel: partition 0 file /vmlinux
Ramdisk: partition 0 file /ramdisk
ELF32 executable
                prepare_loadable 0050368c 2

Entry 0010125c first 00100000 n 4
Segment 0 load 00100000 size 1031008 mediaptr 0x1000
Segment 1 load 001fc000 size 104484 mediaptr 0xfd000
Segment 2 load 00218000 size 49272 mediaptr 0x117000
Segment 3 load 00228000 size 8192 mediaptr 0x124000
Loading ramdisk 870400 bytes @ 0051c000...
branching to kernel entry point 0x0010125c
The Kernel has started...
Free memory starts at: 0xc0299000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/ram'
PALO initrd 51c000-5f0800
FP CCR was 0x0, will be set to 0xc0
model   00003110 00000481 00000000 00000000 78294d38 ffffffff 00000004 0000000a
0000000a
vers    00000013
CPUID vers 0 rev 0
CPU(s): 1 x PA7100 at 33.333500 MHz
Searching for devices in PDC firmware...  an older box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77, 0x0, 0x0
2. Scorpio Jr. Core BA (11) at 0xf082f000, versions 0xb, 0x0, 0x70, 0x0, 0x0
3. Scorpio Jr. Core SCSI (10) at 0xf0825000, versions 0xb, 0x0, 0x71, 0x0, 0x0
4. Scorpio Jr. Core LAN (802.3) (10) at 0xf0826000, versions 0xb, 0x0, 0x72, 0x0, 0x0
5. Scorpio Jr. Core HIL (10) at 0xf0821000, versions 0xb, 0x0, 0x73, 0x0, 0x0
6. Scorpio Jr. Core RS-232 (10) at 0xf0823000, versions 0xb, 0x0, 0x75, 0x0, 0x0
7. Scorpio Jr. Core RS-232 (10) at 0xf0822000, versions 0xb, 0x0, 0x75, 0x0, 0x0
8. Scorpio Jr. Core Centronics (10) at 0xf0824000, versions 0xb, 0x0, 0x74, 0x0, 0x0
9. Scorpio Jr. Audio (10) at 0xf1000000, versions 0xb, 0x0, 0x7b, 0x0, 0x0
10. Scorpio Jr.(715/33) (0) at 0xfffbe000, versions 0x311, 0x0, 0x4, 0x0, 0x81
11. Scorpio Jr. (1) at 0xfffbf000, versions 0x1b, 0x0, 0x9, 0x0, 0x0
That's a total of 11 devices.
Linux version 2.3.99-pre1 (root@Ullis_PC) (gcc version 2.9-hppa-991112) #1 Mon Apr 10 21:23:26 MEST 2000
init_bootmem 665 12288
init_bootmem complete
initrd: c051c000-c05f0800
pagetable_init
miscoloured (c0218cf4)
miscoloured (c0218d0c)
On node 0 totalpages: 12288
zone(0): 6144 pages.
zone(1): 6144 pages.
zone(2): 0 pages.
trap_init
iodc_con_init
Calibrating delay loop... 25.55 BogoMIPS
Memory: 43700k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c2ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c2ffe004, name=test-cachep)
kmem_test() - finished
c2ff0000 c2ff8000 c2fee000 c2ffc000
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
request_irq(259, c01b9028, 0x0, asp, c2fe9080)
Lasi IRQ 259 EIM 0xfffe0003
lasi_alloc_irq(0xc028d2f8): No known LASI owns device at 0xf0826000
IRQ not found for lasi lan at 0xf0826000
Warning : device (10, 0xb, 0x0, 0x72, 0x0) NOT claimed by Lasi i82596(???) LAN 700 or similiar (old)
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
Starting kswapd v1.6
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
pckbd_leds 00
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 850 blocks [1 disk] into ram disk... done.
kernel BUG at block_dev.c:426!
kernel BUG at block_dev.c:426!
VFS: Mounted root (ext2 filesystem).
tty_open
not again
Warning: unable to open an initial console.
do_execve
reading c013a0d8 c2fe07c8 c2fe0588 128
returned 128
02100108 05124000 00000000 00000000
00000000 00000000 000039c3 00000080
000000b4 00045535 40006d38 00000138
00000004 000001c8 00000013 000004fc
00000000 000004fc 000001e8 000004c0
00000003 000006e4 00000000 000006e4
00000000 000006e4 00000000 000006e4
00000000 00045000 00000535 4702100b
trying c0163a70
trying c0163488
load_som_binary
It seems to be a valid SOM executable
reading c013a0d8 c2fe0848 c2fcf260 180
returned 180
10000004 00000028 0003e044 00001000
00000000 00006000 40001000 0003f000
0000ef10 000039c0 00000000 00000000
8000000b 00000004 00000000 80000001
00000020 39323435 332d3037 42000000
31312e30 31000000 00000000 386001ae
00000000 80000001 00000020 39323435
332d3037 42000000 31312e30 34000000
bprm->p: 2001ffc8
stack_base 20000000 b1c71000
stack_base 20001000 b1c71000
stack_base 20002000 b1c71000
stack_base 20003000 b1c71000
stack_base 20004000 b1c71000
stack_base 20005000 b1c71000
stack_base 20006000 b1c71000
stack_base 20007000 b1c71000
stack_base 20008000 b1c71000
stack_base 20009000 b1c71000
stack_base 2000a000 b1c71000
stack_base 2000b000 b1c71000
stack_base 2000c000 b1c71000
stack_base 2000d000 b1c71000
stack_base 2000e000 b1c71000
stack_base 2000f000 b1c71000
stack_base 20010000 b1c71000
stack_base 20011000 b1c71000
stack_base 20012000 b1c71000
stack_base 20013000 b1c71000
stack_base 20014000 b1c71000
stack_base 20015000 b1c71000
stack_base 20016000 b1c71000
stack_base 20017000 b1c71000
stack_base 20018000 b1c71000
stack_base 20019000 b1c71000
stack_base 2001a000 b1c71000
stack_base 2001b000 b1c71000
stack_base 2001c000 b1c71000
stack_base 2001d000 b1c71000
stack_base 2001e000 b1c71000
stack_base 2001f000 c2d1f000
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
(start_brk) 40016000
(end_code) 00040000
(start_code) 00001000
(end_data) 40007000
(start_stack) 20020028
(brk) 40016000
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
current = c2fe0000, mm = c2eb9040, mmap_sem = c2eb905c
Kernel panic: Attempted to kill init!

--0-760313750-955440741=:27233--
