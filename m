Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D5FD4829
	for <parisc-linux@parisc-linux.org>; Sat,  2 Nov 2002 09:14:10 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 1880uU-0002UA-00
	for parisc-linux@parisc-linux.org; Sat, 02 Nov 2002 16:14:06 +0000
Date: Sat, 2 Nov 2002 16:14:06 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021102161406.J20749@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.5 status 2002-11-02
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

It's been a busy week.  Linus took 1.8MB of patches from us; the first
merge since 2.4.0-pre10.  Which means we went from:

-rw-r--r--    1 willy    willy     2779759 Oct 28 10:37 parisc-2.5.44.diff
-rw-r--r--    1 willy    willy     1052278 Nov  2 08:20 parisc-2.5.diff

which is a big improvement.  I've sent Linus another 600k of patches
(mostly moving drivers from arch/parisc/kernel to drivers/parisc).
The 2.5.45 merge is done (thanks, Paul!) which included lots of excitement
porting our Config.in patches to the new Kconfig.  Grant & Tausq did
some stellar debugging on our stability problems.  Still crashes on my
712, but Helge has it working on his C3000 (32-bit), and I think Grant
said it booted on his A500 (64-bit).  SMP now links but doesn't boot.
Helge's been cleaning up the STI drivers and is taking care of merging
this upstream.  Ryan's fixing Zalon SCSI support, and John fixed a
2-year-old bug, as well as some more recent ones.

Thanks to everyone who's helping.  It's great working with you.

-- 
Revolutions do not require corporate support.
