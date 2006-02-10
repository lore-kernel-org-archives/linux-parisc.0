From: Berthold Gunreben <b.gunreben@web.de>
Subject: [parisc-linux] crash in mmap.c
Date: Fri, 10 Feb 2006 20:54:42 +0100
Message-ID: <200602102054.42633.b.gunreben@web.de>
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

Hi,

I recently played around with gcc-4.1 and glibc to build a glibc with nptl 
support. Unfortunately I don't know right now, where to get current patches 
to glibc (cvs.parisc-linux.org seems to be outdated). But while doing this, 
running binaries with this glibc under gdb crashed my machine, while without 
gdb, the binaries would just segfault. Here is what happened to the kernel 
(2.6.15-rc7-pa0) using the TOC button:

General Registers 0 - 31
00-03   0000000000000000  00000000fff0bdc0  00000000101247a8  0000000000000000
04-07   000000000000688d  00000000102cc568  0000000000000000  0000000000035150
08-11   0000000000000001  0000000000035150  00000000000b5088  0000000000035150
12-15   0000000000035150  0000000000000000  0000000000024000  0000000000035150
16-19   0000000000035150  0000000000035150  0000000000035150  00000000a08841fa
20-23   0000000000000000  0000000000000000  0000000010124554  000000002f59089b
24-27   000000000028e7b0  00000000000f4240  0000000020e6da00  0000000010318010
28-31   000000000000688e  0000000000086c40  000000004bf342c0  00000000101247c4

<Press any key to continue (q to quit)>

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   000000000000115a  0000000000000000  00000000000000c0  000000000000001f
12-15   0000000000000000  0000000000000000  000000000010b000  00000000f8000000
16-19   00000040a0941653  0000000000000000  00000000101247d8  00000000020008bc
20-23   0000000000000000  0000000000000000  000000ff0004f40f  0000000000000000
24-27   000000000035f000  000000003e9ec000  00000000ffffffff  0000000040001140
28-31   00000000ffffffff  00000000ffffffff  000000004bf34000  0000000010370000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000f2d
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x00000000101247dc
CPU State                    = 0x9e000001

messages (/var/log/warn):
Feb 10 16:26:28 glaurung kernel: kernel BUG at mm/mmap.c:1956!
Feb 10 16:26:28 glaurung kernel: Backtrace:
Feb 10 16:26:28 glaurung kernel:  [<101583c8>] exit_mmap+0x170/0x190
Feb 10 16:26:28 glaurung kernel:  [<10122f64>] mmput+0x3c/0xb4
Feb 10 16:26:28 glaurung kernel:  [<10127cc8>] do_exit+0x200/0x9ec
Feb 10 16:26:28 glaurung kernel:  [<10128574>] do_group_exit+0xc0/0xc4
Feb 10 16:26:28 glaurung kernel:  [<10108360>] tracesys_exit+0x0/0x34
Feb 10 16:26:28 glaurung kernel:
Feb 10 16:26:28 glaurung kernel: Kernel panic - not syncing: BUG!

System.map
10124570 T print_tainted
10124658 T panic
101247f0 t __call_console_drivers
1012486c t _call_console_drivers

This is easily reproduceable, I just running gdb ls results in this behavior. 
So besides having a broken glibc, it looks like I also caught a problem in 
the kernel...

Maybe someone knowledgeable could look at it.

Thanks

Berthold
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
