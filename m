Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0255D4831
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 13:00:05 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id vybcjaaa for parisc-linux@lists.parisc-linux.org; Mon, 19 Nov 2001 12:55:00 -0700
Date: Mon, 19 Nov 2001 11:59:31 -0800
From: Randolph Chung <randolph@tausq.org>
To: Markus Grabert <xam@student.cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.x and the kernel
Message-ID: <20011119115931.P3053@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.OSF.4.41.0111191946450.11606-100000@student.cs.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.OSF.4.41.0111191946450.11606-100000@student.cs.ucc.ie>
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

> Some ports (such as parisc, sparc, sparc64 ...) use gcc-3.x in their
> distributions, even to compile the linux kernel.
> IMHO they use the lastest gcc since it has better support and more recent
> bug fixes for the according platforms.
> But I've read that gcc-3.0.x is not officially supported as a kernel
> compiler, since is still has some bugs. Are these bugs just x86 related
> (I doubt it) or do you accept the risk that gcc might produce garbage ?
> Does this actually happen ?

gcc 3.0.2 is officially released by the FSF. We have been using it for
building both kernel and user space apps for some time. While there are
still some occasional bugs, in general it seems to be working well.

afaik the 3.x compilers are the only ones available for parisc-linux.
There are no 2.9x compilers for this platform.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
