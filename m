Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 441D6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Jun 2001 14:27:08 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id wlclgaaa for parisc-linux@lists.parisc-linux.org; Thu, 28 Jun 2001 13:23:26 -0700
Date: Thu, 28 Jun 2001 13:26:07 -0700
From: Randolph Chung <randolph@tausq.org>
To: Torsten Neumann <torsten@imke.infodrom.ffis.de>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems compiling LVM
Message-ID: <20010628132607.B3045@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010628202937.A13724@imke.infodrom.ffis.de> <20010628193653.77706115D6@finlandia.infodrom.north.de> <20010628221450.A28337@imke.infodrom.ffis.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010628221450.A28337@imke.infodrom.ffis.de>
List-ID: <linux-parisc.vger.kernel.org>

> This was with kernel
> Linux imke 2.4.0-pa43 #2 Wed Jun 27 20:09:41 CEST 2001 parisc unknown
> 
> Any Hints ?
> Or could somebody tell me what more info is needed to solve the problem ?

Torsten, can you send me (not to the list pls) the binary that causes the
trap? I'll take a look. The unaligned trap only handles the common
load/store instructures on unaligned boundaries. Looks like your
application is using one of the (currently) unsupported instructions.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
