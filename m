From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: CAS (lws_compare_and_swap32)
Date: Mon, 29 Mar 2010 21:54:56 -0400
Message-ID: <20100330015455.GA13505@hiauly1.hia.nrc.ca>
References: <4BB0B2C8.8000302@fsij.org> <119aab441003290913x6cb925b9v66b44a14c31393cb@mail.gmail.com> <119aab441003291231j320e6637g87c201f75ee61faf@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: NIIBE Yutaka <gniibe@fsij.org>, debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003291231j320e6637g87c201f75ee61faf@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 29 Mar 2010, Carlos O'Donell wrote:

> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prev =3D *addr;
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ( prev =3D=3D old )
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*addr =3D new;
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return prev;
> >> =A0 =A0 =A0 =A0*/
> >> [...]
> >> cas_action:
> >> [...]
> >> =A0 =A0 =A0 =A0/* The load and store could fail */
> >> 1: =A0 =A0 =A0ldw =A0 =A0 0(%sr3,%r26), %r28
> >> =A0 =A0 =A0 =A0sub,<> =A0%r28, %r25, %r0
> >> 2: =A0 =A0 =A0stw =A0 =A0 %r24, 0(%sr3,%r26)
> >> ----------------
> >>
> >> Suppose that <addr> points to copy-on-write memory. =A0At the labe=
l 2,
> >> storing data to <addr> will invoke memory trap and it will go to
> >> do_page_fault() to get new memory. =A0In this scenario, is there a
> >> possibility for the process to be scheduled off?

> > At the time I wrote it I tried to verify that the process calling t=
he
> > CAS could never sleep, since this would make it non-atomic.
> >
> > There are checks in entry.S to prevent return code-paths from
> > scheduling or delivering signals if the process was executing on th=
e
> > gateway page.
> >
> > If we are certain that the above could happen, then a possible solu=
tion is:
> > * Enable locks for SMP and UP.
> > * If lock is taken for your addresss, return to userspace with EAGA=
IN.
> > * Userspace yields on EAGAIN and then tries again (we can't use
> > FUTEX_WAIT/FUTEX_WAKE on a global process unique variable because L=
WS
> > CAS is expected to work on shmem).

I think the solution may be to proceed the CAS sequence with a probe,w
instruction.  This will trigger a non-access TLB miss fault/non-access
data page fault if its going to happen.  There is a FIXME for case 17
in handle_interruption about this.

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
