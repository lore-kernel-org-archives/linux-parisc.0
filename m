Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rotapile (CPE-203-45-167-61.qld.bigpond.net.au [203.45.167.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB1D54839
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 May 2002 16:53:00 -0600 (MDT)
Received: from rob by rotapile with local (Exim 3.22 #1 (Red Hat Linux))
	id 17CTMB-0003ZI-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 08:52:51 +1000
Subject: Re: [parisc-linux] New testing ISO available with recent
	boot-floppies
From: Robert Stanford <rob@rotapile.com>
To: PA/Linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 28 May 2002 08:52:51 +1000
Message-Id: <1022539971.12551.20.camel@rotapile>
Mime-Version: 1.0
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

I tried the iso on my K580 (PDC console only) and no joy. Is there any
chance of enabling the PDC console (and/or device node in the ramdisk)
in the default kernel or does this introduce issues for other machines?

Robert Stanford


*CUT*
------------------------------------------------------------------------

Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Boot image contains:
    0/vmlinux32 3699025 bytes @ 0x458800
    0/vmlinux64 4733474 bytes @ 0x7e0000
    0/ramdisk 2656804 bytes @ 0xc64000

Information: No console specified on kernel command line. This is
normal.
PALO will choose the console currently used by firmware (serial).Current
comman:
0/vmlinux ramdisk_size=8192 root=/dev/ram initrd=0/ramdisk console=ttyS0
TERM=v2
 0: 0/vmlinux
 1: ramdisk_size=8192
 2: root=/dev/ram
 3: initrd=0/ramdisk
 4: console=ttyS0
 5: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? 4
console=ttyB0
Current command line:
0/vmlinux ramdisk_size=8192 root=/dev/ram initrd=0/ramdisk console=ttyB0
TERM=v2
 0: 0/vmlinux
 1: ramdisk_size=8192
 2: root=/dev/ram
 3: initrd=0/ramdisk
 4: console=ttyB0
 5: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'ramdisk_size=8192 root=/dev/ram console=ttyB0
TERM=vt'
Selected kernel: /vmlinux from partition 0
Selected ramdisk: /ramdisk from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... 
This box can boot either 32 or 64-bit kernels...Both kernels available,
choosine
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 2028032 mediaptr 0x1000
Segment 1 load 002f0000 size 299424 mediaptr 0x1f1000
Segment 2 load 0033c000 size 393548 mediaptr 0x23b000
Segment 3 load 003a0000 size 8192 mediaptr 0x29c000
Segment 4 load 003a8000 size 32768 mediaptr 0x29e000
Segment 5 load 003d1538 size 102176 mediaptr 0x2a6538
Loading ramdisk 2656804 bytes @ 3fd66000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org
