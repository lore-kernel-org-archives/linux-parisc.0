Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA09907
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Apr 2000 00:34:42 -0600
Received: from gag.com (localhost [127.0.0.1])
	by rover.gag.com (Postfix) with ESMTP id BE6701E9D8
	for <parisc-linux@thepuffingroup.com>; Fri,  7 Apr 2000 00:34:38 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Date: Fri, 07 Apr 2000 00:34:38 -0600
From: Bdale Garbee <bdale@gag.com>
Message-Id: <20000407063438.BE6701E9D8@rover.gag.com>
Subject: [parisc-linux] 712 nfsroot report
List-ID: <linux-parisc.vger.kernel.org>

I had a little time tonight, so I tried to build the kernel tools and kernel
from CVS and boot it with nfsroot on my 712/100.  The build machine was my
dual Celeron 500 running Debian, and the bootp/nfs server is a dual Pentium
Pro elsewhere in the basement also running Debian.  It went pretty well.

Here's what I did:

 - - - - -
2000.04.06

- move everything except this notebook file down one to ~/puffin/Previous

- retrieve stuff to ~/puffin

        export PATH=/opt/puffin/bin:$PATH
        cd /home/bdale/puffin

        export CVSROOT=:ext:bdale@puffin.external.hp.com:/home/cvs/parisc
        cvs co linux-2.3 palo gcc binutils glibc

- hack on palo/Makefile per docs in palo subdir

- install headers

        cd /opt/puffin
        sudo tar xvzf /mirrors/puffin/src/include.tar.gz
        cd /home/bdale/puffin

- build and install fresh binutils

        mkdir binutils-build ; cd binutils-build
        ../binutils/configure --target=hppa1.1-linux --prefix=/opt/puffin \
                --disable-nls
        make -j4
        sudo make install
        cd ..

- build and install fresh gcc 

        mkdir gcc-build ; cd gcc-build
        ../gcc/configure --target=hppa1.1-linux --prefix=/opt/puffin \
                --disable-nls --without-libc
        make -j4 LIBGCC2_INCLUDES=-I/opt/puffin/include
        sudo make install
        cd ..

- build kernel

        (cd linux-2.3 ; make clean ; make oldconfig ; make dep) 
        (cd linux-2.3 ; make -j4 vmlinux)

- build palo, and go for it

        (cd palo ; make)
        (cd linux-2.3 ; make -j4 palo)
        scp palo/lifimage winfree:parisc/lifimage.2000.04.07

- update symlinks on winfree, and try booting the 712

 - - - - -

And here's the log of the boot...  Note that it more or less works.  The NFS
timeout errors are new to me since my pre-puffinfest image, and there were some
obvious "pauses" of a few seconds here and there not always correlated with
those errors.  Let me know if there's anything else I can try. 

Bdale



----------------------------------------------------------------------------
BootRom Version    2.3  
Memory Size:  192 MB
----------------------------------------------------------------------------




(c) Copyright 1990-1993, Hewlett-Packard Company.
All rights reserved

Press <ESCAPE> to stop boot sequence.
Selecting a system to boot.

Booting
palo ipl bdale@chunks Fri Apr  7 00:14:10 MDT 2000
0/vmlinux 1932378 bytes @ 0x6000
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.133.104.8'
Kernel: partition 0 file /vmlinux
ELF32 executable
prepare_loadable 0050368c 2

Entry 0010176c first 00100000 n 4
Segment 0 load 00100000 size 1067412 mediaptr 0x1000
Segment 1 load 00206000 size 96104 mediaptr 0x106000
Segment 2 load 00220000 size 57700 mediaptr 0x11e000
Segment 3 load 00230000 size 8192 mediaptr 0x12d000
branching to kernel entry point 0x0010176c
The Kernel has started...
Free memory starts at: 0xc02a0000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.133.104.8'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00006020 00000481 00000000 00000000 77c2ae08 00000000 00000004 00000072 00000072
vers    0000000c
CPUID vers 0 rev 0
CPU(s): 1 x PA7100(LC?) at 100.000000 MHz
Searching for devices in PDC firmware...  an older box...
Found devices:
1. Gecko 100 GSC Core Graphics (10) at 0xf8000000, versions 0x1d, 0x0, 0x85, 0x0, 0x0
2. Gecko 100 Core BA (11) at 0xf0100000, versions 0x1d, 0x0, 0x81, 0x0, 0x0
3. Gecko 100 Core SCSI (10) at 0xf0106000, versions 0x1d, 0x0, 0x82, 0x0, 0x0
4. Gecko 100 Core Lan (802.3) (10) at 0xf0107000, versions 0x1d, 0x0, 0x8a, 0x0, 0x0
5. Gecko 100 Core RS-232 (10) at 0xf0105000, versions 0x1d, 0x0, 0x8c, 0x0, 0x0
6. Gecko 100 Core Centronics (10) at 0xf0102000, versions 0x1d, 0x0, 0x74, 0x0, 0x0
7. Gecko 100 Audio (10) at 0xf0104000, versions 0x1d, 0x0, 0x7b, 0x0, 0x0
8. Gecko 100 Core PC Floppy (10) at 0xf010a000, versions 0x1d, 0x0, 0x83, 0x0, 0x0
9. Gecko 100 Core PC Keyboard (10) at 0xf0108000, versions 0x1d, 0x0, 0x84, 0x0, 0x0
10. Gecko 100 Core PC Keyboard (10) at 0xf0108100, versions 0x1d, 0x0, 0x84, 0x0, 0x0
11. Gecko 100 (712/100) (0) at 0xfffbe000, versions 0x602, 0x0, 0x4, 0x0, 0x81
12. Gecko 100 (1) at 0xfffbf000, versions 0x39, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
Linux version 2.3.99-pre1 (bdale@chunks) (gcc version 2.9-hppa-991112) #5 Fri Apr 7 00:14:09 MDT 2000
init_bootmem 672 32768
init_bootmem complete
initrd: 00000000-00000000
pagetable_init
miscoloured (c0220cf4)
miscoloured (c0220d0c)
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 89.70 BogoMIPS
Memory: 124916k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c7ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c7ffe004, name=test-cachep)
kmem_test() - finished
c7ff0000 c7ff8000 c7fee000 c7ffc000
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xf0100000 found.
request_irq(258, c01bdaa4, 0x0, lasi, c7fea080)
Lasi IRQ 258 EIM 0xfffe0002<4>
lasi_alloc_irq(0xf0105000) 0x200 + 26 = 538
Found LASI serial #0 at 0xf0105000, IRQ 538
ttyS00 at iomem 0xf0105800 (irq = 538) is a 16550A
lasi_alloc_irq(0xf0107000) 0x200 + 23 = 535
Found LASI lan at 0xf0107000, IRQ 535
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
Starting kswapd v1.6
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: 82596 at 0xf0107000, 00 60 B0 80 A1 D8 IRQ 535.
lasi_82596.c:v1.2 02/13/2000
eth0: lp at 0xc7fb4000 (1720 bytes), lp->scb at 0xc7fb4014
request_irq(535, c01b8c60, 0x0, i82596, c7fedc00)
lasi_enable_irq(c7fea080, 23) IMR 0x100 addr f0100004
lasi_disable_irq(c7fea080, 23) IMR 0x00
lasi_enable_irq(c7fea080, 23) IMR 0x100 addr f0100004
about to RX_START status 0000
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 192.133.104.8, my address is 192.133.104.28
Looking up port of RPC 100003/2 on 192.133.104.8
Looking up port of RPC 100005/1 on 192.133.104.8
VFS: Mounted root (NFS filesystem) readonly.
tty_open
searching for 4/64
found 136/[0,256]
found 128/[0,256]
found 3/[0,256]
found 2/[0,256]
found 5/[64,64]
found 4/[64,64]
driver: -1071058048
retval 0
request_irq(538, c01a3838, 0x4000000, serial, c028fd64)
lasi_enable_irq(c7fea080, 26) IMR 0x120 addr f0100004
driver.open 0
do_execve
reading c017e45c c7fbc7c8 c7fbc588 128
nfs: server 192.133.104.8 not responding, still trying
nfs: server 192.133.104.8 OK
returned 128
02100108 053113cc 00000000 00000000
00000000 00000000 00000000 00000080
00000030 00050015 00000000 000000b0
00000003 0000011c 00000012 00000000
00000000 000003ec 00000160 000000b0
00000000 0000054c 00000000 00050000
00000000 00050000 00000015 00050000
00000000 00050000 00000000 072414b9
trying c0164134
trying c0163b38
load_som_binary
It seems to be a valid SOM executable
reading c017e45c c7fbc848 c7fea680 48
returned 48
00000004 00000028 000451d4 00001000
00001000 00009000 40001000 00047000
0000ccdc 00002f10 00000000 00000000
c7fedc00 00000000 00000000 00000000
00000000 00000000 00000000 00000000
00000000 00000000 00000000 c7feafe0
00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000
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
stack_base 2001f000 c7e1f000
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
(start_brk) 40017000
(end_code) 00047000
(start_code) 00001000
(end_data) 4000a000
(start_stack) 20020028
(brk) 40017000
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
nfs: server 192.133.104.8 not responding, still trying
nfs: server 192.133.104.8 OK
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
Stand-alone shelcurrent = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
l (version 3.4)
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
500 5 1970 53bcurrent = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c

current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
> current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
foo 1073767600, 20020620
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
-ls -l
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
quux
quuuxcurrent = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c

current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
drwxr-xr-x  6 1000     1000         1024  Feb 24 2000  .
drwxr-xr-x  6 1000     1000         1024  Feb 24 2000  ..
drwxrwxrwx  2 0        0            1024  Oct 18 1999  dev
drwxrwxrwx  2 0        0            1024  Aug 22 1999  lost+found
drwxrwxr-x  2 0        0            1024  Oct 19 1999  proc
drwxrwxr-x  2 1000     1000         1024  Feb 24 2000  sbin
> foo 1073767600, 20020620
hellow
quux
quuuxcurrent = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c

current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
do_execve
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
do_execve
do_execve
reading c017e45c c7f506c8 c7f50488 128
returned 128
02100108 05124000 00000000 00000000
00000000 00000000 00002f13 00000080
000000b4 0003a000 40005560 00000138
00000003 000001a4 00000012 000004b0
00000000 000004b0 000001d0 00000474
00000003 0000d99c 00000090 00000680
0000052d 00006e04 00000000 00006e04
00006b98 0003a000 00000000 47028f5c
trying c0164134
trying c0163b38
load_som_binary
It seems to be a valid SOM executable
reading c017e45c c7f50748 c7fb74a0 180
returned 180
10000004 00000028 00025fc4 00001000
0000f000 00005000 40001000 00035000
00009ec0 00002f10 00000000 00000000
8000000b 00000004 00000000 80000001
00000020 39323435 332d3037 42000000
31312e30 36000000 00000000 387ab5ba
00000000 80000001 00000020 39323435
332d3037 42000000 31312e30 34000000
bprm->p: 2001ff9c
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
stack_base 2001f000 c7c1f000
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
(start_brk) 40010000
(end_code) 00027000
(start_code) 00001000
(end_data) 40006000
(start_stack) 2002002c
(brk) 40010000
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
nfs: server 192.133.104.8 not responding, still trying
nfs: server 192.133.104.8 OK
nfs: server 192.133.104.8 not responding, still trying
nfs: server 192.133.104.8 OK
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
nfs: server 192.133.104.8 not responding, still trying
nfs: server 192.133.104.8 OK
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
Hello, worldcurrent = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc

current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7f50000, mm = c7f610e0, mmap_sem = c7f610fc
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
> current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
current = c7fbc000, mm = c7f61040, mmap_sem = c7f6105c
foo 1073767600, 20020620
