Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0399482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Dec 2001 09:16:58 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id gllujaaa for parisc-linux@lists.parisc-linux.org; Sat, 15 Dec 2001 09:11:34 -0700
Date: Sat, 15 Dec 2001 08:16:46 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joerg Hartmann <J.Hartmann@reinarts.de>
Cc: PARISC Linux List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] gcc on 0.9.3 iso problem
Message-ID: <20011215161646.GX1515@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <561134811041.20011215144325@reinarts.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <561134811041.20011215144325@reinarts.de>
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

> But if i try to use this gcc i always get an error
> 
> hp-tux:/usr/src/samba-2.2.2/source# ./configure
> creating cache ./config.cache
> checking for gcc... gcc
> checking whether the C compiler (gcc -O  ) works... no
> configure: error: installation or configuration problem:
>            C compiler cannot create executables.

Look for a config.log file in the directory. The log should show what is
wrong.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
