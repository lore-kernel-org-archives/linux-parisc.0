Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4519248A9
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 25 Apr 2004 19:41:11 -0600 (MDT)
Date: Sun, 25 Apr 2004 18:41:11 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Message-ID: <20040426014111.GC3965@tausq.org>
References: <20040419223250.7E3CE494572@palinux.hppa>
	<20040419223444.GB18329@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040419223444.GB18329@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] 7300LC
Reply-To: Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

willy, kyle found out that this doesn't work:

> > Split out 7300LC from 7100LC and PREFETCH from PA20.

extern inline void prefetchw(const void *addr)
{
        __asm__("ldd 0(%0), %%r0" : : "r" (addr));
}

on pa11 gas won't assemble the ldd insn.

is this supposed to work for pa7300lc? if so we might have to rewrite
prefetchw to use a .word or something...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
