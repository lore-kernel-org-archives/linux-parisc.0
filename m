Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07493482A
	for <parisc-linux@parisc-linux.org>; Mon, 14 Jan 2002 02:42:59 -0700 (MST)
Subject: Re: [parisc-linux] atomic_t
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Mon, 14 Jan 2002 09:54:44 +0000 (GMT)
Cc: willy@debian.org (Matthew Wilcox), parisc-linux@parisc-linux.org
In-Reply-To: <20020114040909.87321482A@dsl2.external.hp.com> from "Grant Grundler" at Jan 13, 2002 09:09:09 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E16Q3pE-0001DQ-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> > exclusivity...  I thought we could eliminate it.
> 
> You are only looking at interactions between atomic_set
> and atomic_add_return. Aren't there potentialially other
> types of interactions with other atomic operations?
> But I don't know. Alan Cox?

We had a discussion about some of this on #kernel. Its not clear. The
x86 port "knows" that writes are going to be atomic. It means that

	CPU1			CPU2
value=4
	atomic_set=0		atomic_add +1

will result in an addition to the set value, or an addition then the
entire result discarded for the set value. It won't (except in obscure
hardware bug cases 8)) result in the set being lost during the add

ie you might see 0 after those operations, or you might see 1, but you
won't see 5 after both have completed.
