Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA8AE482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 00:17:13 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id tzndlaaa for parisc-linux@lists.parisc-linux.org; Tue, 29 Jan 2002 00:17:06 -0700
Date: Mon, 28 Jan 2002 23:16:42 -0800
From: Randolph Chung <randolph@tausq.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IPv6
Message-ID: <20020129071642.GP21816@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.NEB.4.33.0201282014540.13593-100000@www2.scram.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.NEB.4.33.0201282014540.13593-100000@www2.scram.de>
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

> and unfortunately, it doesn't work. This is what i get when i ping my 720
> from an Intel box:
> 
> ICMPv6 checksum failed [3ffe:0400:0470:0004:0000:0000:0000:0001 >
> ff02:0000:0000:0000:0000:0001:ff00:0002]
> NET: 4 messages suppressed.

should be fixed now.... pls give it a try. it was not adding proto
correctly.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
