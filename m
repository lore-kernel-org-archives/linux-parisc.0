Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03A4E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 09:26:00 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id jwnchaaa for parisc-linux@lists.parisc-linux.org; Tue, 14 Aug 2001 08:22:10 -0700
Date: Tue, 14 Aug 2001 08:25:32 -0700
From: Randolph Chung <randolph@tausq.org>
To: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Once more: JFS
Message-ID: <20010814082532.A15709@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.33.0107031224210.15161-100000@leo.uni-sw.gwdg.de> <Pine.LNX.4.33.0108141157560.12006-100000@leo.uni-sw.gwdg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0108141157560.12006-100000@leo.uni-sw.gwdg.de>
List-ID: <linux-parisc.vger.kernel.org>

> And hundreds more similar errors when doing a manual fsck.jfs are
> written to kern.log, and this check never finishes...
> 
> This time it seems to be a PA-RISC-Linux problem, as I recall
> earlier problems with "unaligned access" messages.

The unaligned messages by themselves indicate a *user-space* problem. We can
look at the fsck.jfs code and see what it's doing.... my guess is that
there's some casting going on that is causing the unaligned accesses.
For example, if you had something like this:

char foo[10];
long *bar = (long *)(foo+2);

*bar = 10;

then it will trigger an unaligned access. (usually it's not quite that
obvious though)

If you see a "Not-handled unaligned access" message then there's a
kernel issue that we need to address, but doesn't seem to be the case
here.

Please visit http://bugs.parisc-linux.org/ and follow the instructions
to file a bug, and we will look into this.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
