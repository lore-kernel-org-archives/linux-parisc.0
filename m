Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 97921482A
	for <parisc-linux@parisc-linux.org>; Tue, 29 Jan 2002 22:05:40 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GQQJHB01.A0E for
          <parisc-linux@parisc-linux.org>; Tue, 29 Jan 2002 20:05:35 -0900
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GQQJHB00.P9G for <parisc-linux@parisc-linux.org>; Tue, 29 Jan
          2002 20:05:35 -0900
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA03682
	for <parisc-linux@parisc-linux.org>; Tue, 29 Jan 2002 20:00:21 -0900
Date: Tue, 29 Jan 2002 20:00:21 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0201291938520.3623-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Odd kernel error
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

Compiling the latest from CVS (-pa16, I think) and at the final make, when
gcc is actually doing the '-o vmlinux' I'm getting:

drivers/video/video.o: In function 'L1260':
drivers/video/video.o(.init.text+0x2554): undefined reference to
'fbcon_sti'
drivers/video/video.o(.init.text+0x255c): undefined reference to
'fbcon_sti'
make: *** [vmlinux] Error 1

This happened with -pa15 also. I downloaded the pre-built -pa15 kernel and
it boots fine, though. Checking, I realized I had disabled PCI in my
config (it's a 715/100, no PCI in it), and remembered some discussion
about PCI being a 'depends-on' item for some things... Is it possible this
is a 'needs PCI' issue?

I have a new kernel compile going on now, with PCI enabled, so we'll see
what happens, but figured I'd toss it out in case someone else is seeing
this.
