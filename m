From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Tue, 22 Dec 2009 17:05:13 -0500 (EST)
Message-ID: <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com> from "Carlos O'Donell" at Dec 22, 2009 03:30:59 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I think we need to step back from the edge and ask ourselves what
> Tcl_WaitForEvent() is trying to do with the locks.
> 
> Do you know?

In unix/tclUnixNotify.c:

#ifdef TCL_THREADS
    /*
     * Place this thread on the list of interested threads, signal the
     * notifier thread, and wait for a response or a timeout.
     */

    Tcl_MutexLock(&notifierMutex);
    ...
#endif

    ...

#ifdef TCL_THREADS
    Tcl_MutexUnlock(&notifierMutex);
#endif /* TCL_THREADS */
    return 0;
}

There may be a timed wait while holding the lock.  Something is broken
in the tcl/expect handling of timed waits as there were a couple of
compile timeouts for compilations that shouldn't have timed out.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
