Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id F072C484E
	for <parisc-linux@parisc-linux.org>; Tue, 26 Feb 2002 12:41:57 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id raqslaaa for parisc-linux@parisc-linux.org; Tue, 26 Feb 2002 12:41:35 -0700
Date: Tue, 26 Feb 2002 11:41:51 -0800
From: Randolph Chung <randolph@tausq.org>
To: "FAUCHER,DENNIS (HP-USA,ex1)" <dennis_faucher@hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] nslookup segmentation fault
Message-ID: <20020226194150.GB11598@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <2F1E6AB90ECAD311943700A0C9E3B1540804ED28@xatl03.atl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2F1E6AB90ECAD311943700A0C9E3B1540804ED28@xatl03.atl.hp.com>
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

Neat....

Here's part of Dennis' strace of nslookup:
> m4450dmf:/etc# strace nslookup athp.hp.com
[...]
> rt_sigprocmask(SIG_BLOCK, [HUP INT TERM], NULL, 8) = 0
> getpid()                                = 22574
> socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 3
> close(3)                                = 0
> socket(PF_INET6, SOCK_STREAM, 0)        = -1 EAFNOSUPPORT (Address family
> not su
> pported by protocol)
> brk(0)                                  = 0x2f000
> brk(0x2f030)                            = 0x2f030
> brk(0x30000)                            = 0x30000
> brk(0x33000)                            = 0x33000
> --- SIGSEGV (Segmentation fault) ---
> +++ killed by SIGSEGV +++

why is it trying to do ipv6?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
