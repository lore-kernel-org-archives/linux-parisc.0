Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mwinf0203.wanadoo.fr (smtp5.wanadoo.fr [193.252.22.29])
	by dsl2.external.hp.com (Postfix) with ESMTP id B559E4829
	for <parisc-linux@parisc-linux.org>; Wed,  9 Apr 2003 12:20:53 -0600 (MDT)
From: pageexec@freemail.hu
To: grsecurity@grsecurity.net
Date: Wed, 09 Apr 2003 20:20:47 +0200
MIME-Version: 1.0
Subject: Re: [parisc-linux] parisc-linux.org kernel
Reply-To: pageexec@freemail.hu
Cc: willy@debian.org, parisc-linux@parisc-linux.org,
	grundler@dsl2.external.hp.com
Message-ID: <3E94809F.20238.1A268F91@localhost>
In-reply-to: <20030409174034.GJ23430@parcelfarce.linux.theplanet.co.uk>
References: <3E947323.14900.19F1E3AF@localhost>
Content-type: text/plain; charset=US-ASCII
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

> perhaps PaX doesn't support sparc32, m68k, arm, mips, mips64, ia64,
> s390, s390x or x86-64 since i know all those architectures have patches
> on top of the kernel.org tree.

of the above sparc32 is supported right now (with the vanilla tree),
ia64 and x86-84 could be supported (if we had the hw, and i don't know
how well the vanilla tree works on them), for the rest there was either
no interest so far or it's not possible (at least the non-exec pages,
randomization is arch independent). anyway, once we get PaX on parisc
to work, i think Alex will take care of the parisc-linux.org patches
(he's already testing with that after all), so this won't be an issue.
