Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from DS9.gjs.dyndns.org (81dyn37.com21.casema.net [213.17.100.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 683C6482B
	for <parisc-linux@parisc-linux.org>; Fri,  2 Aug 2002 10:41:29 -0600 (MDT)
Received: from klingon (Klingon.gjs.dyndns.org [192.168.0.10])
	by DS9.gjs.dyndns.org (8.11.6/8.11.6) with ESMTP id g72GfR609118
	for <parisc-linux@parisc-linux.org>; Fri, 2 Aug 2002 18:41:27 +0200
From: "Gert-Jan van der Stroom" <gertjan@nki.nl>
To: <parisc-linux@parisc-linux.org>
Date: Fri, 2 Aug 2002 18:41:38 +0200
Message-ID: <000001c23a43$796cf9c0$0a00a8c0@klingon>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Subject: [parisc-linux] Unable to install debian 3.0 hppa nonus on HP9000 E55
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

Hi, I am trying to install linux on a HP9000 E55.
When I boot from cd, I get the following:

Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16
17:09:00 M
ST 2002
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00004831 00000481 00000000 00000000 07becb48 100000f0 00000004
00000072 00
000072
vers 0000000b
model 9000/856
Total Memory: 64 Mb
initrd: 13d65000-13fef286
initrd: reserving 03d65000-03fef286 (mem_max 04000000)
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: ramdisk_size=8192 root=/dev/ram console=ttyS0
TERM=vt102 pa
lo_kernel=0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 95.84 BogoMIPS
Memory: 58864k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Searching for devices...
Found devices:
1. Java BC GSC+ Port (7) at 0xfffb8000 [56], versions 0x503, 0x0, 0xc
2. WB-96 Core BA (11) at 0xf0100000 [60], versions 0x11, 0x1, 0x81,
additional
addresses: 0xf010c000
3. WB-96 Core LAN (802.3) (10) at 0xf0107000 [60/6], versions 0x11, 0x1,
0x8a
4. WB-96 (E45) (0) at 0xfffbe000 [62], versions 0x483, 0x1, 0x4
5. Memory (1) at 0xfffbf000 [63], versions 0x25, 0x0, 0x9
CPU(s): 1 x PA7100LC (PCX-L) at 96.000000 MHz
Lasi version 0 at 0xf0100000 found.
LED display at f010c000 registered
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
Journalled Block Device driver loaded
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI en
abled
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x20028000 to 0x20028740:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x20028000 to 0x20028b80:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

--cut-- repeated 3 lines above

Dumping Stack from 0x20050000 to 0x20057bc0:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x20058000 to 0x20058000:

Kernel Fault: Code=15 regs=10058000 (Addr=20050004)

YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000011100001110 Not tainted
r00-03 00000000 10303810 10102494 20050000
r04-07 102b3000 20050000 20057bc0 0000002f
r08-11 10315fe4 10303b4c 10000080 10303810
r12-15 00000000 00000001 00000000 f0000368
r16-19 10057bc0 00000000 00000000 00000000
r20-23 10303810 00006e97 00000000 000003a8
r24-27 00000001 00000001 10303b00 102f0010
r28-31 00000030 00000000 10058000 00000040
sr0-3 00000000 00000000 00000000 00000000
sr4-7 00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10101e60 10101e64
IIR: 0c681097 ISR: 00000000 IOR: 20050004
CPU: 0 CR30: 10028000 CR31: 103a0000
ORIG_R28: 00000000

Do you know the solution ?

Thanks in advance,

Gert-Jan van der Stroom
