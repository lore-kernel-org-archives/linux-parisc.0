Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 786974837
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Mar 2002 11:24:02 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id owczlaaa for parisc-linux@lists.parisc-linux.org; Wed, 13 Mar 2002 11:23:24 -0700
Date: Wed, 13 Mar 2002 10:23:35 -0800
From: Randolph Chung <randolph@tausq.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] evms-0.9.2 build utilities problem
Message-ID: <20020313182335.GD6580@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1016030200.3c8f63f89a0ff@webmail.tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1016030200.3c8f63f89a0ff@webmail.tiscali.be>
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

> Well launch it made an immidiate Segmentation fault.
> 
> Now I recompile without "-fPIC" and it works fine.
> 
> Any idea on what is wrong?

what versions of gcc-3.0 and binutils are you running?

dpkg -s gcc-3.0 |grep Version
dpkg -s binutils |grep Version

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
