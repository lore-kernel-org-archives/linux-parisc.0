Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31C57482A
	for <parisc-linux@parisc-linux.org>; Tue,  1 Jan 2002 02:33:52 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id wqqbkaaa for parisc-linux@parisc-linux.org; Tue, 1 Jan 2002 02:27:48 -0700
Date: Tue, 1 Jan 2002 01:33:14 -0800
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020101093314.GI2179@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] new gdb deb for testing, patch for review
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

Happy New Year!

I've placed a new gdb deb on ftp.parisc-linux.org, in the
unofficial-debs directory. This is built with an updated patch against
the latest gdb version in Debian.

I don't know gdb nearly as much as I'd like though, so I'd appreciate it
if someone more knowledge in this area can give the patch a once-over and 
make sure there are no glaring issues. The patch is based largely on what's 
in gdb cvs on cvs.p-l.org, with some minor updates to bring it inline with
the 5.1 version in Debian.

The deb seems to work for me, but please give it a try and let me know
if you find any issues....

ftp://ftp.parisc-linux.org/unofficial-debs/gdb_5.1-1.1_hppa.deb
ftp://ftp.parisc-linux.org/patches/gdb-5.1.diff

The patch is also filed against the gdb package in the Debian BTS.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
