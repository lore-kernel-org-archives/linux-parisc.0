Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDAF64834
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Jul 2001 16:51:51 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id qxdngaaa for parisc-linux@lists.parisc-linux.org; Wed, 4 Jul 2001 15:48:07 -0700
Date: Wed, 4 Jul 2001 15:51:08 -0700
From: Randolph Chung <randolph@tausq.org>
To: Torsten Neumann <torsten@imke.infodrom.ffis.de>,
	Peter Weilbacher <weilbach@uni-sw.gwdg.de>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20010704155108.H31475@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] unaligned memory accesses
List-ID: <linux-parisc.vger.kernel.org>

Torsten and Peter,

I've checked in some changes to parisc kernel cvs that should address 
the crashes you've seen. Please try picking up latest kernel files from 
cvs and let us know if they fix the errors you've seen.

thanks,
randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
