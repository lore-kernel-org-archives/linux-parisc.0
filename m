From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: NTPL transition
Date: Fri, 5 Sep 2008 10:20:14 -0400
Message-ID: <20080905142014.GA27309@phobos.i.cabal.ca>
References: <20080904114551.GA18877@tilt.dandreoli.com> <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com> <20080904152329.GA24316@colo.lackof.org> <119aab440809040831m2a4a3cffy3a8fbc747ca3b4a2@mail.gmail.com> <20080904160407.GB24316@colo.lackof.org> <1220550764.3276.45.camel@localhost.localdomain> <119aab440809050517v2d26e2f1nd2d3e5aa0efe14bd@mail.gmail.com> <1220623626.3331.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	dann frazier <dannf@dannf.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220623626.3331.5.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[Disclaimer: Grain of salt and all that other nonsense, I am pretty
 ignorant about why this is so difficult to handle.]

On Fri, Sep 05, 2008 at 09:07:06AM -0500, James Bottomley wrote:
> > No, due to library-to-library dependencies you have the same problem.
> > You would either have to rebuild *all* the libraries or continue
> > splitting each library into two packages lib and lib-nptl.
> 
> We are going to have to rebuild all the libraries, that's not an option
> because of the ABI change.
> 
> The problem is not to avoid this, but to find a way of doing an online
> upgrade.  The real problem we have to avoid is breaking system tools
> that are required to perform the upgrade in the intermediate steps.  I
> don't rule out that will require us to pull this trick with some
> libraries in addition to libc, but I don't think it will be all of them.
> Just doing libc will probably fix the majority of the issues, though.
> 

I'm probably missing something huge here, but why can't we just put a
sentinel value into the locks, make them equal sized, and use it as a
lock versioning field?

Since our locks are 16-bytes wide traditionally, that leaves us a
bunch of places we could cram it.

There's 3 cases I can think of:
	1 - uninitialized static lock:
		unlocked everywhere else and parisc-nptl (0), locked
		on parisc-lt.

	2 - initialized lock:
		unlocked everywhere else and parisc-*, we end up with
		4 32-bit values each containing a '1' on -lt. presumably
		just 0 on -nptl.

	3 - uninitialized dynamic lock:
		broken everywhere, not really a particular problem.

If we just crammed a "new lock" value (say, 0xdeadbeef or something.)
into the next word of the lock mod 4[1], and assumed any lock without that
sentinel was a linuxthreads lock... 

I mean, aside from wasting 12-bytes of lock that will never be touched
in the -nptl case, it seems like the easiest course...

Since the -lt locks will LDCW the cacheline, it would never be valid to
have an -lt lock with the sentinel set.

Just a thought, but perhaps I am oversimplifying the issue.
	Kyle

1. I mean, if the lock entry is lock[0], we use lock[1], if lock[3], we
	use lock[0].
