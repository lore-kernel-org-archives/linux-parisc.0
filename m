Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beldar.com (ns.beldar.com [65.163.106.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DED4482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Nov 2001 19:32:57 -0700 (MST)
Received: from beldar.com (IDENT:root@dhcp-124.beldar.com [65.163.106.124])
	by beldar.com (8.9.3/8.9.3) with ESMTP id VAA53920
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Nov 2001 21:48:14 -0500 (EST)
	(envelope-from lansing@beldar.com)
Message-ID: <3BEF3746.FB93DC1@beldar.com>
Date: Sun, 11 Nov 2001 21:43:18 -0500
From: "Craig D. Lansing (root)" <lansing@beldar.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] J2240 - Almost There...
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

After using my CD burner to create several nice coasters, I have been
able to create a couple of CD's from which my J2240 will attempt to
boot.  I think that I am almost there, but need someone to show me the
error of my ways.  Disclaimer: I am not a System Admin by trade.  I have
been an HP-UX user since about version 7, but have not had a box of my
own to play with until I pulled this J2240 from the trash.  The system
is a J2240 2-way, 2.5GB RAM, 2x8GB internal FW-SCSI Disks, DDS-III,
internal Toshiba SCSI CD-ROM, 21" graphics console.

Here's what I get when I try to boot from the 0.9.2 iso CD after
changing my boot path to the internal CD-ROM (SESCSI.2.0):

Boot IO Dependent Code (IODC) revision 153

HARD Booted

palo ipl 0.92 root@spqr Mon Jun 25 23:03:13 CEST 2001
0/vmlinux32 2853588 bytes @ 0x6ad6800
0/vmlinux64 3585851 bytes @ 0x6d8f800
0/ramdisk 1991209 bytes @ 0x70fb000

Command Line: 'root=/dev/ram console=tty0 sti=0 sti_font=VGA8x16
TERM=linux'

Kernel: partition 0 file /vmlinux
Ramdisk: partition 0 file /ramdisk
Warning: Kernel name doesn't end with 32 or 64... Guessing 32
ELF32 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 010000000 size 1606948 mediaptr 0x1000
Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8

Loading ramdisk 1991209 bytes @ 3fe09000...
branch to kernel entry point 0x00100000
Set default PSW W bit to 0

<System hangs here>

---------------------------------------------------------------------------

Booting from the 0.9 sti iso CD gives the above and goes a little
further:

[snip]

CPUID Vers 14 rev 23
Model 9000/782/J2240

[snip]

Found devices:
1. SummitHawk Dino RS-232(10)....
[snip]
18. SummitHawk memory(1)
[snip]
Kernel command line HOME=/ TERM=linux root=/dev/ram console=tty0 sti=0
sti_font=VGA8x16
Console: colour dummy device 80x25

<System hangs here>

---------------------------------------------------------------------------



TIA,
Craig
