Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E6B4482D
	for <parisc-linux@parisc-linux.org>; Fri,  1 Aug 2003 11:33:35 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h71HXOI12625;
	Fri, 1 Aug 2003 13:33:24 -0400
Subject: Re: [parisc-linux] backport bitops.h stuff
From: James Bottomley <James.Bottomley@steeleye.com>
To: LaMont Jones <lamont@hp.com>
Cc: Joel Soete <jsoe0708@tiscali.be>, parisc-linux@parisc-linux.org
In-Reply-To: <20030801171426.GA18508@security.hp.com>
References: <1059753543.2092.30.camel@mulgrave>
	<3F29178A000004FF@ocpmta7.freegates.net>
	<20030801171426.GA18508@security.hp.com>
Content-Type: text/plain
Date: 01 Aug 2003 12:33:24 -0500
Message-Id: <1059759205.1830.44.camel@mulgrave>
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

On Fri, 2003-08-01 at 12:14, LaMont Jones wrote:
> ffs(0)==31
> ffs(1)==0
> ffs(2)==1
> ffs(3)==0
> ffs(4)==2
> ffs(80000000)==31

This is off by one.  The definition should say

ffs(0) == 0
ffs(1) == 1
ffs(2) == 2
ffs(4) == 3
...
ffs(0x80000000) == 32

i.e. it returns the first set bit starting counting at one. (Yes, I know
it's confusing, it's tripped me up, especially as ffz counts bits from
zero.  However, ffs is a BSD standard).

Most arch's start by defining an __ffs which is not defined for the zero
case and then build the real ffs from that.

James
