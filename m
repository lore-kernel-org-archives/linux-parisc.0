Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 248EC4830
	for <parisc-linux@parisc-linux.org>; Sat, 20 Apr 2002 21:56:31 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id chqtmaaa for parisc-linux@parisc-linux.org; Sat, 20 Apr 2002 20:55:22 -0700
Date: Sat, 20 Apr 2002 20:59:52 -0700
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020421035952.GI7563@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] unofficial gdb deb on ftp site
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

there is an unofficial gdb debian package at

ftp://ftp.parisc-linux.org/unofficial-debs/gdb_5.2.cvs20020401-4.1_hppa.deb

this is basically the same as the Debian package, except it has a fix
for the '"core" is not a core dump: File format not recognized' bug.

A patch has been submitted to the Debian maintainer, but in the meantime
if you want you can use this package.

I see that Dave has changed hppa-gcc from using stabs to using dwarf2 in
gcc 3.2, so things might be quite different once we move to gcc 3.2...
but for now gdb is only marginally usable.  If anyone is interested in 
looking at gdb, we seem to have some problems with gdb tracking line 
info.  'next' doesn't work at all...

randolph
