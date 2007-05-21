From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
Date: Mon, 21 May 2007 14:19:49 -0400 (EDT)
Message-ID: <200705211819.l4LIJoVs021370__23782.2598814548$1416624359$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440705211019s1b62504epd54a585e5c473b5f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: libc-ports@sourceware.org,
 aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705211019s1b62504epd54a585e5c473b5f@mail.gmail.com>
	from "Carlos O'Donell" at May 21, 2007 01:19:54 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 5/21/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > > --- ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h.orig     2007-05-20 23:15:37.000000000 +0200
> > > +++ ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h  2007-05-20 23:15:59.000000000 +0200
> > > @@ -71,10 +71,10 @@
> > >       "copy   %5, %%r24                       \n\t"                   \
> > >       "ble    " LWS "(%%sr2, %%r0)            \n\t"                   \
> > >       "ldi    " LWS_CAS ", %%r20              \n\t"                   \
> > > +        "sub %%r0, %%r21, %%r21              \n\t"                   \
> > >       "cmpib,=,n " ASM_EAGAIN ",%%r21,0b      \n\t"                   \
> >
> > Hmmm, I think the original code was better since it keeps the sub
> > instruction outside the loop.  The cmpib instruction could be modified
> > to negate the ASM_EAGAIN.
> 
> The probability of the cmpib branching to 0b is directly proportional
> to the contention on the kernel lock selected by the address hash.
> Adding instructions to the loop is the equivalent of wasting time in
> userpace, so isn't it better to do as much in the loop as possible? I
> guess you waste memory bandwidth with the store.

In the linuxthread case, user spinlock code would typically spin a 
few times and then call nanosleep.  If this fails a few times, the code
calls sched_yield.  From a performance standpoint, I don't think it helps
to waste time in the loop itself.

On the otherhand, the atomic operations on the gateway page are short,
and processes on the gateway page are never supposed to be scheduled
off or sent signals.  So, I think a contended lock is only possible
with a SMP kernel.

> I hadn't considered this code would be an external API, but I guess it
> is... so these defines should probably go away and the constants
> merged into the code?

Yah, this just occurred to me.  It would be nice if the code could
use EAGAIN from errno.h but I can see that that's a bit tricky.
Possibly, a macro argument would work.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
