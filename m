Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2A464829
	for <parisc-linux@parisc-linux.org>; Wed,  9 Apr 2003 11:40:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 193JYo-0001K0-5e; Wed, 09 Apr 2003 18:40:34 +0100
Date: Wed, 9 Apr 2003 18:40:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: pageexec@freemail.hu
Cc: grsecurity@grsecurity.net, willy@debian.org,
	parisc-linux@parisc-linux.org, grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030409174034.GJ23430@parcelfarce.linux.theplanet.co.uk>
References: <20030409054929.GB21306@dsl2.external.hp.com> <3E947323.14900.19F1E3AF@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E947323.14900.19F1E3AF@localhost>
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

On Wed, Apr 09, 2003 at 07:23:15PM +0200, pageexec@freemail.hu wrote:
> actually, i'd like to (feel free to answer off-list), since for all the
> other archs grsec/PaX runs on we could compile a working kernel from the
> vanilla tree - it just seems a mystery why parisc is an exception (not
> blaming anyone, just would like to see it more clear).

perhaps PaX doesn't support sparc32, m68k, arm, mips, mips64, ia64,
s390, s390x or x86-64 since i know all those architectures have patches
on top of the kernel.org tree.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
