Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9FD534832
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 May 2003 09:01:15 -0600 (MDT)
Date: Wed, 14 May 2003 08:04:01 -0700
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] more on canonicalize_funcptr_for_compare
Message-ID: <20030514150401.GM548@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030514055225.GJ548@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030514055225.GJ548@tausq.org>
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

> if ((int) fptr == -1 || (unsigned int) fptr < 4096 || !((int) fptr & 2))
>     return (unsigned int) fptr;
> 
> so, why doesn't that match the second || case and exit?  (gdb
> disassmbly shows that the code tries to dereference the fptr argument
> and segfaults)

sigh, after some sleep i realize that i was looking at the real 3.3 tree
instead of my backport, and in the current 3.2 patch the second test is
missing....  (because it was derived from an earlier snapshot of jda's
patch)

i'll send an update to debian-gcc... sorry about this.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
