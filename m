Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5543C4829
	for <parisc-linux@parisc-linux.org>; Sat,  1 Feb 2003 20:59:22 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18fBHs-0000EK-00
	for parisc-linux@parisc-linux.org; Sun, 02 Feb 2003 03:59:20 +0000
Date: Sun, 2 Feb 2003 03:59:20 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030202035920.F21040@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Compiler switches
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

Just wondering how many of the compiler switches we really need these days.
Here's what we currently do:

cflags-y        := -D__linux__ -pipe -fno-strength-reduce

# These should be on for older toolchains or SOM toolchains that don't
# enable them by default.
cflags-y        += -mno-space-regs -mfast-indirect-calls

# No fixed-point multiply
cflags-y        += -mdisable-fpregs

# Without this, "ld -r" results in .text sections that are too big
# (> 0x40000) for branches to reach stubs.
cflags-y        += -ffunction-sections


-D__linux__ looks like it can go away.

-pipe I'm agnostic on.  Someone want to benchmark builds both with and
without it?

-fno-strength-reduce has been there since before we moved to ELF -- over 3
years.  Any bug this was working around has hopefully been long-squashed.
I think we should eliminate this and submit PRs if it finds new holes.

-mno-space-regs & -mfast-indirect-calls can also go away, I think.
I can't imagine that we ever didn't have them as default on a gcc
3.0-based compiler.

Do we still need -ffunction-sections?  I'm inclined to leave it anyway
to enable compilation with older toolchains.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
