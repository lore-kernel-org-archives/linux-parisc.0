Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E441482E
	for <parisc-linux@parisc-linux.org>; Mon, 10 Mar 2003 10:28:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.12)
	id 18sR4i-0003ey-00; Mon, 10 Mar 2003 17:28:32 +0000
Date: Mon, 10 Mar 2003 17:28:32 +0000
From: Matthew Wilcox <willy@debian.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
Message-ID: <20030310172832.GG5278@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: ioctl32 cleanup -- rest of architectures
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

Could you cc myself or parisc-linux@parisc-linux.org in future please?

first, you've called it `compact_sys_ioctl' -- it should be `compat_sys_ioctl'.
it's compatible, not really small ;-)

second, you've not changed the definition in arch/parisc/kernel/syscall.S:

-	ENTRY_DIFF(ioctl)
+	ENTRY_COMP(ioctl)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
