Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA11026
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 May 2000 20:41:12 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 May 2000 02:41:17 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA31412
	for <parisc-linux@thepuffingroup.com>; Thu, 18 May 2000 12:41:14 +1000
Date: Thu, 18 May 2000 12:41:13 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@thepuffingroup.com
Subject: [parisc-linux] New binutils available from cvs
Message-ID: <Pine.LNX.4.21.0005181154270.24452-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hello everyone,
   I have just uploaded a new binutils to puffin.external.hp.com cvs.  The
new binutils, which you can get with "cvs co binutils-2.10", is a merge of
current public sourceware.cygnus.com cvs with the puffin tree and a few
fixes of my own.

What's changed:

o Quite a few fixes have been added to the sourceware archive since the
  previous puffin import.  I'll not try to list these here.  One warning
  though: some little fixes and general code clean-up I checked in to the
  sourceware archive broke the hppa assembler.  Jeff Law has fixes from 
  me for the problem, but so far hasn't reviewed and OK'd them, so the
  sourceware hppa support is currently broken.

o Some parts of bfd/elf32-hppa.c have been rewritten, since the previous
  code just couldn't do the right thing.  eg. hppa_elf_relocate_insn used
  to inspect the insn it was given to see whether it was a branch, but
  there's no guarantee that insn was actually code.  It could have come
  from a .word directive, and in fact one place in pa-linux was broken
  due to this bug.

o The binutils hppa testsuite has been modified to (mostly) work for
  hppa1.1-linux.

o ld/emultempl/hppalinux.em has the new orphan section handling.

o I've put in a few fixes for 64 bit parisc, mostly just things I noticed
  while trying to make sense of the hppa backend.

o There are various incomplete pieces of code for things we'll need to
  eventually support.

***BIG WARNING**
  This binutils goes back to using the standard hppa comment char and line
separator char.  Existing puffin parisc code needs to be modified to suit,
otherwise you'll get lots of assembly errors (easy to fix), or silent
removal of code (where multiple asm instructions were placed on one line).

  I'll be shortly checking in a patch to puffin linux-2.3 and palo cvs
that should allow either the new or the old binutils to be used.  I guess
there is plenty of other source that needs fixing similarly.

Enjoy,
  Alan Modra.

PS. If you check in patches to the new binutils, please _please_ put in a
ChangeLog entry too.
-- 
Linuxcare.  Support for the Revolution.
