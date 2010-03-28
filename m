From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 19:59:38 -0400
Message-ID: <20100328235937.GA5806@hiauly1.hia.nrc.ca>
References: <119aab441003281404y7bc37dddw14db435b85704b4f@mail.gmail.com> <20100328212110.03F224E77@hiauly1.hia.nrc.ca> <119aab441003281612j6bf4d910g52f94490824cfd81@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003281612j6bf4d910g52f94490824cfd81@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 28 Mar 2010, Carlos O'Donell wrote:

> On Sun, Mar 28, 2010 at 5:21 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> >> If I provide you with a new glibc with the r19 fix would you be able
> >> to test it out?
> >
> > Yes.
> 
> I know it's easier to debug a static application for these cases, so I
> think a fixed glibc will help.

Yes.

It's proving more difficult than I thought to fix the kernel and
I'm not sure I understand how this works:

        LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE-FRAME_SIZE(%r30), %r1
	LDREG   TASK_PT_GR19(%r1),%r2
	b       wrapper_exit
	copy    %r0,%r28

It appears the child has to access the parent's pt_regs struct
to load the return for the child.

> I have an unstable libc6 currently building with the changes to
> save/restore r19 in all cases.

Great.

> We still aren't any closer to explaining why my shared case doesn't work.
> 
> I still don't have a good answer to this question:
> 
> * What prevents the execve from returning to userspace?

I presume you mean the caller's userspace.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
