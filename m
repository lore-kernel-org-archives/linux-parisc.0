Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 392F348EF
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 16:34:55 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.4d3e3a24) with ESMTP id vjkzhaaa for parisc-linux@lists.parisc-linux.org; Sat, 6 Oct 2001 15:30:29 -0700
Date: Sat, 6 Oct 2001 15:34:45 -0700
From: Randolph Chung <randolph@tausq.org>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [patch] /proc interface for LED/LCD
Message-ID: <20011006153445.J17735@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011006134250.I17735@tausq.org> <E15pzKV-0000ZU-00@gandalf.tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E15pzKV-0000ZU-00@gandalf.tausq.org>
List-ID: <linux-parisc.vger.kernel.org>

> I know that this doesn't happen due to your patch because I 
> didn't got the LCD to work before applying your patch too.
> As far as I debugged it until now the pdc_chassis_info() call in
> led_init() now returns -10 (PDC_INVALID_ARG) as result code, so maybe
> something other is busted here.
> Maybe you have any idea ?

In my other post I mentioned you also need a fix to firmware.c .. did
you pick that up too?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
