Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from trained-monkey.org (trained-monkey.org [209.217.122.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E8974855
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 12:46:31 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Cc: Randolph Chung <tausq@debian.org>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sys/io.h
References: <20020624150031.4DA034837@dsl2.external.hp.com> <20020624153959.GH812@tausq.org> <m3fzzbmiw8.fsf@trained-monkey.org> <20020625172950.B32282@parcelfarce.linux.theplanet.co.uk> <m3k7onjj25.fsf@trained-monkey.org>
From: Jes Sorensen <jes@trained-monkey.org>
Date: 25 Jun 2002 14:46:27 -0400
In-Reply-To: Jes Sorensen's message of "25 Jun 2002 14:43:14 -0400"
Message-ID: <m3hejrjiws.fsf@trained-monkey.org>
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

>>>>> "Jes" == Jes Sorensen <jes@trained-monkey.org> writes:

Jes> Well then make it a syscall and do it in the kernel - yes it's
Jes> not pretty but if the architecture requires it then thats the way
Jes> to get around it.

Let me elaborate:

When the hardware is evil as you described in your mail, then it has
to go by the kernel. However if you have multiple cases, like Grant
mentioned Elroy vs Dino? then glibc can do a test the first time the
operation is done and cache that in userland for next time a request
is done - ie. when you're running on the type of hw that can do it in
userland then you don't have to go by the kernel except for the first
time.

Jes
