Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83BEF4A19
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 01:58:16 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14WE3L-0004R7-00
	for parisc-linux@parisc-linux.org; Fri, 23 Feb 2001 08:58:15 +0000
Date: Fri, 23 Feb 2001 08:58:15 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010223085815.B16261@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] parisc64 vs kernel64
List-ID: <linux-parisc.vger.kernel.org>

I wonder if we're doing this right, having parisc and parisc64 as
different architectures.  They're fundamentally similar than sparc/sparc64
or mips/mips64 are.  We have very few files in parisc64 (the rest are
made visible to the build system by creating symlinks to their equivalent
in parisc).

Excluding Makefiles, we have:

kernel/binfmt_elf32.c
kernel/sys32.h
kernel/head.S
kernel/ioctl32.c
kernel/lasimap.map
kernel/pdcpat.c
kernel/signal32.c
kernel/sys_parisc32.c
real/head.S

I'm 99% sure we don't use real/head.S any more.  Or kernel/lasimap.map.
So how about moving the rest to parisc/kernel64?  We'd select between
them with something like:

make config
[...]
*
* Processor type and features
*
Processor family (PA1.1, PA2.0, PA2.0Wide) [PA1.1] 

i think it might make maintenance easier, and possibly alan/linus would
be more willing to take this than the current do_links based situation.

alternatively, maybe we should scrap all the #ifdef __LP64__ stuff from
our current files, duplicate large parts of them and populate parisc64
properly.  i think this current situation is the worst of both worlds
in that it's quite easy to forget about parisc64 when fiddling with
something in the parisc directory.

i favour moving the files to parisc/kernel64, but i'm interested in
hearing other points of view, including `stop messing about'.

-- 
Revolutions do not require corporate support.
