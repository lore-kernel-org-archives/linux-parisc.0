Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89FE7482A
	for <parisc-linux@parisc-linux.org>; Sun, 29 Apr 2001 00:00:22 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14tkFW-0008MT-00
	for parisc-linux@parisc-linux.org; Sun, 29 Apr 2001 07:00:02 +0100
Date: Sun, 29 Apr 2001 07:00:02 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010429070002.I15328@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] glibc 2.2.3 status
List-ID: <linux-parisc.vger.kernel.org>

Let's see...

 * If you edit sunrpc/Makefile to specify -Y /usr/bin to rpcgen (to fix our
   broken compiler).
 * And cp sysdeps/hppa/initfini.c \
	linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c

then glibc will build.

It will not pass `make check' though.  This seems to be crashing in the
dynamic loader when testing the iconvdata directory.  I've been trying
to debug this today, but haven't got very far.

gdb reports:

Program received signal SIGSEGV, Segmentation fault.
0x41013b94 in _dl_symbol_address (map=0x4014b000, ref=0x0)
    at ../sysdeps/hppa/dl-symaddr.c:26
26        Elf32_Addr value = (map ? map->l_addr : 0) + ref->st_value;
(gdb) bt
#0  0x41013b94 in _dl_symbol_address (map=0x4014b000, ref=0x0)
    at ../sysdeps/hppa/dl-symaddr.c:26
#1  0x40113ed4 in ?? ()

-- 
Revolutions do not require corporate support.
