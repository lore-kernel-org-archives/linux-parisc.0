From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 18 Jan 2010 10:50:00 -0500 (EST)
Message-ID: <20100118155001.13C554EF1@hiauly1.hia.nrc.ca>
References: <4B524912.4070204@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B524912.4070204@gmx.de> from "Helge Deller" at Jan 17, 2010 00:17:38 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

If you link the test with -static, you should be able to set
breaks in your test application and determine why _exit isn't
called.

I'm in the process of moving homes, so I don't have much time
to investigate myself.

Dave

> On 01/08/2010 10:44 PM, Carlos O'Donell wrote:
> > On Fri, Jan 8, 2010 at 4:18 PM, Helge Deller<deller@gmx.de>  wrote:
> >>> I now think this probably is a glibc bug.  The kernel uses this value
> >>> when the CLONE_PARENT_SETTID flag is passed.
> >>
> >>
> >> Maybe we have a futex problem in glibc on hppa?
> >> In glibc nptl/pthread_mutex_trylock.c we check the return value of a futex
> >> syscall against EWOULDBLOCK.
> >> Since on parisc - in contrast to all other architectures - we have
> >> EWOULDBLOCK!=EAGAIN, we maybe missed a check?
> >
> > That's a bug. [...]
> 
> Carlos,  Dave,
> 
> I'm wondering if we have another bug in glibc...?
> 
> When running strace, I noticed that a thread which returns with "return 0",
> exits the process on hppa with exit(0):
> [pid  1875] write(1, "Thread OK.\n", 11) = 11
> [pid  1875] exit(0)
> 
> On my x86_64 I see:
> [pid  8154] write(1, "Thread OK.\n", 11) = 11
> [pid  8154] _exit(0)                    =
> 
> In ports/sysdeps/unix/sysv/linux/hppa/clone.S (line 170) I do see:
>          /* The call to _exit needs saved r19.  */
>          bl      _exit, %rp
>          copy    %ret0, %arg0
> 
> This coding seems to indicate that we call _exit(), but we aren't (as
> you see above in the strace).
> So I'm wondering if the "bl _exit,%rp" needs changing.
> Something with HIDDEN_JUMPTARGET(_exit) or similar, so that
> _exit() instead of exit() is called?
> 
> Actually I did tested this with the minifail test program, and changed
> thread_run() to call _exit(0) at the end instead of "return 0":
> void* thread_run(void* arg) {
> 	...
> /*	return (void *)&status;  */
>          _exit(0);
> }
> With strace I then suddenly got exit_group() which seems more correct:
> [pid  1910] write(1, "Thread OK.\n", 11) = 11
> [pid  1910] exit_group(0)               = ?
> 
> Helge
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
