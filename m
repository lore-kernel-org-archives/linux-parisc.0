Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.yashy.com (cpu2119.adsl.bellglobal.com [207.236.3.96])
	by dsl2.external.hp.com (Postfix) with ESMTP id E17494850
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Feb 2002 14:53:43 -0700 (MST)
Received: from yashy (helo=localhost)
	by mail.yashy.com with local-esmtp (Exim 3.33 #1)
	id 16e1AJ-000PjQ-00
	for parisc-linux@lists.parisc-linux.org; Thu, 21 Feb 2002 16:54:11 -0500
Date: Thu, 21 Feb 2002 16:54:11 -0500 (EST)
From: Yasholomew Yashinski <yashy@mail.yashy.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020220232407.T96452-100000@mail.yashy.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] palo not booting kernel
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

 I completed a serial console cd-rom install, ignoring the kernel install
because of cd-rom detection issue (irony?). I booted off 0/vmlinux and
installed 2.4.16-32 via apt-get. Trying to reboot I get the following:

HARD Booted.
palo ipl 0.99 root@palinux Thu Jan 24 14:47:37 MST 2002

Partition Start(MB) End(MB) Id Type
1               1     244   82 swap
2             245     275   f0 Palo
3             276    8678   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3324993 bytes @ 0xf440000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sdb3 HOME=/ console=ttyS0 TERM=vt102
palo_ke
rnel=3/boot/vmlinux'
Selected kernel: /boot/vmlinux from partition 3
offset_read(2, 0x0006c824, 128, 1342193664) can't seek past 221249536
ext2_iget: read errorERROR: open /boot/vmlinux from partition 3 failed

 Also wondering how the Vis EG-PCI support is coming, is
parisc-linux-announce the best way to track this? Anxious to use graphics
console :)

 (I can send anyone interested the issues I've had to date installing
0.9.3 via cd-rom on the B1k).

 Kowtow,

--
Yashy
