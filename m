Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EC6F482E
	for <parisc-linux@parisc-linux.org>; Thu, 29 Nov 2001 22:18:02 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 169g3h-0003r3-00; Fri, 30 Nov 2001 05:17:57 +0000
Date: Fri, 30 Nov 2001 05:17:57 +0000
From: Matthew Wilcox <willy@debian.org>
To: tsbogend@alpha.franken.de
Cc: parisc-linux@parisc-linux.org
Message-ID: <20011130051757.B10729@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] fakeroot broken (by shm changes?)
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

fakeroot's stopped working since upgrading to the new kernel, so i think
the emulation of the old sysvipc mechanism may be broken.  this is
on paer, running a 64-bit SMP kernel.  i suspect sysvipc rather than
signals because fakeroot is a heavy user of sysvipc and exposed some
kernel bugs before.

i'm not going to be around till monday afternoon (evening your time),
but it's pretty easy to reproduce -- just run `fakeroot echo hello'.

-- 
Revolutions do not require corporate support.
