From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Fri, 8 Jan 2010 17:31:52 -0500 (EST)
Message-ID: <20100108223153.1263B4EF4@hiauly1.hia.nrc.ca>
References: <119aab441001081344i7eb3c3f3s9c22eeaecf4d0e1a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001081344i7eb3c3f3s9c22eeaecf4d0e1a@mail.gmail.com> from "Carlos O'Donell" at Jan 8, 2010 04:44:51 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Jan 8, 2010 at 4:44 PM, Carlos O'Donell <carlos@systemhalted.org> w=
> rote:
> > On Fri, Jan 8, 2010 at 4:18 PM, Helge Deller <deller@gmx.de> wrote:
> >>> I now think this probably is a glibc bug. =A0The kernel uses this value
> >>> when the CLONE_PARENT_SETTID flag is passed.
> >>
> >>
> >> Maybe we have a futex problem in glibc on hppa?
> >> In glibc nptl/pthread_mutex_trylock.c we check the return value of a fut=
> ex
> >> syscall against EWOULDBLOCK.
> >> Since on parisc - in contrast to all other architectures - we have
> >> EWOULDBLOCK!=3DEAGAIN, we maybe missed a check?
> >
> > That's a bug. There are several kernel paths that could return EAGAIN
> > *or* EWOULDBLOCK via the FUTEX_TRYLOCK_PI futex operation.

Hacking glibc to check for both does not fix the testcase ;(

> > However, I think Dave is on to something with the
> 
> ...kernel issue.
> 
> We might have *several* outstanding bugs :-)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
