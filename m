Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26D1A4891
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 08:02:58 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8JE2sI04806;
	Fri, 19 Sep 2003 10:02:55 -0400
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
From: James Bottomley <James.Bottomley@steeleye.com>
To: Randolph Chung <randolph@tausq.org>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030919112445.GL27523@tausq.org>
References: <20030919010356.148684940A4@palinux.hppa>
	<1063933596.2083.9.camel@mulgrave>  <20030919112445.GL27523@tausq.org>
Content-Type: text/plain
Date: 19 Sep 2003 09:02:52 -0500
Message-Id: <1063980175.1929.7.camel@mulgrave>
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

On Fri, 2003-09-19 at 06:24, Randolph Chung wrote:
> we also have a flush_icache_user_range range macro that does this (flush
> dcache + icache). The kernel seems to use both..... 

Well, I just took the least line of resistance.

But it does beg the question: I think all of the PA arch docs require
the dcache to be flushed before the icache for all icache flushing, so
is there any point exporting an API that only flushes the icache?

James
