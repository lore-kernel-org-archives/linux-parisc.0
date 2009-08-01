From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset
	Table
Date: Sat, 1 Aug 2009 09:53:20 -0400
Message-ID: <20090801135319.GA13949@hiauly1.hia.nrc.ca>
References: <4A73821A.4020506@gmx.de> <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca> <119aab440907311851t502a208bh34b21b3f732e3e09@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Helge Deller <deller@gmx.de>, kyle@mcmartin.ca, elendil@planet.nl,
	539378@bugs.debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, randolph@tausq.org,
	submit@bugs.debian.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907311851t502a208bh34b21b3f732e3e09@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 31 Jul 2009, Carlos O'Donell wrote:

> >> + =A0 =A0 =A0 =A0 =A0 =A0 if (d <=3D 15)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[0] |=3D reas=
semble_14(d);
> >
> > reassemble_14 is wrong for ldd format 3. =A0Need format 5 and im5 i=
nsertion.
>=20
> This is using reassemble_14 for ldd format 5, which is correct.

Huh?  Format 5 has a five bit immediate and it's not compatible with
reassemble_14.  The value is actually being stuffed into a format 3 ldd
pattern (i.e., format 3 is being used for displacements 0 and 8).

If format 3 is going to be used for short displacements, then use
reassemble_16a as it is the inverse to the assemble_16a operation
described in the arch.  Using reassemble_14 with ldd is confusing.

As you pointed out, the arch shows using format 5 for short displacemen=
ts.
It's unclear whether there is a performance or functional difference as=
ide
from the behavior of space selection.  There may be no requirement for
hardware to implement short displacements using format 3.

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
