From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 12:26:50 -0400 (EDT)
Message-ID: <20100622162651.E4CA1505C@hiauly1.hia.nrc.ca>
References: <AANLkTilfnhsd5mWmO_qJeCv0XmZ6IYKw6Il19No3_wnF@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTilfnhsd5mWmO_qJeCv0XmZ6IYKw6Il19No3_wnF@mail.gmail.com> from "Carlos O'Donell" at Jun 22, 2010 11:17:44 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> vfork ->
>   vfork syscall (pt-vfork.S)
> 
> This has not changed in 2.11.1.

I just assumed that a change must have occurred because of the behavior
of pex_unix_exec_child in libiberty/pex-unix.c.  I didn't investigate
history.

> Could you please elaborate on the change that you believe occurred in 2.11.=
> 1?
> 
> > I filed a sourceware bug, but closed it when I realized that
> > this is a glibc/kernel bug:
> > http://sourceware.org/bugzilla/show_bug.cgi?id=3D11730
> >
> > After spending some time looking at this, I realized that __vfork
> > is broken. =A0It should not allocate a frame as the child may clobber
> > the parent's frame when it does a call, etc. =A0A frame should only
> > be allocated and popped around the call to the syscall error handler.
> 
> Oh dear, yes I see. After the child returns from vfork, it calls exec,
> clobbering the vfork frame that the parent must still unwind from. Is
> that what you mean?

Yes.  Actually, pex_unix_exec_child may call dup2 and close as well.
In my gdb build, the parent's return address in the frame is clobbered
resulting in pex_child_error being called by the parent.

I looked at the hpux implementation and it doesn't create a frame.
Of course, the vfork syscall then must not clobber the return address,
etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
