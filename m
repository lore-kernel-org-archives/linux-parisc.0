Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id 91FF34829; Wed, 13 Nov 2002 08:32:24 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18BzV3-0005u7-00; Wed, 13 Nov 2002 15:32:17 +0000
Date: Wed, 13 Nov 2002 15:32:17 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Cc: grundler@parisc-linux.org, Randolph Chung <randolph@tausq.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
Message-ID: <20021113153217.J30392@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.4.20-rc1
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

ok, HEAD is now based on 2.4.20-rc1.  There's three things I wasn't 100%
sure of during the merge:

(1) drivers/pci/setup-bus.c.  It looks like most of, but not all, the
changes in our tree were merged into 2.5.20-rc1.  I've basically taken
the version we had in 2.4.19 but other changes may be needed.  Grant,
can you look at this?

(2) arch/parisc/kernel/syscall.S.  2.4.20-rc1 removed our XFS syscalls..
tausq, can you look at this?

(3) include/asm-parisc/ide.h.  2.4.20-rc1 removed some definitions from
this file that weren't removed from asm-i386, so i put them back.  Alan,
I presume this was your doing?

-- 
Revolutions do not require corporate support.
