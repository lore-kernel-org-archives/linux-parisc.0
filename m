Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D04DE48A2
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 00:43:46 -0700 (MST)
Date: Sun, 14 Mar 2004 23:43:46 -0800
From: Randolph Chung <tausq@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Spinlock patch, take 2
Message-ID: <20040315074346.GD2384@tausq.org>
References: <20040315063318.GC2384@tausq.org>
	<20040315073740.GA660@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040315073740.GA660@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Looks beautiful. Is it measurably faster, or just semantically more
> correct than the existing implementation? :)

i have not done any measurements. the spinlock_t stuff is needed since
we've agreed that the attribute((aligned(16)) is not sufficient to
guarantee correct alignment. the atomic-lock optimization is based on
some discussions we had a few months ago. i'd like to actually try
these, but we still don't have a bootable SMP kernel yet :(

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
