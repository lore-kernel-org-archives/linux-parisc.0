Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84431482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Jun 2001 01:01:58 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id qwehgaaa for parisc-linux@lists.parisc-linux.org; Sun, 17 Jun 2001 23:58:45 -0700
Date: Mon, 18 Jun 2001 00:01:29 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010618000128.G14564@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Unaligned trap handler - comments appreciated
List-ID: <linux-parisc.vger.kernel.org>

I just checked in an arch/parisc/kernel/unaligned.c file into palinux
cvs.

It's my (not-yet-successful) attempt at putting together an unaligned
memory access handler for palinux.

Since I'm not really familiar with how this is "supposed" to be done, I
would really appreciate if folks more in the know can review the code
and let me know if i'm on the right track, or if i'm smoking something
funny :-)

I haven't checked in the (simple, obvious) hook in traps.c that calls
the unaligned handler since it isn't working yet.

thanks for your patience :)
randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
