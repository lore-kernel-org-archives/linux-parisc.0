Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id B849948AE
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 10:19:06 -0600 (MDT)
Date: Mon, 15 Jul 2002 09:22:30 -0700
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
Message-ID: <20020715162230.GJ8724@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <1026716599.3d3273b741097@webmail.tiscalinet.be> <200207151524.g6FFOqqE023640@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200207151524.g6FFOqqE023640@hiauly1.hia.nrc.ca>
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

> This is just a guess but I will wager that this problem is related
> to the problems with expect, the cc1plus crash and the mmap issues noted
> elsewhere with SMP kernels.  There seem to be circumstances where the
> kernel crashes when a user application traps unexpectedly.

in at least some of the cases, i've seen one CPU is processing an
unaligned trap for a kernel space insn. i don't see how the particular
pieces of code that's causing the trap are unaligned tho (eg.
search_exception_table).

One thing about the unaligned handler is that it wlil fail silently
while handling "non-trivial" load/store insns. For example, it doesn't
handle the ma/mb or m/sm completors for displacement/indexed
load/stores.

It is possible that we haven't needed these in the past for kernel-space
with gcc-3.0, but gcc-3.[12] have different optimizations that
generate these instructions which we do not handle properly in unaligned
cases. Although I think this may just be masking an underlying problem.

I'm working on a more complete unaligned handler to see if that makes a
difference. Unfortunately I've found that sometimes when the kernel code
is modified in trivial ways (adding printk's, etc) the behaviors become
quite different. This definitely suggests some kind of cache flushing
problem as Grant described elsewhere.

randolph
