Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id F277A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Apr 2002 11:13:50 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id tpoimaaa for parisc-linux@lists.parisc-linux.org; Wed, 3 Apr 2002 11:12:53 -0700
Date: Wed, 3 Apr 2002 10:13:37 -0800
From: Randolph Chung <randolph@tausq.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] "unaligned access to ... at ip=..." problem with evms and jfs
Message-ID: <20020403181337.GA3759@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1017854653.3cab3abdab486@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1017854653.3cab3abdab486@webmail.tiscalinet.be>
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

> It seems harmless but not sure.

well.... in general this is not a problem, however....

Fleedwood found a bug in the unaligned handler last week. it doesn't
handle the pre/post increment cases of load and store, and there may be
some cases where these messages will indicate the cause of errors.

I'll look into fixing this, but it might take some time.

> I query the ml db and found similar problems (and its solution :_) )(reiserfs:
> http://lists.parisc-linux.org/hypermail/parisc-linux/5862.html), but I do not
> very well understand what I have to find the sources (_u32* ?).

it depends, you need to make sure all the memory accesses happen on
natural boundaries...  (e.g. int on 4 byte boundaries, short on 2 byte
boundaries, etc). From the ip reported by the unaligned message you
should be able to trace back to the asm insn and function (if your
objects are not stripped) that is causing the unaligned access.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
