Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F2A5482A
	for <parisc-linux@parisc-linux.org>; Wed,  2 Jan 2002 00:05:49 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id yswbkaaa for parisc-linux@parisc-linux.org; Tue, 1 Jan 2002 23:59:47 -0700
Date: Tue, 1 Jan 2002 23:05:14 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] new gdb deb for testing, patch for review
Message-ID: <20020102070514.GB21302@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020101184109.GJ2179@tausq.org> <200201011909.g01J9x6v012320@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200201011909.g01J9x6v012320@hiauly1.hia.nrc.ca>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> This annoying problem has been around for a long time.  Argument
> printouts may not be valid at a function breakpoint due to code
> motion.

hmm.. ok. there are a lot of failures in the gdb test cases though.
perhaps someone can investigate these?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
