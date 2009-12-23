From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 11:48:28 -0500
Message-ID: <20091223164828.GA13631@hiauly1.hia.nrc.ca>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com> <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca> <119aab440912230701g6656be6fsdaf5383d2ff02363@mail.gmail.com> <20091223161504.GA13299@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091223161504.GA13299@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 23 Dec 2009, John David Anglin wrote:

> As you noted, the lock is held by the other thread.  The return pc is
> beyond Tcl_WaitForEvent.  The only users of the notifierMutex mutex
> are in tclUnixNotfy.c.  The only interesting thing done holding the
> notifierMutex mutex in code after Tcl_WaitForEvent is to call
> Tcl_ConditionNotify.  It calls pthread_cond_broadcast if the condition
> pointer isn't NULL.
> 
> Could this deadlock?  It's hard to see how it could since the mutex
> doesn't seem to be involved.

Actually, I see that the mutex and futex are part of the pthread_cond_t
type, so pthread_cond_broadcast could deadlock if not implemented properly.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
