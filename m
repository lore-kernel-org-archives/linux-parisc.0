From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 22:38:54 -0400
Message-ID: <20100329023854.GA6633@hiauly1.hia.nrc.ca>
References: <119aab441003281404y7bc37dddw14db435b85704b4f@mail.gmail.com> <20100328212110.03F224E77@hiauly1.hia.nrc.ca> <119aab441003281612j6bf4d910g52f94490824cfd81@mail.gmail.com> <20100328235937.GA5806@hiauly1.hia.nrc.ca> <119aab441003281724h78186fbwa415f7ac046269e2@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003281724h78186fbwa415f7ac046269e2@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 28 Mar 2010, Carlos O'Donell wrote:

> On Sun, Mar 28, 2010 at 7:59 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> >> I know it's easier to debug a static application for these cases, =
so I
> >> think a fixed glibc will help.
> >
> > Yes.
> >
> > It's proving more difficult than I thought to fix the kernel and
> > I'm not sure I understand how this works:
> >
> > =A0 =A0 =A0 =A0LDREG =A0 TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE-FRAME_SI=
ZE(%r30), %r1
> > =A0 =A0 =A0 =A0LDREG =A0 TASK_PT_GR19(%r1),%r2
> > =A0 =A0 =A0 =A0b =A0 =A0 =A0 wrapper_exit
> > =A0 =A0 =A0 =A0copy =A0 =A0%r0,%r28
> >
> > It appears the child has to access the parent's pt_regs struct
> > to load the return for the child.
>=20
> I see that copy_process in do_fork will give the child a copy of the
> entire pt_reg structure so it has access to these values anyway?

I got a kernel to boot which shouldn't clobber r19.  Turned out to
be a typo.  This uses PT_SR4 for the kernel return for the child.
Will test with gcc build.

Will try again using the pad0 field later.

Dave
--=20
J. David Anglin                                  dave.anglin@nrc-cnrc.g=
c.ca
National Research Council of Canada              (613) 990-0752 (FAX: 9=
52-6602)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
