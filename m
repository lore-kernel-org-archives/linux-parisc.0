Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from patty.levels.unisa.edu.au (patty.levels.unisa.edu.au [130.220.36.156])
	by dsl2.external.hp.com (Postfix) with ESMTP id 857D6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 May 2001 22:24:53 -0600 (MDT)
Date: Sat, 5 May 2001 13:54:47 +0930 (CST)
From: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
To: Jeffrey A Law <law@redhat.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.30.0105051311480.7143-100000@mullet.itr.unisa.edu.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] pa FUNCTION_OK_FOR_SIBCALL
List-ID: <linux-parisc.vger.kernel.org>

Hi Jeff,
   Can you remember why FUNCTION_OK_FOR_SIBCALL is !TARGET_64BIT?

I'm asking because I think tail calls are always OK for pa32-linux,
because having a flat sub-space model we don't need to worry about rp',
and r19 will be preserved/loaded in the PIC case.  I'm wordering what I'm
missing though as you can argue the same for pa64.

Alan
