Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A74A64A19
	for <parisc-linux@parisc-linux.org>; Tue, 20 Feb 2001 12:07:14 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VI7x-0004zb-00
	for parisc-linux@parisc-linux.org; Tue, 20 Feb 2001 12:07:09 -0700
Date: Tue, 20 Feb 2001 12:07:09 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010220120709.E31164@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] SMP: We have ignition
List-ID: <linux-parisc.vger.kernel.org>

booting an SMP kernel with init=/bin/sh..

init-2.04# eth0: Setting full-duplex based on MII#1 link partner capability of .
pwd                                                                             
/                                                                               
init-2.04# cd home
init-2.04# pwd
/home
init-2.04# ls /
README          boot   etc     initrd   mnt   rr_moved  usr
README.INSTALL  cdrom  floppy  install  proc  sbin      var
bin             dev    home    lib      root  tmp       xc
init-2.04# mount -t proc proc proc
mount: mount point proc does not exist
init-2.04# mount -t proc proc /proc
init-2.04# cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8500 (PCX-W)
cpu MHz         : 440.000000
model           : 9000/785/J5000
model name      : Forte W 2-way
hversion        : 0x00005bd0
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
BTLB            : not supported
bogomips        : 878.18
processor       : 1
cpu family      : PA-RISC 2.0
cpu             : PA8500 (PCX-W)
cpu MHz         : 440.000000
model           : 9000/785/J5000
model name      : Forte W 2-way
hversion        : 0x00005bd0
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
BTLB            : not supported
bogomips        : 878.18
init-2.04#

I just have one more little change I need to check in and it should
work for you too.

Don't expect it to be as stable as UP just yet, and if you try to compile
it 64-bit you will need the latest compiler (this is 32-bit, i haven't
actually tested 64-bit yet.)

-- 
Revolutions do not require corporate support.
