Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA00587
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Feb 2000 10:56:02 -0700
Message-ID: <20000214165620.28571.qmail@web502.mail.yahoo.com>
Date: Mon, 14 Feb 2000 08:56:20 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] State Of The Port [2000/02/13]
To: willy@thepuffingroup.com, parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-424238335-950547380=:27520"
List-ID: <linux-parisc.vger.kernel.org>

--0-424238335-950547380=:27520
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- willy@thepuffingroup.com wrote:
> 
> State of the Port
...
> So what does it currently work on?
> 
>  * C3000/J5000 (no serial input yet)
>  * A180
>  * C360
>  * 712
>
... 
Compiling and booting the latest (20000213) cvs
version on my 715/33 is partly successful. It ends
with the RAMDISK loaded message because after this the
kernel is switching to a serial console which does not
(yet) exist.

Changing CONFIG_VT=y, CONFIG_VT_CONSOLE=y,
CONFIG_SERIAL_CONSOLE=n and CONFIG_IODC_CONSOLE=y 
leads to a lot of undefined symbols:
ld: Unsatisfied symbols:
   pckbd_getkeycode (code)
   pckbd_setkeycode (code)
   pckbd_leds (code)
   keymap_count (data)
   plain_map (data)
   accent_table (data)
   func_buf (data)
   func_table (data)
   accent_table_size (data)
   funcbufleft (data)
   pckbd_unexpected_up (code)
   funcbufsize (data)
   funcbufptr (data)
   key_maps (data)
It seems that CONFIG_GSC_PS2 is needed to include
these routines (although the 715/33 does not have a
GSC or PS2). But after defining CONFIG_GSC_PS2=y the
kernel boot ends with the attempt to kill the init
task. And the are two "kernel BUG" messages again,
this time in block_dev.c:411!

So everything has improved compared to the state
before the 2.3.42 merge, where even a defconfig-kernel
ended with lots of kernel BUG messages on my 715/33.

I have attached the complete boot log of this test.
Has anyone an idea what's going wrong?

Also: the HIL-driver is still not working. If I
include it I get lots of kernel BUG messages in
pagetable_init.

Ulrich
__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
--0-424238335-950547380=:27520
Content-Type: text/plain; name="last_boot.txt"
Content-Description: last_boot.txt
Content-Disposition: inline; filename="last_boot.txt"

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Mon Feb 14 15:14:57 MET 2000 by root@be5359

Official memory starts at 00006400
Reading parameters...done.

Loading PA-RISC/Linux Kernel...
SOM-Kernel:
aux_header_location: 00000080
som       : 01000080
exec_dfile: 00156000
exec_dsize: 000FB000
exec_dmem : C0200000
exec_tfile: 00056000
exec_tsize: 000FF008
exec_tmem : C0100000
exec_bsize: 3FD05030
exec_entry: C0100000
Code at 0x00100000, size=0x000FF008
Data at 0x00200000, size=0x000FB000
BSS  at 0x002FB000.
exec_entry: C0100000

Transferring control to kernel. (At entry point 0x00100000)
The Kernel has started...
Free memory starts at: 0xc035bde0
PALO command line: '/stand/vmlinux HOME=/ TERM=LINUX console=tty'
FP CCR was 0x0, will be set to 0xc0
model   00003110 00000481 00000000 00000000 78294d38 ffffffff 00000004 0000000a
0000000a
vers    00000013
CPUID vers 0 rev 0
Model: Scorpio Jr.(715/33) with 48 MB RAM (Using 48 MB).
CPU(s): 1 x PA7100LC at 33.333500 MHz
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
Linux version 2.3.42 (root@be5359) (gcc version 2.8.1) #6 Mon Feb 14 17:11:40 ME
T 2000
init_bootmem 860 12288
init_bootmem complete
free_bootmem 0035c3e0 02ca3c20
d_conf 51402000
initrd: c0208000-c02dc800
pagetable_init
set_pte c1100000 002e5309
miscoloured (c013c554)
set_pte c1100004 002de309
miscoloured (c013c56c)
On node 0 totalpages: 00003000
zone(0): 6144 pages.
zone(1): 6144 pages.
zone(2): 0 pages.
trap_init
iodc_con_init
Console: switching to IODC console
#Console: mono IODC console 80x34
The Kernel has started...Free memory starts at: 0xc035bde0PALO command line: '/s
tand/vmlinux HOME=/ TERM=LINUX console=tty'FP CCR was 0x0, will be set to 0xc0mo
del#00003110 00000481 00000000 00000000 78294d38 ffffffff 00000004 0000000a 0000
000avers#00000013CPUID vers 0 rev 0Model: Scorpio Jr.(715/33) with 48 MB RAM (Us
ing 48 MB).CPU(s): 1 x PA7100LC at 33.333500 MHzSearching for devices in PDC fir
mware...  an older box...Found devices:1. Stinger Optional Graphics (10) at 0xf4
000000, versions 0x6, 0x0, 0x77, 0x0, 0x02. Scorpio Jr. Core BA (11) at 0xf082f0
00, versions 0xb, 0x0, 0x70, 0x0, 0x03. Scorpio Jr. Core SCSI (10) at 0xf0825000
, versions 0xb, 0x0, 0x71, 0x0, 0x04. Scorpio Jr. Core LAN (802.3) (10) at 0xf08
26000, versions 0xb, 0x0, 0x72, 0x0, 0x05. Scorpio Jr. Core HIL (10) at 0xf08210
00, versions 0xb, 0x0, 0x73, 0x0, 0x06. Scorpio Jr. Core RS-232 (10) at 0xf08230
00, versions 0xb, 0x0, 0x75, 0x0, 0x07. Scorpio Jr. Core RS-232 (10) at 0xf08220
00, versions 0xb, 0x0, 0x75, 0x0, 0x08. Scorpio Jr. Core Centronics (10) at 0xf0
824000, versions 0xb, 0x0, 0x74, 0x0, 0x09. Scorpio Jr. Audio (10) at 0xf1000000
, versions 0xb, 0x0, 0x7b, 0x0, 0x010. Scorpio Jr.(715/33) (0) at 0xfffbe000, ve
rsions 0x311, 0x0, 0x4, 0x0, 0x8111. Scorpio Jr. (1) at 0xfffbf000, versions 0x1
b, 0x0, 0x9, 0x0, 0x0That's a total of 11 devices.Linux version 2.3.42 (root@be5
359) (gcc version 2.8.1) #6 Mon Feb 14 17:11:40 MET 2000init_bootmem 860 12288in
it_bootmem completefree_bootmem 0035c3e0 02ca3c20d_conf 51402000initrd: c0208000
-c02dc800
pagetable_init
set_pte c1100000 002e5309
miscoloured (c013c554)
set_pte c1100004 002de309
miscoloured (c013c56c)
On node 0 totalpages: 00003000
zone(0): 6144 pages.
zone(1): 6144 pages.
zone(2): 0 pages.
trap_init
iodc_con_init
Console: switching to IODC console
Console: mono IODC console 80x34
register_console
Calibrating delay loop... 26.62 BogoMIPS
Memory: 43816k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c2ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c2ffe004, name=test-cachep)
kmem_test() - finished
c2ff0000 c2ff8000 c2fee000 c2ffc000
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
request_irq(259, c01be1d8, 0x0, asp, c2fea060)
Lasi IRQ 259 EIM 0xfffe0003
iosapic_init()
calling get_irt_size
get_irt_size: -1
pdc_pci_irt_size: -1
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 850 blocks [1 disk] into ram disk... |/-\|/-\|/-\|/-\|/-\|/-\|/
-\|/-\|/-\|/-\|/-\|/-\|/-\|/done.
kernel BUG at block_dev.c:411!
kernel BUG at block_dev.c:411!
VFS: Mounted root (ext2 filesystem).
tty_open
vt_console_device returning [0 0] (4 1) 0401
searching for 4/1
found 136/[0,256]
found 128/[0,256]
found 3/[0,256]
found 2/[0,256]
found 5/[64,64]
found 4/[64,64]
found 4/[0,1]
found 5/[2,1]
found 5/[1,1]
found 5/[0,1]
found 4/[1,63]
driver: -1070243152
retval 0
driver.open 0
execve /sbin/init c0207008 c0207030
do_execve
reading c01518e8 c2fe6808 c2fe65c8 128
returned 128
02100108 05124000 00000000 00000000
00000000 00000000 00002f13 00000080
000000b4 00048ac4 40005980 00000138
00000004 000001c8 00000014 00000524
00000000 00000524 00000208 000004e8
00000003 0000e9c0 000000a6 0000072c
0000058f 00007658 00000000 00007658
00007364 00040000 00008ac4 4702a90d
search_binary_handler
trying c0175550
load_som_binary
It seems to be a valid SOM executable
reading c01518e8 c2fe6888 c2fca380 180
returned 180
10000004 00000028 000297a4 00001000
00011000 00005000 40001000 0003b000
0000c308 00002f10 00000001 00000000
8000000b 00000004 00000000 80000001
00000020 39323435 332d3037 42000000
31312e30 36000000 00000000 3891e6d2
00000000 80000001 00000020 39323435
332d3037 42000000 31312e30 34000000
do_mmap c2ec40e0 00001000 0002a000 00000005 00001806 00000011
miscoloured mmap
do_mmap c2ec40e0 40001000 00005000 00000007 00001806 0000003b
miscoloured mmap
do_mmap 00000000 40006000 0000d000 00000007 00000006 00000000
miscoloured mmap
bprm->p: 2001ffda
stack_base 20000000 7ffc3000
stack_base 20001000 7ffc3000
stack_base 20002000 7ffc3000
stack_base 20003000 7ffc3000
stack_base 20004000 7ffc3000
stack_base 20005000 7ffc3000
stack_base 20006000 7ffc3000
stack_base 20007000 7ffc3000
stack_base 20008000 7ffc3000
stack_base 20009000 7ffc3000
stack_base 2000a000 7ffc3000
stack_base 2000b000 7ffc3000
stack_base 2000c000 7ffc3000
stack_base 2000d000 7ffc3000
stack_base 2000e000 7ffc3000
stack_base 2000f000 7ffc3000
stack_base 20010000 7ffc3000
stack_base 20011000 7ffc3000
stack_base 20012000 7ffc3000
stack_base 20013000 7ffc3000
stack_base 20014000 7ffc3000
stack_base 20015000 7ffc3000
stack_base 20016000 7ffc3000
stack_base 20017000 7ffc3000
stack_base 20018000 7ffc3000
stack_base 20019000 7ffc3000
stack_base 2001a000 7ffc3000
stack_base 2001b000 7ffc3000
stack_base 2001c000 7ffc3000
stack_base 2001d000 7ffc3000
stack_base 2001e000 7ffc3000
stack_base 2001f000 c2d1f000
set_pte c2ebe07c 02d1f723
(start_brk) 40013000
(end_code) 0002b000
(start_code) 00001000
(end_data) 40006000
(start_stack) 2001fff8
(brk) 40013000
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5008 02d02627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebc004 02d01627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebc014 02d05627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec500c 02d03627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebe088 02d22723
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5004 02c01605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebe080 02d20723
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebc01c 01007605
do_mmap 00000000 00000000 00000028 00000007 00000012 00000000
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebc01c 02d07627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebc048 01012605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5010 02d04605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebc044 01011605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5048 02c12605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5098 02c26605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5014 02c05605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5094 02c25605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5040 02c10605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5044 02c11605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5024 02d09605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec504c 02c13605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec509c 02c27605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5050 02c14627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebe084 02c21723
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5028 02d0a627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec506c 02c1b605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5084 02b21627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebc00c 02c03607
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5054 02c15627
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec505c 02c17605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5060 02c18605
No such device
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ec5068 02c1a605
current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
set_pte c2ebc038 0100e605
Kernel panic: Attempted to kill init!

--0-424238335-950547380=:27520--
