Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6F824882
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Mar 2002 00:18:40 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id oilzlaaa for parisc-linux@lists.parisc-linux.org; Thu, 14 Mar 2002 00:18:03 -0700
Date: Wed, 13 Mar 2002 23:18:22 -0800
From: Randolph Chung <randolph@tausq.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org, dave@hiauly1.hia.nrc.ca
Subject: Re: [parisc-linux] evms-0.9.2 build utilities problem
Message-ID: <20020314071822.GR730@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1016030200.3c8f63f89a0ff@webmail.tiscali.be> <20020313182335.GD6580@tausq.org> <1016088011.3c9045cb06909@webmail.tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1016088011.3c9045cb06909@webmail.tiscali.be>
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

> PS: This can be reproduce with a simple "Hello World" (just to avoid to sempt
> time to find back the the sources of evms)

<sigh> yup... looks like a compiler (linker?) bug...

gcc -fPIC -o test test.c          -> works
gcc -fPIC -static -o test test.c  -> segfaults

test.c is a printf("Hello") kinda program

verified with both gcc-3.0.4 and gcc-3.1.

Dave, is this a known problem?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
