Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADB20482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Feb 2002 10:05:54 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel7.hp.com (Postfix) with ESMTP id DA6648050A5
	for <parisc-linux@parisc-linux.org>; Sun,  3 Feb 2002 12:05:43 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 3144E37D2B
	for <parisc-linux@parisc-linux.org>; Sun,  3 Feb 2002 10:05:43 -0700 (MST)
To: parisc-linux@parisc-linux.org
Date: Sun, 03 Feb 2002 10:05:43 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020203170543.3144E37D2B@carmen.fc.hp.com>
Subject: [parisc-linux] new i386 -> hppa/hppa64 cross-compiler
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

Hi palinuxers,

I have built a new i386 -> hppa/hppa64 cross-compiler using Debian
source packages from unstable on Jan 18th. In addition I also had to
apply this patch to gcc,

http://subversions.gnu.org/cgi-bin/viewcvs/gcc/gcc/gcc/cp/search.c.diff?r1=1.217&r2=1.218

There are no major known problems with the previous xc, it was just
getting a little old. The new xc is available at,

ftp://ftp.parisc-linux.org/x86-xcompilers/xc-20020118.tar.gz

Same as always, it provides 32 bit binutils/gcc/glibc and 64 bit
binutils/gcc. It should be untar'd in / and lives in /opt/palinux. It has
been tested for two weeks with no reported problems.

Please send any issues/problems to the list.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
