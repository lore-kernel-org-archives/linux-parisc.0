Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4560482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 09:31:24 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id jcvgiaaa for parisc-linux@lists.parisc-linux.org; Thu, 25 Oct 2001 08:26:40 -0700
Date: Thu, 25 Oct 2001 08:31:07 -0700
From: Randolph Chung <randolph@tausq.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] re: new cd-images any time soon?
Message-ID: <20011025083107.Z537@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200110251325.HAA21981@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110251325.HAA21981@udlkern.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Alan Modra has produced a gcc patch that should fix the problem for
> automatic storage.  I'm not sure what the status of getting that patch
> into the distribution is.  I sent the patch to Randolph Chung with the
> hope that he could at least test the patch to make sure that it didn't
> break glibc.

We are still having a lot of problems with toolchain/glibc, so I haven't
been able to build glibc with a patched gcc yet. On the good side I had
compiled other stuff using the patched gcc with no ill side-effects,
so.... 

I'm going to be away for a few days; I will forward the patch to
Debian's gcc maintainer for inclusion in the new gcc release. It looks
like we might have more work to do before we get a new glibc though.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
