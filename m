From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: ioctl32 cleanup -- rest of architectures
Date: Mon, 10 Mar 2003 17:28:32 +0000
Message-ID: <20030310172832.GG5278__42376.0004145608$1416622269$gmane$org@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
To: Pavel Machek <pavel@ucw.cz>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
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
