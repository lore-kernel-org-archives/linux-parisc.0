From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: NTPL transition
Date: Fri, 5 Sep 2008 10:58:48 -0400
Message-ID: <119aab440809050758vc74673fj4a8cf65c29920daf@mail.gmail.com>
References: <20080904114551.GA18877@tilt.dandreoli.com>
	 <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com>
	 <20080904152329.GA24316@colo.lackof.org>
	 <119aab440809040831m2a4a3cffy3a8fbc747ca3b4a2@mail.gmail.com>
	 <20080904160407.GB24316@colo.lackof.org>
	 <1220550764.3276.45.camel@localhost.localdomain>
	 <119aab440809050517v2d26e2f1nd2d3e5aa0efe14bd@mail.gmail.com>
	 <1220623626.3331.5.camel@localhost.localdomain>
	 <20080905142014.GA27309@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "James Bottomley" <James.Bottomley@hansenpartnership.com>,
	"dann frazier" <dannf@dannf.org>,
	"Debian HPPA Port List" <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080905142014.GA27309@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Sep 5, 2008 at 10:20 AM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> I'm probably missing something huge here, but why can't we just put a
> sentinel value into the locks, make them equal sized, and use it as a
> lock versioning field?

No you aren't missing anything, this is what I meant by "I have to go
write some, code" in my other post.

> Since our locks are 16-bytes wide traditionally, that leaves us a
> bunch of places we could cram it.
>
> There's 3 cases I can think of:
>        1 - uninitialized static lock:
>                unlocked everywhere else and parisc-nptl (0), locked
>                on parisc-lt.

According to POSIX you may only initialize a mutex to an unlocked
state. So we can just treat an uninitialized parisc-lt lock as it it
were an uninitialized parisc-nptl lock. This is the case that "works"
on x86, but is not portable, nor is it correct under POSIX. We want
the same behaviour as x86 so that we can avoid tracking down the bugs
related to uninitialized static locks.

>        2 - initialized lock:
>                unlocked everywhere else and parisc-*, we end up with
>                4 32-bit values each containing a '1' on -lt. presumably
>                just 0 on -nptl.

To be technically correct this is a "static initialized lock" using
something like PTHREAD_MUTEX_INIT. We must version every function that
could have had a statically initialized lock, and at the start of said
function, check the lock words and reset as appropriate. This involves
a) Detect parisc-lt {1,1,1,1} and convert that to {0,0,0,0} b) If the
last word in the lock[4] is zero then do nothing. Note that with
parisc-nptl only the first word is used for locking and it doesn't
have to be more than int aligned.

>        3 - uninitialized dynamic lock:
>                broken everywhere, not really a particular problem.

All the broken packages that memset locks to zero just work on x86 but
not parisc-lt. The parisc porters have to track these down and fix
them. This is one of the reasons we changed the lock behaviour with
the kernel helper. This case should *just work* on parisc-nptl, like
on x86.

> If we just crammed a "new lock" value (say, 0xdeadbeef or something.)
> into the next word of the lock mod 4[1], and assumed any lock without that
> sentinel was a linuxthreads lock...

It's easier than that, you only have to detect the all 1's case. The
all zeroes case IMO can be treated like an uninitialized parisc-nptl
lock.

> I mean, aside from wasting 12-bytes of lock that will never be touched
> in the -nptl case, it seems like the easiest course...
>
> Since the -lt locks will LDCW the cacheline, it would never be valid to
> have an -lt lock with the sentinel set.
>
> Just a thought, but perhaps I am oversimplifying the issue.

It's a good thought.

Cheers,
Carlos.
