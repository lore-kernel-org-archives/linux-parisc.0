Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF445482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Jul 2001 23:52:19 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id ntoxgaaa for parisc-linux@lists.parisc-linux.org; Sun, 29 Jul 2001 22:48:42 -0700
Date: Sun, 29 Jul 2001 22:51:39 -0700
From: Randolph Chung <randolph@tausq.org>
To: caslivkoff@telocity.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Errors trying to compile 2.4.6-pa22
Message-ID: <20010729225139.B3472@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3B64F11B.DC4EEF75@telocity.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B64F11B.DC4EEF75@telocity.com>
List-ID: <linux-parisc.vger.kernel.org>

In reference to a message from caslivkoff@telocity.com, dated Jul 30:
> I've been trying to compile a new kernel on my 712/80 (128MB RAM) while
> running 2.4.0-pa25. I downloaded linux-latest.tar.gz (2.4.6-pa22),
> configured, and "make dep" with no problems. "make palo" gets to the
> end, and errors out with:

what do you have in your .config? sounds like i need to add some
#ifdef's to arch/parisc/lib/io.c .. 

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
