From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: [PATCH] linuxthreads for hppa (1/3)
Date: Wed, 15 Oct 2003 10:26:49 -0400
Message-ID: <20031015142648.GF22495__14409.5347998247$1416622877$gmane$org@systemhalted>
References: <20031010204444.GF6454@systemhalted> <3F8CD774.4040400@redhat.com> <20031015054045.GE22495@systemhalted> <3F8CE195.2090106@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
To: Ulrich Drepper <drepper@redhat.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3F8CE195.2090106@redhat.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Ulrich,

> - -# if __LT_SPINLOCK_INIT != 0
> - -  __pthread_handles[0].h_lock = __LOCK_INITIALIZER;
> - -  __pthread_handles[1].h_lock = __LOCK_INITIALIZER;
> +# ifdef __LT_INITIALIZER_NOT_ZERO
> +  __pthread_handles[0].h_lock = __LOCK_ALT_INITIALIZER;
> +  __pthread_handles[1].h_lock = __LOCK_ALT_INITIALIZER;
> 
> part is what I meant.  There is no reason to change the name.

How do you propose it be handled? All arches define __LT_SPINLOCK_INIT
and thus it cannot be used to distinguish between the two cases. Why do
we distinguish between the two cases? Because a structure as an
initializer has two different assignments cases, one in which it is
named and one which it is not.
 
> Look at your change, no changes of code which are not needed.  Clean up
> the patches to follow the coding standard, preprocessor indentation, etc
> etc.

I do apologize for the STACK_GROWS_UP patches being included, and
rightly so I removed them. Thank you for applying those patches.

I will go over my patches again for coding standard, preprocessor
indentation and other grievences. In most cases I have tried to follow 
the standard.

Cheers,
Carlos.
