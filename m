Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 327FC4834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 17:14:25 -0600 (MDT)
Date: Wed, 23 Oct 2002 16:15:36 -0700
From: Randolph Chung <randolph@tausq.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] unreliable mmap
Message-ID: <20021023231536.GC5602@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.44.0208152341001.18472-100000@gfrw1044.bocc.de> <Pine.LNX.4.44.0210240048490.1407-100000@gfrw1044.bocc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0210240048490.1407-100000@gfrw1044.bocc.de>
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

> While debugging cyrus21-imapd, i experienced pretty fishy behaviour
> of the skiplist database backend. It turned out that the 715 is affected
> by the mmap problem, as well.

as are c3k, a500, etc....

no one has managed to really track this down yet. i can insert a dcache
flush into the kernel to 'fix' this, but it is not the right place to be
doing the flush. 

my understanding of what's happening is that the open(2) and mmap()
creates two different "views" of the underlying page. when a write()
flushes the contents, only the open() view is flushd but not the mmap
view.

unfortunately i don't know nearly enough about vm to be able to track
this down and fix it properly :(

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
