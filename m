Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15008493F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Oct 2001 01:08:12 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id djgaiaaa for parisc-linux@lists.parisc-linux.org; Wed, 10 Oct 2001 00:03:39 -0700
Date: Tue, 9 Oct 2001 22:58:19 -0700
From: Randolph Chung <randolph@tausq.org>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [patch] /proc interface for LED/LCD
Message-ID: <20011009225819.H653@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011006134250.I17735@tausq.org> <E15pzKV-0000ZU-00@gandalf.tausq.org> <20011006153445.J17735@tausq.org> <20011007065656.647FB4843@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011007065656.647FB4843@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Yes, I did. Unfortunately I mentioned inventory.c, but originally meant 
> firmware.c in my previous mail.

looks like there was another small fix needed for firmware.c. Please try
the latest one. It now works for me for both 64-bit and 32-bit kernels.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
