Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 816E84829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 03:22:51 -0600 (MDT)
Date: Thu, 29 Aug 2002 11:22:45 +0200
Message-ID: <3D53B3B700008549@ocpmta1.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
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

Hi all,

I need to go back to kernel 2.4.18-pa61 and evms-1.0.1 (see problem in ml:
http://lists.parisc-linux.org/pipermail/parisc-linux/2002-August/017368.html
with last 1.1.0 evsm release)

Kernel build and operate correctly. I so recompile tools with -ggdb gcc
option.
Then I use ddd to try to debug problem.

So I first run without break and got from console:
evms_vgscan(7998): unaligned access to 0x0002aaae at ip=0x4020a0e3

So I put a break early in main (Ok), relaunch run and try now to insert
a breack in gdb window:
b *0x4020a0e3

Accepted but when 'continue' is launch:
warning: Cannot insert breakpoint 2:
Cannot access memory at address 0x4020a0e3

What do I wrong or what should I better do?

Thanks in advance for help,
    Joel
