From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 16:08:08 -0500
Message-ID: <20091223210807.GB14837@hiauly1.hia.nrc.ca>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com> <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca> <119aab440912230701g6656be6fsdaf5383d2ff02363@mail.gmail.com> <20091223161504.GA13299@hiauly1.hia.nrc.ca> <20091223164828.GA13631@hiauly1.hia.nrc.ca> <20091223203956.GA14732@hiauly1.hia.nrc.ca> <119aab440912231245u5f1b88d3j54e11ad6a6e8953c@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912231245u5f1b88d3j54e11ad6a6e8953c@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 23 Dec 2009, Carlos O'Donell wrote:

> On Wed, Dec 23, 2009 at 3:39 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> > The deadlock occurs at the third call to Tcl_MutexLock in NotifierT=
hreadProc
> > (tclUnixNotfy.c:997). =A0This is in a while(1) loop, so I have to t=
hink
> > the previous call to Tcl_MutexUnlock failed, possibly because of a =
call
> > to Tcl_ConditionNotify.
>=20
> You might get a better idea if you run this under strace and look at
> the futex syscalls being made. You won't see the locks since the fast
> path is through the light-weight-syscall compare-and-swap, but you
> will see the unlocks, and you can count them.

I would guess that the notifierMutex is locked/unlocked millions of
time in a typical GCC testsuite run.  So, the problem won't be easy
to duplicate manually.

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
