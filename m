Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4207B482C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 01:10:26 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.4d3e3a24) with ESMTP id dsdaiaaa for parisc-linux@lists.parisc-linux.org; Tue, 9 Oct 2001 00:05:54 -0700
Date: Tue, 9 Oct 2001 00:10:15 -0700
From: Randolph Chung <randolph@tausq.org>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [patch] /proc interface for LED/LCD
Message-ID: <20011009001015.D653@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011006134250.I17735@tausq.org> <E15pzKV-0000ZU-00@gandalf.tausq.org> <20011006153445.J17735@tausq.org> <20011007065656.647FB4843@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011007065656.647FB4843@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > In my other post I mentioned you also need a fix to firmware.c .. did
> > you pick that up too?
> Yes, I did. Unfortunately I mentioned inventory.c, but originally meant 
> firmware.c in my previous mail.

Hrm, ok, both Grant and I also reproduced this failure with a 32-bit
kernel on a c3k. with 64-bit it's fine... looks like something odd
happening with the PDC_CHASSIS_INFO call :-(

I can't find any documentation for this hversion-specific pdc call to
fetch the led/lcd info. Can anyone point me to some docs? I can try to
debug it some more.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
