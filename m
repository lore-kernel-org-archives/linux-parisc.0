From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 4 Jan 2010 16:39:30 -0500 (EST)
Message-ID: <20100104213931.5BEAA4EA9@hiauly1.hia.nrc.ca>
References: <4B4254C5.3050302@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B4254C5.3050302@gmx.de> from "Helge Deller" at Jan 4, 2010 09:51:17 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 01/04/2010 07:11 PM, John David Anglin wrote:
> > On Mon, 04 Jan 2010, Carlos O'Donell wrote:
> >
> >> On Mon, Jan 4, 2010 at 11:27 AM, Helge Deller<deller@gmx.de>  wrote:
> >> This is wrong. Each thread should have 8MB of stack. If we only get ~
> >> 0x40 bytes then npt/nptl-init.c is setting __default_stacksize
> >> incorrectly.
> >
> > The 0x40 bytes is the initial frame allocated for clone running in
> > the child thread.   The code is not running out of stack space.
> 
> Hmmm...
> 
> strace on minifail (as attached to Dave's mail) gives me:
> 
> getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
> mmap(NULL, 8388608, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4076d000
> brk(0)                                  = 0x12000
> brk(0x33000)                            = 0x33000
> mprotect(0x40f6b000, 4096, PROT_NONE)   = 0
> clone(Process 1684 attached (waiting for parent)
> Process 1684 resumed (parent 1683 ready)
> child_stack=0x4076d040, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x40f6c4e8, tls=0x40f6c900, child_tidptr=0x40f6c4e8) = 1684
> 
> The mmap() allocates and maps the new child stack -> at 0x4076d000
> The clone() syscall is called with child_stack=0x4076d040

So, in this case, start_thread will be called with $sp = 0x4076d040.
The second instruction of start_thread increments $sp by 0x1c0.

> 
> I might be wrong, but that's the 0x40 bytes I mentioned.
>   
> >> Even PTHREAD_STACK_MIN should be 16kb?
> 
> The example above allocates 8MB.
> But my point is, that child_stack starts at 0x4076d040, and
> that LWS (in the child process with the stack as given above) tries to
> store something to an address lower than 0x4076d000.

This would be bad.  However, the LWS calls are in "start_thread", so
it didn't appear that the stack offsets that you mentioned were out
of range.  GCC would be terribly broken if it got these offsets wrong
in general.

> >> Could you verify that your assertion that only ~ 0x40 bytes of initial
> >> room were allocated?
> >>
> >>> e) Thus the child either crashes, overwrites memory of the parent or does other things wrong.
> >>
> >> I agree with your analysis, but the error is that more stack should be
> >> allocated.
> 
> Not more stack.
> Just increasing the 0x40 initial byte offset, but that's IMHO a hack...
> 
> > I don't follow that conclusion.  The stack grows upward and the stack
> > pointer isn't out of range.   The fork operation is somehow
> > corrupting the stack memory of the thread created by pthread_create.
> > I would say the parent is corrupting its own memory.  I doubt the
> > forked child is affecting the parent.  Fork would have to behave like
> > vfork to do this.  I have seen the pthread_create thread fail before
> > the clone syscall of the following fork.
> 
> Doesn't pthread_create() created processes share the memory with
> their parents? In that case, the child can crash or even overwrite memory
> of the parent process...?

We have to be careful about semantics.  The child of the fork runs
in a different address space, so it is unlikely that it can corrupt
the parent directly.  It is true that the child inherits all the
pthread mutexs and the thread context of the thread which called fork.
The child could close the file descriptors of the parent.  It could
affect any context that is stored in the kernel.

The fork call is involved in this bug.  I have verified that the faults
don't occur if it is removed.  The faults don't occur if a sleep(1) call
is added between the pthread_create and fork calls.

I think the parent thread is corrupting the stack of the child thread
created by pthread_create, but I don't know how this happens.  I have
seen at least one case where this corruption occurs prior to the system
clone call for the fork.  I think we must have some kind of lock
failure which is timing dependent (i.e., the scheduling of the parent
and child threads).

I thought this likely indicated the lws code wasn't atomic.  We don't
allow schedule to run if we are on the gateway page.  I'm starting
to wonder if threads (not processes) are still being scheduled.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
