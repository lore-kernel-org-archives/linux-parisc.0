From: dann frazier <dannf@debian.org>
Subject: Re: Bug#561203: threads and fork on machine with VIPT-WB cache
Date: Mon, 7 Jun 2010 11:11:37 -0600
Message-ID: <20100607171136.GA14186@lackof.org>
References: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <20100602171600.GA5566@hiauly1.hia.nrc.ca> <20100602175616.GA23219@lackof.org> <201006031150.15725.modestas@vainius.eu> <4C0850CB.20703@fsij.org> <20100604052106.GC15860@lackof.org> <AANLkTiklDMpVgeJp54qcNvMcUp2Ns5lkEpwHxWOnLD8Y@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: NIIBE Yutaka <gniibe@fsij.org>,
	Modestas Vainius <modestas@vainius.eu>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	deller@gmx.de, linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, carlos@systemhalted.org
To: Thibaut VARENE <varenet@debian.org>, 561203@bugs.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTiklDMpVgeJp54qcNvMcUp2Ns5lkEpwHxWOnLD8Y@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 04, 2010 at 12:44:55PM +0200, Thibaut VARENE wrote:
> On Fri, Jun 4, 2010 at 7:21 AM, dann frazier <dannf@debian.org> wrote=
:
> > On Fri, Jun 04, 2010 at 10:03:07AM +0900, NIIBE Yutaka wrote:
> >> Modestas Vainius wrote:
> >>>> Note that Debian's buildds run a UP kernel, so as soon as those =
fixes
> >>>> go upstream we can pull them in. Thanks for all your work here!
> >>>>
> >>>
> >>> Well, as long as this is unfixed or at least "common", I don't se=
e how hppa
> >>> can be considered to be a release arch. Is that UP patch availabl=
e somewhere?
> >>
> >> My case and my analysis talked about UP kernel, and John David Ang=
lin
> >> made a patch:
> >> =A0 =A0 =A0 http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D561=
203#144
> >>
> >> After that, the discussion went to SMP cases.
> >>
> >> It would be better to evaluate the patch again, and make sure it w=
orks
> >> for UP case and fix failures of buildd, then apply for Linux in De=
bian
> >> (only) for HPPA.
> >>
> >> I know that the patch is not that ideal because it touches
> >> architecture independent part of Linux, but it is worth for Linux =
in
> >> Debian (or Linux for the HPPA machine of buildd, at least).
> >
> > I'm happy to test the patch if necessary to help push this change
> > upstream. However, we do need the change to go upstream before we c=
an
> > include it in the Debian kernel.
>=20
> Just for reference, I've summarized the test cases and related patche=
s here:
> http://wiki.parisc-linux.org/TestCases

Cool - that is helpful. I've updated the kernel on peri/penalosa with
the various patches listed there that have gone upstream, but I'm not
seeing better results with any failing packages.

btw, I thought it would be useful to edit that page and tag each patch
with its status in Debian (in-official-kernel, installed-on-buildds,
etc), but the page appears to be immutable.

--=20
dann frazier

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
