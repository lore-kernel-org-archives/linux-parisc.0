Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id A87884851
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Feb 2002 08:39:51 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ctkslaaa for parisc-linux@lists.parisc-linux.org; Tue, 26 Feb 2002 08:39:25 -0700
Date: Tue, 26 Feb 2002 07:39:41 -0800
From: Randolph Chung <randolph@tausq.org>
To: "FAUCHER,DENNIS (HP-USA,ex1)" <dennis_faucher@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nslookup segmentation fault
Message-ID: <20020226153941.GC7416@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <2F1E6AB90ECAD311943700A0C9E3B154080038E3@xatl03.atl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2F1E6AB90ECAD311943700A0C9E3B154080038E3@xatl03.atl.hp.com>
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

> Is there a problem with nslookup?  Mine returns a segmentation fault.  Thank
> you.

paer[8:38] ~% uname -a               
Linux paer 2.4.16-64-smp #1 SMP Sat Dec 29 02:33:39 MST 2001 parisc64 unknown

paer[8:38] ~% nslookup -silent www.debian.org
Server:         127.0.0.1
Address:        127.0.0.1#53

Non-authoritative answer:
Name:   www.debian.org
Address: 198.186.203.20

what version of kernel/glibc? did you change anything in
/etc/nsswitch.conf?

the last dozen lines or so of a strace might be useful.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
