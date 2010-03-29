From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Mon, 29 Mar 2010 10:02:58 -0400
Message-ID: <20100329140257.GA9394@hiauly1.hia.nrc.ca>
References: <119aab441003281404y7bc37dddw14db435b85704b4f@mail.gmail.com> <20100328212110.03F224E77@hiauly1.hia.nrc.ca> <119aab441003281612j6bf4d910g52f94490824cfd81@mail.gmail.com> <20100328235937.GA5806@hiauly1.hia.nrc.ca> <119aab441003281724h78186fbwa415f7ac046269e2@mail.gmail.com> <20100329023854.GA6633@hiauly1.hia.nrc.ca> <119aab441003290511p6ca7904dxdfc7def8e0777662@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003290511p6ca7904dxdfc7def8e0777662@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 29 Mar 2010, Carlos O'Donell wrote:

> > I got a kernel to boot which shouldn't clobber r19. =A0Turned out t=
o
> > be a typo. =A0This uses PT_SR4 for the kernel return for the child.
> > Will test with gcc build.
> >
> > Will try again using the pad0 field later.
>=20
> Sorry, what turned out to be a typo?

I used PT_SR4 instead of TASK_PT_SR4 in child_return ;(

> I guess any static binary that calls fork/vfork/clone is susceptible
> to corruption of r19 in this way.
>=20
> I don't know how much that effects userspace, since most is shared,
> *however* the dynamic linker is technically a static binary :-)

The change may not fix much, but there's no technical reason that
the kernel needs to clobber r19.

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
