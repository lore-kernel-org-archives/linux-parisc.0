Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29557484B
	for <parisc-linux@parisc-linux.org>; Fri,  1 Aug 2003 09:59:12 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h71Fx3I07804;
	Fri, 1 Aug 2003 11:59:03 -0400
Subject: Re: [parisc-linux] backport bitops.h stuff
From: James Bottomley <James.Bottomley@steeleye.com>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <3F29178A000004C6@ocpmta7.freegates.net>
References: <3F29178A000004C6@ocpmta7.freegates.net>
Content-Type: text/plain
Date: 01 Aug 2003 10:59:02 -0500
Message-Id: <1059753543.2092.30.camel@mulgrave>
Mime-Version: 1.0
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

On Fri, 2003-08-01 at 10:28, Joel Soete wrote:
> Can somebody help me to ci inot 2.4 this patch which backport ffs() needed
> for new devmapper ;)

Actually, this patch looks decidedly non-optimal.

See include/linux/bitops.h:generic_ffs for how it should be done on
architectures that don't have any machine instruction help.  That's only
four if statements and no loop.

I see we already have the loop thing in 2.5, but should we consider
simply using the generic operations there as well?

even for __ffs, which is just a slight optimisation over ffs, using
generic_ffs would probably be faster

James
