Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id AFB99482A
	for <parisc-linux@parisc-linux.org>; Tue,  1 Jan 2002 11:41:42 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id bssbkaaa for parisc-linux@parisc-linux.org; Tue, 1 Jan 2002 11:35:42 -0700
Date: Tue, 1 Jan 2002 10:41:09 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] new gdb deb for testing, patch for review
Message-ID: <20020101184109.GJ2179@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020101093314.GI2179@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020101093314.GI2179@tausq.org>
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

> The deb seems to work for me, but please give it a try and let me know
> if you find any issues....

argument passing seems to be broken

357       t_double_values(double_val1, double_val2);
(gdb) print double_val1
$1 = 45.654000000000003
(gdb) step
t_double_values (double_arg1=-1.0015640258789065, 
    double_arg2=8.5011959057330557)
    at ../../../gdb/testsuite/gdb.base/callfuncs.c:275

hmm...

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
