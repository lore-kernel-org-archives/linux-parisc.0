Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD287482A
	for <parisc-linux@parisc-linux.org>; Mon, 22 Oct 2001 23:17:37 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id bbqfiaaa for parisc-linux@parisc-linux.org; Mon, 22 Oct 2001 22:12:41 -0700
Date: Mon, 22 Oct 2001 22:17:14 -0700
From: Randolph Chung <tausq@debian.org>
To: chris@debian.org, bcollins@debian.org
Cc: amodra@bigpond.net.au, parisc-linux@parisc-linux.org
Message-ID: <20011022221714.O537@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Yay, binutils fixed for hppa
List-ID: <linux-parisc.vger.kernel.org>

With many thanks to Alan Modra binutils seems to be fixed now. Chris,
can you please build a new binutils from cvs? Everything should be there, and
the hppa-specific patch you currently have in the package should no longer 
be needed.

The patch Ben has is needed to build glibc with the new binutils.

hppa is also a bit behind on gcc-3.0. I'll try to build new ones RSN.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
