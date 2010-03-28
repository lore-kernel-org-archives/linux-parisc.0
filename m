From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 14:00:38 -0400
Message-ID: <20100328180038.GA3732@hiauly1.hia.nrc.ca>
References: <119aab441003272026o55db5202sd345df270f3b0e1f@mail.gmail.com> <20100328154241.GA2782@hiauly1.hia.nrc.ca> <119aab441003281026u3705723fj9446637943451a4e@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003281026u3705723fj9446637943451a4e@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 28 Mar 2010, Carlos O'Donell wrote:

> Broken how?

See other mail.

> A small note about getpid():
> 
> Since the parent and child share the same memory space, the parent
> temporarily negates the cached PID value just before the vfork. Only
> the parent, after the vfork, restores the cached PID. This is on
> purpose to prevent any functions like PID-related functions from
> working in the child() during the window bewteen vfork and execve.

Ok, it might be glibc that's broken (i.e., it doesn't restore correct
dave).

> The printf call in the child path is ABSOLUTELY wrong, but I wanted to
> see what the return was. You could equally well insert:
> 
> #define ABORT_INSTRUCTION asm ("iitlbp %r0,(%sr0, %r0)")

Tried that and it didn't trigger.

> > My guess would be that the parent is not blocked leading to corruption.
> 
> What I see is that the child is returning from the kernel execve, and
> continuing to execute.

Hmmm, I'm not seeing that, but I do have the patch installed that
reloads %r16 after calling schedule.  %r16 isn't clobbered by the
call but I believe %cr30 can change.  As a result, we may run a task
with the wrong registers with the current code.

See <http://article.gmane.org/gmane.linux.ports.parisc/2687>.

> If I use ABORT_INSTRUCTION in the child right after the execve I see this:

Already tried this.

> carlos@firin:~/fsrc/vforkfailure/test$ ./vfork
> Illegal instruction
> carlos@firin:~/fsrc/vforkfailure/test$ In child 28734
> 
> This makes *no* sense.
> 
> What I don't understand is this:
> 
> * vfork'd child shares memory space with parent, therefore space id
> has to be the same?

Sounds right.

> * Does execve give the process a new space id or does it simply
> overwrite the entire process image?
> 
> So I had the test case try to exec a binary that just calls ABORT_INSTRUCTION.
> 
> What I noticed is the following:
> 
> carlos@firin:~/fsrc/vforkfailure/test$ ./vfork
> parent sr3 is 0x3428000
> Illegal instruction
> 
> There are 2 entries in dmesg:
> vfork (pid 28964): Illegal instruction (code 8) at 00000000000106a7
> main (pid 28965): Illegal instruction (code 8) at 00000000000104af
> 
> * The child returning from execve has the same space id as the parent
> e.g. 0x3418000
> * The process run via the execve has a different space id e.g. 0x3418800

That's what I would have expected for execve.

> What is supposed to stop the child, which called execve, from
> returning to the parent?

It's only supposed to happen if there is an error in the execve call.
I think our task scheduling is broken ;(

Could you try my change and see if it helps?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
