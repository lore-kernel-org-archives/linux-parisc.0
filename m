Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49D5D4868
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Oct 2003 12:37:11 -0600 (MDT)
Date: Wed, 15 Oct 2003 14:33:29 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ulrich Drepper <drepper@redhat.com>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031015183329.GG31385@systemhalted>
References: <20031010204444.GF6454@systemhalted> <3F8CD774.4040400@redhat.com> <20031015054045.GE22495@systemhalted> <3F8CE195.2090106@redhat.com> <20031015142648.GF22495@systemhalted> <3F8D85B9.8090504@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F8D85B9.8090504@redhat.com>
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

On Wed, Oct 15, 2003 at 10:36:57AM -0700, Ulrich Drepper wrote:
> > How do you propose it be handled? All arches define __LT_SPINLOCK_INIT
> 
> I'm talking about this __LOCK_INITIALIZER -> __LOCK_ALT_INITIALIZER
> change.  Why do you claim the right to rename the symbol?

The original __LOCK_INITIALIZER did not have a cast 
to (int).

The new __LOCK_INITIALIZER does not have a cast to 
(struct _pthread_fastlock)

When using a structure in an assignment within a function the named
initializer version is required, such that the constructor can setup the
object. Instead of using __LOCK_INITIALIZER which is already expected to
be of a certain type without a cast, I created __LOCK_ALT_INITIALIZER
and made 2 changes instead of the 6 or more that would be required had I
reversed the semantics.

The same logic applied when I defined __LT_SPINLOCK_ALT_INIT. In order
to minimize changes the default behaviour is to use the named init, the ALT
behaviour does not. The ALT case is hidden inside
__pthread_lock_define_initialized and cannot use a cast.

Should you like, I could reverse the behaviour of the above
__LOCK_ALT_INITIALIZER, but I would have to make changes to initspin.h
and pthread.h so the initialization macros work.

My net is currently down and I cannot verify if initspin.h and pthread.h
are the only files that would require changes.

In summary I chose the semantics to _minimize_ code change. If you
prefer header changes over core .c file changes then I can reverse the
semantics of __LOCK_INITIALIZER with that of the ALT version.

c.
