Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA16743
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jan 2000 12:41:05 -0700
Received: by wallace.ece.rice.edu
	via sendmail from stdin
	id <m12DAua-000LEMC@wallace.ece.rice.edu> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Tue, 25 Jan 2000 12:41:56 -0600 (CST)
Date: Tue, 25 Jan 2000 12:41:56 -0600
From: "Ross J. Reedstrom" <reedstrm@wallace.ece.rice.edu>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 problem
Message-ID: <20000125124156.G423@rice.edu>
References: <Pine.LNX.4.10.10001241636160.3967-100000@grasshopper.thepuffingroup.com> <Pine.HPX.4.21.0001251927060.15648-200000@gamgee.ntc.nokia.com> <20000125142243.B32390@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000125142243.B32390@thepuffingroup.com>; from willy@thepuffingroup.com on Tue, Jan 25, 2000 at 02:22:43PM -0500
List-ID: <linux-parisc.vger.kernel.org>

Looks like it is mime: quoting from the raw message dump:

Content-Type: TEXT/plain; name="hpcapture3.txt"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.HPX.4.21.0001251938010.15648@gamgee.ntc.nokia.com>
Content-Description: 
Content-Disposition: attachment; filename="hpcapture3.txt"
Content-Transfer-Encoding: 8bit

so, it's a BASE64 encoded text, as I guessed. Since the decoded file is
smaller than the encoded one, which is already on the list, I'll include it
here for your edification:

--------------------8<--------cut here--------------8<----------------------

----------------------------------------------------------------------------
BootRom Version    1.4  
Memory Size:  256 MB
----------------------------------------------------------------------------




(c) Copyright 1990-1994, Hewlett-Packard Company.
All rights reserved

Press <ESCAPE> to stop boot sequence.

Starting Auto boot


Loading Initial Program Loader


IPL successfully loaded


Booting

ISL Revision A.00.38  OCT 26, 1994 

ISL booting  hpux

Boot
: disk(2/0/1.6.0.0.0.0.0;0)/stand/vmunix


----------------------------------------------------------------------------
BootRom Version    1.4  
Memory Size:  256 MB
----------------------------------------------------------------------------




(c) Copyright 1990-1994, Hewlett-Packard Company.
All rights reserved

Press <ESCAPE> to stop boot sequence.

Starting Auto boot

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
BOOT_ADMIN> bo lan




Attempting to boot.

Loading Initial Program Loader


IPL successfully loaded


Booting

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Tue Jan 25 17:24:05 EET 2000 by root@specter

Official memory starts at 00008000
Reading parameters...done.

Loading PA-RISC/Linux Kernel...
SOM-Kernel:
aux_header_location: 00000080
som       : 01000080
exec_dfile: 00108000
exec_dsize: 000BC000
exec_dmem : C01C5000
exec_tfile: 00043000
exec_tsize: 000C4008
exec_tmem : C0100000
exec_bsize: 00060B10
exec_entry: C0100000
Code at 0x00100000, size=0x000C4008
Data at 0x001C5000, size=0x000BC000
BSS  at 0x00281000.
exec_entry: C0100000

Transferring control to kernel. (At entry point 0x00100000)
!.iodc_con_init
Console: switching to IODC console
The Kernel has started...
Free memory starts at: 0xc02e1af0
FP CCR was 0x0, will be set to 0xc0
model   00006190 00000481 00000000 00000000 7804f0a4 00000000 00000004 00000072 00000072
vers    0000000b
CPUID vers 0 rev 0
Model: <NULL> with 128 MB RAM.
CPU(s): 1 x <unknown> at 80.000000 MHz
Searching for devices in PDC firmware...  an older box...
Found devices:
1. Mirage 80 GSC Builtin Graphics (10) at 0xf8000000, versions 0x10, 0x0, 0x85, 0x0, 0x0
2. Mirage 80 Core BA (11) at 0xf0100000, versions 0x2b, 0x0, 0x81, 0x0, 0x0
3. Mirage 80 Core SCSI (10) at 0xf0106000, versions 0x2b, 0x0, 0x82, 0x0, 0x0
4. Mirage 80 Core LAN (802.3) (10) at 0xf0107000, versions 0x2b, 0x0, 0x8a, 0x0, 0x0
5. Mirage 80 Core RS-232 (10) at 0xf0105000, versions 0x2b, 0x0, 0x8c, 0x0, 0x0
6. Mirage 80 Core Centronics (10) at 0xf0102000, versions 0x2b, 0x0, 0x74, 0x0, 0x0
7. Mirage 80 Audio (10) at 0xf0104000, versions 0x2b, 0x0, 0x7b, 0x0, 0x0
8. Mirage 80 Core PC Floppy (10) at 0xf010a000, versions 0x2b, 0x0, 0x83, 0x0, 0x0
9. Mirage 80 Core PC Keyboard (10) at 0xf0108000, versions 0x2b, 0x0, 0x84, 0x0, 0x0
10. Mirage 80 Core PC Keyboard (10) at 0xf0108100, versions 0x2b, 0x0, 0x84, 0x0, 0x0
11. Unknown device (11) at 0xf0200000, versions 0x10, 0x0, 0x8e, 0x0, 0x0
12. Pace Core HIL (10) at 0xf0201000, versions 0x10, 0x0, 0x73, 0x0, 0x0
13. Mirage 80 Wax RS-232 (10) at 0xf0202000, versions 0x10, 0x0, 0x8c, 0x0, 0x0
14. Mirage 80  (0) at 0xfffbe000, versions 0x619, 0x0, 0x4, 0x0, 0x81
15. Mirage 80 (1) at 0xfffbf000, versions 0x4f, 0x0, 0x9, 0x0, 0x0
That's a total of 15 devices.
Linux version 2.3.29 (root@specter) (gcc version 2.95.1 19990816 (release)) #2 Tue Jan 25 17:14:23 EET 2000
init_bootmem 738 32768
free_bootmem 002e2af0 07d1d510
d_conf 61402000
initrd: c01cb000-c026d800
command_line: /stand/vmlinux HOME=/ TERM=LINUX console=tty

pagetable_init
totalpages: 00008000
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
trap_init
#Console: mono IODC console 80x34
iodc_con_initConsole: switching to IODC consoleThe Kernel has started...Free memory starts at: 0xc02e1af0FP CCR was 0x0, will be set to 0xc0model   00006190 00000481 00000000 00000000 7804f0a4 00000000 00000004 00000072 00000072vers    0000000bCPUID vers 0 rev 0Model: <NULL> with 128 MB RAM.CPU(s): 1 x <unknown> at 80.000000 MHzSearching for devices in PDC firmware...  an older box...Found devices:1. Mirage 80 GSC Builtin Graphics (10) at 0xf8000000, versions 0x10, 0x0, 0x85, 0x0, 0x02. Mirage 80 Core BA (11) at 0xf0100000, versions 0x2b, 0x0, 0x81, 0x0, 0x03. Mirage 80 Core SCSI (10) at 0xf0106000, versions 0x2b, 0x0, 0x82, 0x0, 0x04. Mirage 80 Core LAN (802.3) (10) at 0xf0107000, versions 0x2b, 0x0, 0x8a, 0x0, 0x05. Mirage 80 Core RS-232 (10) at 0xf0105000, versions 0x2b, 0x0, 0x8c, 0x0, 0x06. Mirage 80 Core Centronics (10) at 0xf0102000, versions 0x2b, 0x0, 0x74, 0x0, 0x07. Mirage 80 Audio (10) at 0xf0104000, versions 0x2b, 0x0, 0x7b, 0x0, 0x08. Mirage 80 Core PC Floppy (10) at 0xf010a000, versions 0x2b, 0x0, 0x83, 0x0, 0x09. Mirage 80 Core PC Keyboard (10) at 0xf0108000, versions 0x2b, 0x0, 0x84, 0x0, 0x010. Mirage 80 Core PC Keyboard (10) at 0xf0108100, versions 0x2b, 0x0, 0x84, 0x0, 0x011. Unknown device (11) at 0xf0200000, versions 0x10, 0x0, 0x8e, 0x0, 0x012. Pace Core HIL (10) at 0xf0201000, versions 0x10, 0x0, 0x73, 0x0, 0x013. Mirage 80 Wax RS-232 (10) at 0xf0202000, versions 0x10, 0x0, 0x8c, 0x0, 0x014. Mirage 80  (0) at 0xfffbe000, versions 0x619, 0x0, 0x4, 0x0, 0x8115. Mirage 80 (1) at 0xfffbf000, versions 0x4f, 0x0, 0x9, 0x0, 0x0
That's a total of 15 devices.
Linux version 2.3.29 (root@specter) (gcc version 2.95.1 19990816 (release)) #2 T
ue Jan 25 17:14:23 EET 2000
init_bootmem 738 32768
free_bootmem 002e2af0 07d1d510
d_conf 61402000
initrd: c01cb000-c026d800
command_line: /stand/vmlinux HOME=/ TERM=LINUX console=tty

pagetable_init
totalpages: 00008000
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
trap_init
Console: mono IODC console 80x34
register_console
Calibrating delay loop... 77.99 BogoMIPS
max_low_pfn 32768
Memory: 125740k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c7ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c7ffe004, name=test-cachep)
kmem_test() - finished
c7ff0000 c7ff8000 c7fee000 c7ffc000
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
switch_to c01c6000 c7fe8000
Lasi version 0 at 0xf0100000 found.
request_irq(2, c01b9350, 0x0, lasi, c7feb060)
enable_irq(0 + 2) called but no support
Lasi IRQ 2 EIM 0xfffe0002<4>
lasi_alloc_irq(0xf0105000) 0x100 + 26 = 282
Found LASI serial #0 at 0xf0105000, IRQ 282
ttyS00 at iomem 0xf0105800 (irq = 282) is a 16550A
lasi_alloc_irq(0xc02db060): No known LASI owns device at 0xf0202000
IRQ not found for lasi serial at 0xf0202000
Warning : device (10, 0x10, 0x0, 0x8c, 0x0) NOT claimed by Lasi serial 712, 715 
or similiar
Initializing lasi keyboard port at 0xf0108000...
lasi_alloc_irq(0xf0108000) 0x100 + 5 = 261
request_irq(261, c01b8158, 0x0, GSC PS/2, f0108000)
lasi_enable_irq(c7feb060, 5) IMR 0x4000000 addr f0100004
do_irq_mask 20000000 c026e31c c7fe8740
do_irq_mask 04000000 c7fbe020 c7fe8740
Initializing lasi mouse port at 0xf0108100...
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
Serial driver version 4.91 (1999-11-17) with no serial options enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 650 blocks [1 disk] into ram disk... |/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|done.
iodc_con_init
Console: switching to mono IODC console 80x34
VFS: Mounted root (ext2 filesystem).
tty_open
vt_console_device returning [0 0] (4 1) 0401
searching for 4/1
found 136/[0,256]
found 128/[0,256]
found 3/[0,256]
found 2/[0,256]
found 5/[64,4]
found 4/[64,4]
found 4/[0,1]
found 5/[2,1]
found 5/[1,1]
found 5/[0,1]
found 4/[1,63]
driver: -1070745744
retval 0
driver.open 0
execve /sbin/init c01ca008 c01ca030
do_execve
reading c014d2a8 c7fe8808 c7fe85c8 128
returned 128
02100108 05124000 00000000 00000000
00000000 00000000 000039c3 00000080
000000b4 00045535 40006d38 00000138
00000004 000001c8 00000013 000004fc
00000000 000004fc 000001e8 000004c0
00000003 000006e4 00000000 000006e4
00000000 000006e4 00000000 000006e4
00000000 00045000 00000535 4702100b
search_binary_handler
trying c016f4c0
load_som_binary
It seems to be a valid SOM executable
reading c014d2a8 c7fe8888 c7fb4140 180
returned 180
10000004 00000028 0003e044 00001000
00000000 00006000 40001000 0003f000
0000ef10 000039c0 00000000 00000000
8000000b 00000004 00000000 80000001
00000020 39323435 332d3037 42000000
31312e30 31000000 00000000 386001ae
00000000 80000001 00000020 39323435
332d3037 42000000 31312e30 34000000
do_mmap c7efc0e0 00001000 0003f000 00000005 00001806 00000000
miscoloured mmap
do_mmap c7efc0e0 40001000 00006000 00000007 00001806 0003f000
miscoloured mmap
do_mmap 00000000 40007000 0000f000 00000007 00000006 00000000
miscoloured mmap
bprm->p: 2001ffda
stack_base 20000000 fc000000
stack_base 20001000 fc000000
stack_base 20002000 fc000000
stack_base 20003000 fc000000
stack_base 20004000 fc000000
stack_base 20005000 fc000000
stack_base 20006000 fc000000
stack_base 20007000 fc000000
stack_base 20008000 fc000000
stack_base 20009000 fc000000
stack_base 2000a000 fc000000
stack_base 2000b000 fc000000
stack_base 2000c000 fc000000
stack_base 2000d000 fc000000
stack_base 2000e000 fc000000
stack_base 2000f000 fc000000
stack_base 20010000 fc000000
stack_base 20011000 fc000000
stack_base 20012000 fc000000
stack_base 20013000 fc000000
stack_base 20014000 fc000000
stack_base 20015000 fc000000
stack_base 20016000 fc000000
stack_base 20017000 fc000000
stack_base 20018000 fc000000
stack_base 20019000 fc000000
stack_base 2001a000 fc000000
stack_base 2001b000 fc000000
stack_base 2001c000 fc000000
stack_base 2001d000 fc000000
stack_base 2001e000 fc000000
stack_base 2001f000 c7eef000
mem_map disagrees with c122b77c at 2001f000
set_pte c7ef607c 07eef581
(start_brk) 40016000
(end_code) 00040000
(start_code) 00001000
(end_data) 40007000
(start_stack) 2001fff8
(brk) 40016000
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd00c 07ed3502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3004 07ec1513
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3018 07ec6513
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd010 07eb4513
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef6088 07eb2591
syscall 57 20022090 00000000 00000000 696e7578 = 0 (-> 0000431b)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd004 07ea1502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef6080 07eb0591
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3044 01001502
syscall 71 00000000 00000020 00000007 00000012do_mmap 00000000 00000000 00000020
 00000007 00000012 00000012
 = -22 (-> 0000485b)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3044 07e91513
syscall 68 ffffffea ffffffff 00000007 00000012 = -251 (-> 00004877)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef303c 0100f502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd03c 07ebf502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3054 01005502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3008 07ea2503
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0b8 07ebe502
syscall 224 0002e820 06211988 00000570 06211989 = -251 (-> 0000f293)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd058 07e96502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd06c 07eab502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd098 07e86502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3010 07e84503
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd05c 07ea7502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0ec 07e9b502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0d4 07e95502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef6084 07e51591
syscall 132 00002711 00000045 00000024 0000008b = 528 (-> 00026dbf)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd064 07ea9502
syscall 17 40015f18 00000000 40015f18 00000000 = 1073835800 (-> 0002ee37)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3054 07e85513
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd060 07ea8502
syscall 17 40017f0c ffffffff 00000001 00000000 = 1073843980 (-> 0002ee37)
syscall 17 40018000 00000000 00002000 00000000 = 1073844224 (-> 0002ee37)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef305c 07e97513
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd068 07eaa502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd070 07eac513
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0bc 07e8f513
syscall 54 00000000 40125401 20020578 40017f2d = 0 (-> 00016dbf)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd078 07e9e513
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd074 07ead513
syscall 54 00000001 40125401 200207b8 40004e24 = 0 (-> 00016dbf)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0a4 07e99502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef3034 07e9d513
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0a8 07e9a502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0b0 07e9c502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd080 07e80502
syscall 4 00000001 4000d000 00000020 0900deeeStand-alone shell (version 2.1)
 = 32 (-> 0002025f)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd07c 07e7f502
syscall 224 0002e820 06211988 00000570 00000000 = -251 (-> 0002ef0f)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0d8 07e76502
syscall 108 00000002 20020570 20020580 00000000 = -251 (-> 0002ef43)
syscall 108 00000003 20020570 20020580 00000000 = -251 (-> 0002ef43)
syscall 54 00000000 40125401 20022df8 00000000 = 0 (-> 00016dbf)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd018 07e56502
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd044 07e41502
syscall 4 00000001 40001768 00000002 0900deee>  = 2 (-> 0002025f)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7ef608c 07e83591
syscall 54 00000000 40125401 20023138 40004e20 = 0 (-> 00016dbf)
current = c7fe8000, mm = c7ef9040, mmap_sem = c7ef905c
set_pte c7efd0b4 07e8d502
syscall 3 00000000 40013000 00002000 0900deeedel_from_runqueue c7fe8000(1), 1
del_from_runqueue c7fe8000
switch_to c7fe8000 c7fb8000
del_from_runqueue c7fb8000(3), 3
del_from_runqueue c7fb8000
switch_to c7fb8000 c7fba000
bdflush


del_from_runqueue c7fba000(2), 2
del_from_runqueue c7fba000
switch_to c7fba000 c01c6000
switch_to c01c6000 c7fb8000
del_from_runqueue c7fb8000(3), 3
del_from_runqueue c7fb8000
switch_to c7fb8000 c01c6000
switch_to c01c6000 c7fba000
del_from_runqueue c7fba000(2), 2
del_from_runqueue c7fba000
switch_to c7fba000 c01c6000
switch_to c01c6000 c7fb8000
del_from_runqueue c7fb8000(3), 3
del_from_runqueue c7fb8000
switch_to c7fb8000 c01c6000
switch_to c01c6000 c7fba000
del_from_runqueue c7fba000(2), 2
del_from_runqueue c7fba000
switch_to c7fba000 c01c6000
switch_to c01c6000 c7fb8000
del_from_runqueue c7fb8000(3), 3
del_from_runqueue c7fb8000
switch_to c7fb8000 c01c6000
switch_to c01c6000 c7fba000
del_from_runqueue c7fba000(2), 2
del_from_runqueue c7fba000
switch_to c7fba000 c01c6000
switch_to c01c6000 c7fb8000
del_from_runqueue c7fb8000(3), 3
del_from_runqueue c7fb8000
switch_to c7fb8000 c01c6000
switch_to c01c6000 c7fba000
del_from_runqueue c7fba000(2), 2
del_from_runqueue c7fba000
switch_to c7fba000 c01c6000
switch_to c01c6000 c7fb8000
del_from_runqueue c7fb8000(3), 3
del_from_runqueue c7fb8000
switch_to c7fb8000 c01c6000
switch_to c01c6000 c7fba000
del_from_runqueue c7fba000(2), 2
del_from_runqueue c7fba000
switch_to c7fba000 c01c6000
switch_to c01c6000 c7fb8000
del_from_runqueue c7fb8000(3), 3
del_from_runqueue c7fb8000
switch_to c7fb8000 c01c6000
switch_to c01c6000 c7fba000
del_from_runqueue c7fba000(2), 2
del_from_runqueue c7fba000
switch_to c7fba000 c01c6000
