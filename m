From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Mon, 04 Jan 2010 21:51:17 +0100
Message-ID: <4B4254C5.3050302@gmx.de>
References: <20100101034858.80D264EA9@hiauly1.hia.nrc.ca> <20100104162732.10090@gmx.net> <119aab441001040916v4ed3fb61od24cfcc6e3558faa@mail.gmail.com> <20100104181138.GA2252@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100104181138.GA2252@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/04/2010 07:11 PM, John David Anglin wrote:
> On Mon, 04 Jan 2010, Carlos O'Donell wrote:
>
>> On Mon, Jan 4, 2010 at 11:27 AM, Helge Deller<deller@gmx.de>  wrote:
>> This is wrong. Each thread should have 8MB of stack. If we only get ~
>> 0x40 bytes then npt/nptl-init.c is setting __default_stacksize
>> incorrectly.
>
> The 0x40 bytes is the initial frame allocated for clone running in
> the child thread.   The code is not running out of stack space.

Hmmm...

strace on minifail (as attached to Dave's mail) gives me:

getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
mmap(NULL, 8388608, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4076d000
brk(0)                                  = 0x12000
brk(0x33000)                            = 0x33000
mprotect(0x40f6b000, 4096, PROT_NONE)   = 0
clone(Process 1684 attached (waiting for parent)
Process 1684 resumed (parent 1683 ready)
child_stack=0x4076d040, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x40f6c4e8, tls=0x40f6c900, child_tidptr=0x40f6c4e8) = 1684

The mmap() allocates and maps the new child stack -> at 0x4076d000
The clone() syscall is called with child_stack=0x4076d040

I might be wrong, but that's the 0x40 bytes I mentioned.
  
>> Even PTHREAD_STACK_MIN should be 16kb?

The example above allocates 8MB.
But my point is, that child_stack starts at 0x4076d040, and
that LWS (in the child process with the stack as given above) tries to
store something to an address lower than 0x4076d000.

>> Could you verify that your assertion that only ~ 0x40 bytes of initial
>> room were allocated?
>>
>>> e) Thus the child either crashes, overwrites memory of the parent or does other things wrong.
>>
>> I agree with your analysis, but the error is that more stack should be
>> allocated.

Not more stack.
Just increasing the 0x40 initial byte offset, but that's IMHO a hack...

> I don't follow that conclusion.  The stack grows upward and the stack
> pointer isn't out of range.   The fork operation is somehow
> corrupting the stack memory of the thread created by pthread_create.
> I would say the parent is corrupting its own memory.  I doubt the
> forked child is affecting the parent.  Fork would have to behave like
> vfork to do this.  I have seen the pthread_create thread fail before
> the clone syscall of the following fork.

Doesn't pthread_create() created processes share the memory with
their parents? In that case, the child can crash or even overwrite memory
of the parent process...?

Helge
