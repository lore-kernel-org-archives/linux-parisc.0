From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] console on ttyS0 broken with 2.6.9-bk6-pa1 ?
Date: Sun, 24 Oct 2004 15:54:52 +0200
Message-ID: <200410241554.52818.deller@gmx.de>
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

I just compiled/booted the latest CVS kernel (2.6.9-bk6-pa1) which seems to boot fine.
Sadly using a serial console is broken. Any ideas ?

This is the bootlog in minicom:

palo ipl 0.99 root@P100 Sat Apr 13 22:21:21 CEST 2002

Boot image contains:
    0/vmlinux32 4714377 bytes @ 0x8000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'HOME=/ root=/dev/sda3 ip=bootp console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 32-bit kernelELF32 executable
Entry 00100368 first 00100000 n 1
Segment 0 load 00100000 size 3780741 mediaptr 0x1000
Branching to kernel entry point 0x00100368.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.9-bk6-pa1 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #96 Sun Oct 24 15:44:48 CEST 2004
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 000060a0 00000481 00000000 00000000 773c7d2c 00000000 00000004 00000072 00000072
vers  0000000c
model 9000/715
Total Memory: 160 Mb
Built 1 zonelists
Kernel command line: HOME=/ root=/dev/sda3 ip=bootp console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux

....<lot's of other messages skipped...>

Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xf0105800 (irq = 90) is a 16550A
Linux version 2.6.9-bk6-pa1 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #96 Sun Oct 24 15:44:48 CEST 2004
Linux version 2.6.9-bk6-pa1 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #96 Sun Oct 24 15:44:48 CEST 2004
Linux version 2.6.9-bk6-pa1 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #96 Sun Oct 24 15:44:48 CEST 2004
Linux version 2.6.9-bk6-pa1 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #96 Sun Oct 24 15:44:48 CEST 2004
<...this last line continues forever...>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
