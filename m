Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3BD948CE
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 19:45:40 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id rsjxlaaa for parisc-linux@lists.parisc-linux.org; Fri, 8 Mar 2002 19:45:10 -0700
Date: Fri, 8 Mar 2002 18:45:16 -0800
From: Randolph Chung <randolph@tausq.org>
To: Duraid Madina <duraid@fl.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Swap space limitions for Linux on parisc
Message-ID: <20020309024516.GC22385@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <000201c1c713$82ecfd40$022a17ac@simplex>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000201c1c713$82ecfd40$022a17ac@simplex>
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

> The 'yet' above gives me hope; will 64 bit user space processes be
> supported anytime soon? Being able to malloc(1<<36) would be nice!

I sure hope not.... there is a lot of work involved to bring up
toolchains and all the applications to support two different userlands.
We still have a lot of work to do just to stablize 32-bit userspace.
Check the list archives, this has been discussed before, and once fairly
recently.

This is not to say it couldn't be done of course. This is GNU/Linux, you
have all the source, go nuts.. :-)

But now you have me curious, what app are you writing that needs >4G of
address space?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
