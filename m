Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from octopus.kti.ae.poznan.pl (octopus.kti.ae.poznan.pl [150.254.204.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CC094844
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Sep 2003 07:28:14 -0600 (MDT)
Received: from pyxis.kti.ae.poznan.pl ([150.254.204.45] helo=localhost)
	by octopus.kti.ae.poznan.pl with esmtp (Exim 3.35 #1 (Debian))
	id 19zGWG-0002Xi-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Sep 2003 16:09:28 +0200
Date: Tue, 16 Sep 2003 15:28:14 +0200
From: Jacek Chmielewski <jchmiel@kti.ae.poznan.pl>
Reply-To: Jacek Chmielewski <jchmiel@kti.ae.poznan.pl>
Message-ID: <179530193457.20030916152814@kti.ae.poznan.pl>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HP 9000 J200 + Debian
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

I want to install Debian on my HP 9000 J200 box and I encountered a problem
with booting the installation procedure:

Selected kernel: /vmlinux32 from partition 0
Selected ramdisk: /ramdiski from partition 0
ELF32 executable
Entry 00100098 first 00100000 n 6
Segment 0 load 00100000 size 2196688 mediaptr 0x1000
Segment 1 load 0031a000 size 467792 mediaptr 0x21a000
Segment 2 load 00390000 size 255656 mediaptr 0x28d000
Segment 3 load 003d0000 size 8192 mediaptr 0x2cc000
Segment 4 load 003d8000 size 32768 mediaptr 0x2ce000
Segment 5 load 00402048 size 110832 mediaptr 0x2d6048

ERROR: Read from boot device failed (status = -13).
byteio_read: seekread() returned -1 expected 2195456
ERROR: segment 0 read() failed
Fatal error loading kernel executableERROR: failed to load kernel 

I tried the Debian binary-1 CD and netinstall CD. Both with almost same
results ('status = -7' for Debian CD, and 'status = -13' for netinstall
CD).

What could be wrong? Do you know any possible source of this problem?

Best regards
  Jacek Chmielewski
