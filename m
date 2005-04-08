From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Fri, 8 Apr 2005 18:54:20 -0400 (EDT)
Message-ID: <200504082254.j38MsKfA018596@hiauly1.hia.nrc.ca>
References: <20050408212918.GK1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050408212918.GK1833@baldric.uwo.ca> from "Carlos O'Donell" at
	Apr 8, 2005 05:29:18 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Since technically this is not possible, the mutex .lock in __fork_block
> makes sure that such a thing can't occur.

The program hangs doesn't it?

If the handler registration is done before the fork, I'll believe you.
However, if they are done after the fork, the lock isn't going to help.
The same problem could occur if a signal is taken during deregistration
when exiting from main.

A signal can be taken while the mutex is locked, or as it appears when
__status is 1.  Since the signal handler does an exit, the main code
never runs again and there is no way it can change the lock or __status.
So, we end up suspending the task while its trying to exit (i.e.,
deadlock).

If the signal handler returns instead of exits, there isn't a problem.
If the child delays sending the signal a bit, there isn't a problem.

In the presence of signals, I believe that adding and removing
handlers run at exit needs to be atomic.  A simple mutex isn't
sufficient as a thread or task may die in the critical region.
Even if there is a mutex recovery mechanism, a handler might get
run twice, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
