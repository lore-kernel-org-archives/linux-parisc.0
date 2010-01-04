From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 4 Jan 2010 13:11:39 -0500
Message-ID: <20100104181138.GA2252@hiauly1.hia.nrc.ca>
References: <20100101034858.80D264EA9@hiauly1.hia.nrc.ca> <20100104162732.10090@gmx.net> <119aab441001040916v4ed3fb61od24cfcc6e3558faa@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	dave.anglin@nrc-cnrc.gc.ca
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001040916v4ed3fb61od24cfcc6e3558faa@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 04 Jan 2010, Carlos O'Donell wrote:

> On Mon, Jan 4, 2010 at 11:27 AM, Helge Deller <deller@gmx.de> wrote:
> This is wrong. Each thread should have 8MB of stack. If we only get ~
> 0x40 bytes then npt/nptl-init.c is setting __default_stacksize
> incorrectly.

The 0x40 bytes is the initial frame allocated for clone running in
the child thread.   The code is not running out of stack space.

> Even PTHREAD_STACK_MIN should be 16kb?
> 
> Could you verify that your assertion that only ~ 0x40 bytes of initial
> room were allocated?
> 
> > e) Thus the child either crashes, overwrites memory of the parent or does other things wrong.
> 
> I agree with your analysis, but the error is that more stack should be
> allocated.

I don't follow that conclusion.  The stack grows upward and the stack
pointer isn't out of range.   The fork operation is somehow
corrupting the stack memory of the thread created by pthread_create.
I would say the parent is corrupting its own memory.  I doubt the
forked child is affecting the parent.  Fork would have to behave like
vfork to do this.  I have seen the pthread_create thread fail before
the clone syscall of the following fork.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
