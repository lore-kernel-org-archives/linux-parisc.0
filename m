Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 485BE482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 12:24:55 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19c7zH-00028N-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 14:23:47 -0400
Date: Mon, 14 Jul 2003 14:23:47 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030714182347.GC14114@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.4.21-paX on an rp2430
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

pa,

Downloaded vmlinux-64-2.4.21-pa2 from cvs.parisc-linux.org

palo --commandline='0/vmlinux64 console=/dev/ttyS0 root=/dev/sda2' \
     -k ./vmlinux-64-2.4.21-pa2 \
     -s ./lifimage64

Then proceeded to netboot this kernel from a new rp2430, and I didn't 
get very far :(

Has anyone tried testing the prebuilt kernels on newer machines?

I also tried a newer vmlinux-2.4.20-pa10-UP and the kernel oopses :(

---
Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> y

Booting... 
Network Station Address 00306e-48a712
System IP Address 192.168.1.200
Server IP Address 192.168.1.222

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl 1.2 root@b2000 Tue Jan 14 13:13:07 MST 2003

Boot image contains:
    0/vmlinux64 5196863 bytes @ 0x8800
Current command line:
0/vmlinux64 console=/dev/ttyS0 root=/dev/sda2
 0: 0/vmlinux64
 1: console=/dev/ttyS0
 2: root=/dev/sda2

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'console=/dev/ttyS0 root=/dev/sda2 palo_kernel=0/vmlinux64'
Selected kernel: /vmlinux64 from partition 0
ELF64 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 2789296 mediaptr 0x1000
Segment 1 load 003aa000 size 1012928 mediaptr 0x2aa000
Segment 2 load 004a4000 size 319568 mediaptr 0x3a2000
Segment 3 load 004f4000 size 49152 mediaptr 0x3f1000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org


********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00
processor                 system initialization      1C00
