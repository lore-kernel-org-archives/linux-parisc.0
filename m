Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BC26482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 13:05:24 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id vsjngaaa for parisc-linux@lists.parisc-linux.org; Thu, 5 Jul 2001 12:01:38 -0700
Date: Thu, 5 Jul 2001 12:04:35 -0700
From: Randolph Chung <randolph@tausq.org>
To: Torsten Neumann <torsten@imke.infodrom.ffis.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: unaligned memory accesses
Message-ID: <20010705120435.B30014@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010704155108.H31475@tausq.org> <20010705201520.A3618@imke.infodrom.ffis.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010705201520.A3618@imke.infodrom.ffis.de>
List-ID: <linux-parisc.vger.kernel.org>

> Tried latest kernel from cvs ( 2.4.0-pa51 ) and still got the same result,
> 
> pvcreate(204): unaligned access to 0x40067cf3 at ip=0x400310db
> pvcreate(204): unaligned access to 0x40067cf7 at ip=0x400310e3

Do you see any other message about "Not-handled insn" like before? If
not this may be a different issue. 

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
