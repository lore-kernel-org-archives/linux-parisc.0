Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from trained-monkey.org (trained-monkey.org [209.217.122.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EEFB484F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 12:43:15 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Cc: Randolph Chung <tausq@debian.org>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sys/io.h
References: <20020624150031.4DA034837@dsl2.external.hp.com> <20020624153959.GH812@tausq.org> <m3fzzbmiw8.fsf@trained-monkey.org> <20020625172950.B32282@parcelfarce.linux.theplanet.co.uk>
From: Jes Sorensen <jes@trained-monkey.org>
Date: 25 Jun 2002 14:43:14 -0400
In-Reply-To: Matthew Wilcox's message of "Tue, 25 Jun 2002 17:29:50 +0100"
Message-ID: <m3k7onjj25.fsf@trained-monkey.org>
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

>>>>> "Matthew" == Matthew Wilcox <willy@debian.org> writes:

Matthew> On Tue, Jun 25, 2002 at 12:18:31PM -0400, Jes Sorensen wrote:
>> You really should support it similar to what we do on
>> ia64. Ie. there's a Linux API here that allows you to map 'I/O'
>> ports and access them. Basing the code on what's in the ia64 glibc
>> tree would make it quite easy to get it up and running.

Matthew> Um, we can't.  To do a port space access on Dino is:

Matthew> acquire spin lock write address to register perform read or
Matthew> write access to a different register release spin lock

Matthew> i do hope you're not about to suggest emulating the proposed
Matthew> interface by unmapping an address range and handling this in
Matthew> the fault handler

Well then make it a syscall and do it in the kernel - yes it's not
pretty but if the architecture requires it then thats the way to get
around it.

Jes
