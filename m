Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06EB2484B
	for <parisc-linux@parisc-linux.org>; Sun, 31 Mar 2002 19:19:28 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id khhhmaaa for parisc-linux@parisc-linux.org; Sun, 31 Mar 2002 19:18:42 -0700
Date: Sun, 31 Mar 2002 18:19:11 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org, kdb@oss.sgi.com
Message-ID: <20020401021911.GG26353@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Initial port of kdb to parisc-linux
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

Greetings,

It's amazing how much you can get done when you are procrastinating from
doing what you are supposed to be doing. The result, a first cut of a
port of SGI's kdb to parisc-linux.

There is a patch against kdb version 2.1 at
ftp://ftp.parisc-linux.org/patches/kdb-v2.1-2.4.18-pa11-parisc-1.bz2

It is meant to be applied over the kdb-v2.1-2.4.18-common-2.bz2 patch.
(I would give a url, but sgi's ftp site seems to be down as i write
this)

The basic commands like disassembly, memory/register dumps, setting breakpoints,
backtracing, etc work. Single stepping does not yet work though. Also, right 
now this only works on 32-bit kernels. There are a few things that need to be
fixed for 64-bit to work -- 

1. modutils doesn't handle building 64-bit kdb-enabled kernels when running 
a 32-bit kernel (kallsyms will fail).  

2. Once you hack around #1, you run into problems because the parisc64
compiler for some reason emits .dynsym/.dynamic sections into the
kernel. This confuses modutils to no end. There's a small patch in the
pa patch above that discards the dynamic sections. I'm dubious this is
the right thing to do, though it does build a kernel that will boot and
start kdb

3. After #1/#2, we run into a problem because hppa64 binutils doesn't
seem to sort unwind sections entirely correctly, so the backtracing
logic will fail.

I've only tested this on serial console. Virtual console probably
doesn't work yet (the pause key mapping code is missing). Also as
explained on the kdb mailing list the code only works with ps2 type
keyboards; someone will need to write a polling usb driver to use this
with a usb keyboard.

There is still much work to do... the unwind code in particular is quite
crude and could be much enhanced. please try out the patch and feel free
to send bug reports, patches, etc :-)

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
