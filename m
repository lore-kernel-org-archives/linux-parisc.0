Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76BB7482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 20:00:10 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id vdofiaaa for parisc-linux@lists.parisc-linux.org; Mon, 22 Oct 2001 18:55:21 -0700
Date: Mon, 22 Oct 2001 18:59:54 -0700
From: Randolph Chung <tausq@debian.org>
To: Ben Collins <bcollins@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20011022185954.B14102@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011022233534.X1037@bubble.sa.bigpond.net.au> <20011022213139.H10952@visi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011022213139.H10952@visi.net>
Sender: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
List-ID: <linux-parisc.vger.kernel.org>

> Excellent. This fixes the ld.so problem. I can only assume that the 235
> test suite failures are due to the one missing patch from the current
> Debian binutils package.
> 
> Randolph, any estimate on when that fixed package will be available?

Alan is debugging this as I write this. Will send the patch to Chris as
soon as we get something that works.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
