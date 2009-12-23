From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 11:15:05 -0500
Message-ID: <20091223161504.GA13299@hiauly1.hia.nrc.ca>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com> <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca> <119aab440912230701g6656be6fsdaf5383d2ff02363@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912230701g6656be6fsdaf5383d2ff02363@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 23 Dec 2009, Carlos O'Donell wrote:

> On Tue, Dec 22, 2009 at 5:05 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> >> I think we need to step back from the edge and ask ourselves what
> >> Tcl_WaitForEvent() is trying to do with the locks.
> >>
> >> Do you know?
> >
> > In unix/tclUnixNotify.c:
> >
> > #ifdef TCL_THREADS
> > =A0 =A0/*
> > =A0 =A0 * Place this thread on the list of interested threads, sign=
al the
> > =A0 =A0 * notifier thread, and wait for a response or a timeout.
> > =A0 =A0 */
>=20
> There will never be a timeout if you call pthread_mutex_lock as the
> underlying operation. So this comment is a bit odd?

The wait is done by Tcl_ConditionWait.  It uses  pthread_cond_wait
if timePtr is NULL, otherwise it uses
pthread_cond_timedwait(pcondPtr, pmutexPtr, &ptime).  Do these work
holding a lock?  Any chance that these try to take a lock?

It sems like bad coding to do a wait holding a lock.  In any case,
I don't think this is the problem.

As you noted, the lock is held by the other thread.  The return pc is
beyond Tcl_WaitForEvent.  The only users of the notifierMutex mutex
are in tclUnixNotfy.c.  The only interesting thing done holding the
notifierMutex mutex in code after Tcl_WaitForEvent is to call
Tcl_ConditionNotify.  It calls pthread_cond_broadcast if the condition
pointer isn't NULL.

Could this deadlock?  It's hard to see how it could since the mutex
doesn't seem to be involved.

Dave
--=20
J. David Anglin                                  dave.anglin@nrc-cnrc.g=
c.ca
National Research Council of Canada              (613) 990-0752 (FAX: 9=
52-6602)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
