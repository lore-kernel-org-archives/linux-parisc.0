From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Fri, 8 Jan 2010 16:43:46 -0500 (EST)
Message-ID: <20100108214346.CEB465160@hiauly1.hia.nrc.ca>
References: <4B47A130.8060603@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B47A130.8060603@gmx.de> from "Helge Deller" at Jan 8, 2010 10:18:40 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Maybe we have a futex problem in glibc on hppa?
> In glibc nptl/pthread_mutex_trylock.c we check the return value of a futex syscall against EWOULDBLOCK.
> Since on parisc - in contrast to all other architectures - we have EWOULDBLOCK!=EAGAIN, we maybe missed a check?

That's a very interesting observation!  The manpage doesn't say
EWOULDBLOCK is a valid error return for FUTEX(2).  I wonder is there
are more slips like this.  It looks like the same bug is present in
nptl/sysdeps/unix/sysv/linux/sem_wait.c and
nptl/sysdeps/unix/sysv/linux/sem_timedwait.c.

This might explain my previous mail.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
