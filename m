Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9EBEA4845
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Feb 2002 18:19:40 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id znqmlaaa for parisc-linux@lists.parisc-linux.org; Wed, 13 Feb 2002 18:19:20 -0700
Date: Wed, 13 Feb 2002 17:19:23 -0800
From: Randolph Chung <randolph@tausq.org>
To: James S <smith-james@home.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] smbfs.o module
Message-ID: <20020214011923.GC17432@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <001501c1b4d2$a9577ee0$02c1a8c0@james.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001501c1b4d2$a9577ee0$02c1a8c0@james.co.uk>
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

> has anybody tried compiling this module ?

yes, there are details in the mailing list archives. it was definitely
working at one point, but i haven't tried recently myself.

> it would save me a lot of time if somebody has it already compiled - I could
> just 'insmod' it.....

drivers are specific for a kernel configuration, so in general you
cannot just insmod a driver built for a different config.

have you tried compiling it yourself?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
