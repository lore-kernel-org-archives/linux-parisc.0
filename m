Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id EADB148AC
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Oct 2003 23:44:24 -0600 (MDT)
Date: Wed, 15 Oct 2003 01:40:45 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ulrich Drepper <drepper@redhat.com>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031015054045.GE22495@systemhalted>
References: <20031010204444.GF6454@systemhalted> <3F8CD774.4040400@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F8CD774.4040400@redhat.com>
Subject: [parisc-linux] Re: [PATCH] linuxthreads for hppa (1/3)
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

On Tue, Oct 14, 2003 at 10:13:24PM -0700, Ulrich Drepper wrote:
> 
> I think I've asked this before:
> 
> > 	Use __LT_INITIALIZER_NOT_ZERO instead of __LT_SPINLOCK_INIT.
> 
> Why?  No unnecessary changes.

__LT_SPINLOCK_INIT is the value of the structure and used for
initialization e.g. { 1, 1, 1, 1 }. It can no longer be used in a macro
evaluation like "#if __LT_SPINLOCK_INIT". Instead the other macros was
added.
 
> No unnecessary changes.  Leave the code you're not using alone.
> And again.

I made the mistake of adding my STACK_GROWS_UP fixes to this patch set.
If you note I have submitted a "Round 2" set of patches that remove
these changes.

Cheeers,
Carlos.
