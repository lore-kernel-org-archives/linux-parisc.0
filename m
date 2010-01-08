From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Fri, 8 Jan 2010 11:37:55 -0500 (EST)
Message-ID: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca>
References: <4B46083D.2030109@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B46083D.2030109@gmx.de> from "Helge Deller" at Jan 7, 2010 05:13:49 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
> On 01/07/2010 12:33 AM, John David Anglin wrote:
> >>> clone(Process 1684 attached (waiting for parent)
> >>> Process 1684 resumed (parent 1683 ready)
> >>> child_stack=0x4076d040, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x40f6c4e8, tls=0x40f6c900, child_tidptr=0x40f6c4e8) = 1684
> >>
> >> I noticed the tidptr for the fork may not be correct:
> >>
> >> clone(child_stack=0x40e87040, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x416864e8, tls=0x41686900, child_tidptr=0x416864e8) = 31613
> >> clone(child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x40002028) = 31614
> >>
> >> I would have thought the value should have been the same as that in the
> >> clone from the pthread_create call.
> >
> > It's possible that this is done intentionally...  The parent_tidptr
> > is the one that's wrong in the first clone.

I now think this probably is a glibc bug.  The kernel uses this value
when the CLONE_PARENT_SETTID flag is passed.

> > I have noticed something else in the minifail kernel register dumps:
> >
> > Jan  6 15:54:05 hiauly6 kernel: sr00-03  00000024 0000001b 00000000 00000024
> > Jan  6 15:54:05 hiauly6 kernel: sr04-07  00000024 00000024 00000024 00000024
> >
> > sr1 seems to contain an odd value.  This seems to be the case in all
> > minifail register dumps.
> 
> IIRC, for me most crashes had sr1=0. Only a very few had sr1 != 0.
> 
> > I checked that the sr1 value doesn't belong
> > to the child of the fork call.  This might indicate a tlb/cache issue
> > as sr1 is used for these operations.

I added some loops in the parent and child threads.  I also added code
in the child thread to watch the return point location on the stack
for start_thread.  What I found is the stack gets overwritten after
the thread has started.  At the same time, the parent is looping
post fork.

So, the problem has to be with fork (i.e., its not with pthread_join
or pthread_exit).  Still think the problem involves sr1 (it's unusual
the sr1 contains a value that's not the user or kernel values).

I played with saving sr1 in some additional places (tlb and cache
flushing) but this didn't alter things.  Haven't played with pa_memcpy.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
