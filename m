Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3EDD482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 May 2001 10:18:33 -0600 (MDT)
Received: from slagheap.cygnus.com (cse.cygnus.com [205.180.230.236])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id JAA24730
	for <parisc-linux@lists.parisc-linux.org>; Sun, 6 May 2001 09:18:32 -0700 (PDT)
To: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: law@redhat.com
From: law@redhat.com
In-reply-to: Your message of Sat, 05 May 2001 13:54:47 +0930.
             <Pine.LNX.4.30.0105051311480.7143-100000@mullet.itr.unisa.edu.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 06 May 2001 09:20:55 -0700
Message-ID: <20586.989166055@slagheap.cygnus.com>
Sender: law@cygnus.com
Subject: [parisc-linux] Re: pa FUNCTION_OK_FOR_SIBCALL
List-ID: <linux-parisc.vger.kernel.org>

  In message <Pine.LNX.4.30.0105051311480.7143-100000@mullet.itr.unisa.edu.au>y
ou write:
  > Hi Jeff,
  >    Can you remember why FUNCTION_OK_FOR_SIBCALL is !TARGET_64BIT?
  > 
  > I'm asking because I think tail calls are always OK for pa32-linux,
  > because having a flat sub-space model we don't need to worry about rp',
  > and r19 will be preserved/loaded in the PIC case.  I'm wordering what I'm
  > missing though as you can argue the same for pa64.
I just never sat down to make them work for PA64.  Given that there are no
argument relocation stubs it's likely they'll be applicable more often for
PA64 and PA32-linux than they are for hpux.


jeff
