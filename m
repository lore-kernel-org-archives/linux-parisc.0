Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 950234829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Mar 2003 08:33:56 -0700 (MST)
Date: Thu, 6 Mar 2003 07:31:09 -0800
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: John Marvin <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org, davem@redhat.com
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030306153108.GA11751@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <200303061414.HAA26321@udlkern.fc.hp.com> <20030306143149.B1549@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030306143149.B1549@parcelfarce.linux.theplanet.co.uk>
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

In reference to a message from Matthew Wilcox, dated Mar 06:
> > In my opinion this patch is a hack workaround for a real bug. parisc is
> > not the only architecture that has virtual tagged caches.  Some mips
> > machines, sparc and ultrasparc machines have virtual tagged caches,
> > although none of them have virtual tagged caches as large as parisc (the
> > other architectures typically have a larger physical cache at a higher
[...]
> 1) This patch tausq did.  Now we flush both user & kernel mappings for the
> data.

I should mention that this is almost exactly what arm does as well.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
