Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.xs4all.nl (smtp3.xs4all.nl [194.109.127.132])
	by dsl2.external.hp.com (Postfix) with ESMTP id B4F1F482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 07:30:01 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp3.xs4all.nl (8.9.3/8.9.3) with ESMTP id PAA20273
	for <parisc-linux@lists.parisc-linux.org>; Wed, 5 Sep 2001 15:29:49 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Wed, 5 Sep 2001 15:29:44 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010905152944.A23742@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cvs update gives 'move away ....' on every file
List-ID: <linux-parisc.vger.kernel.org>

- downloaded the linux-latest.tar.gz archive
- created /home/cvs/parisc and made sure I had enough permissions
- untarred the linux-latest.tar.gz archive there, creating
  /home/cvs/parisc/linux
- installed cvs
- made sure there's a variable CVSROOT in my environment, value:
  ":pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc" (without
  the " of course)
- created ~/.cvsrc, containing:
cvs -z3 -q
diff -uNp
update -Pd
rm -f
- typed 'cd /home/cvs/parisc; cvs update'

result:

jurriaan@pa8200:/home/cvs/parisc$ cvs update -A
cvs update: move away linux/.cvsignore; it is in the way
C linux/.cvsignore
cvs update: move away linux/COPYING; it is in the way
C linux/COPYING
cvs update: move away linux/CREDITS; it is in the way
C linux/CREDITS
cvs [update aborted]: received interrupt signal

and so on. Comments on www.google.com and various mailin-lists seem to
indicate this is often a server-error. I can't really believe that,
since it seems to work for everyone else.

I retried it with linux-20010830.tar.gz, and the same messages were
printed.

What am I doing wrong?

Thanks,
Jurriaan
-- 
Cool is one thing, but you're frozen solid.
	Startrek DS9: Vic Fontaine to Odo.
GNU/Linux 2.4.9-ac7 SMP/ReiserFS 2x1402 bogomips load av: 0.03 0.03 0.02
