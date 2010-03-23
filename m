From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Tue, 23 Mar 2010 18:23:06 -0400 (EDT)
Message-ID: <20100323222307.17CB4513F@hiauly1.hia.nrc.ca>
References: <119aab441003231432nefa1848u86a9313fc1e45a5f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, kyle@mcmartin.ca, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003231432nefa1848u86a9313fc1e45a5f@mail.gmail.com> from "Carlos O'Donell" at Mar 23, 2010 05:32:11 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I can't get minifail2 to fail, how are you choosing which stack
> address to watch for corruption?

The stack allocated by pthread_create is always placed at 0x40000000
in my runs.  The location that the last version which I sent monitors
is 0x4000001c.  This is the location where thread_run saves %r26
shortly after entry.

I'm compiling without optimization as indicated in the comment.  Usually,
I also link with -static since gdb is somewhat broken when debugging
shared libraries.  If the compile is optimized, then thread_run may
not save much on the stack and it may be harder to get it to fail.

The problem is timing dependent.  I'm a bit surprised that you can't
duplicate the problem as Helge could.  When I run the test loop, it
fails about one in thirty on my c3750.  I have a 250 Hz tick rate in
my config.  The fail rate is somewhat dependent on system load.

I added the monitor loops to try and pin down when the corruption occurs
but the test should fail if the thread's stack region gets corrupted
while thread_run executes.

Have you made any changes to libc which would affect the synchonization
of parent and child?  I think the problem might be fixed if the parent
and thread were prevented from executing until the fork is complete.
I still think the kernel is interchanging the pages used by the parent
and child for the mmap'd stack region.

> Are you looking at the child's new stack created by mmap?

We are looking at the area allocated by mmap in the call to pthread_create.
This is always where the corruption occurs in the subsequent fork call.

This area is used as the stack for the thread created by pthread_create.
When the problem occurs, it's the thread that generates the fault, never
the original parent.

> Are you looking at the parent's stack?

No.  However, the parent can see changes to the stack area used by the
thread created by the pthread_create call.  As I understand the situtation,
the child of the fork call should see a snapshot of this area as it was
at the time of the fork call.  fork is nominally supposed to be "atomic"
(see Open Group man page).

In both the parent and forked child, the first three words starting at
0x40000000 are always nonzero and correct.  That's why I think the pages
are getting interchanged (I also played with adding extra cache flushes
in pacache.S but that didn't change things).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
