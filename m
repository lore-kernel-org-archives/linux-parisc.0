Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id AB7044829
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 06:22:16 -0600 (MDT)
Date: Fri, 11 Oct 2002 13:22:04 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: =?iso-8859-15?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
Cc: "'Harri Haataja'" <harri.haataja@smilehouse.com>,
	"'parisc-linux maillist'" <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Which Memory to use on a 715/80?
In-Reply-To: <02Oct11.100511cest.119048@ns.hiscom.nl>
Message-ID: <Pine.LNX.4.44.0210111313270.6057-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-15
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 11 Oct 2002, "Beerse, Corn=E9" wrote:

> > EDO AFAIK never occurs together with ECC so that's the word to avoid
> > when looking for ram for older workstations ad servers.

That's not true, there are some EDO Rams with ECC, 'though rather rare.

> > 36-bit FPM True-parity ECC SIMMs are what work in, for example, DEC
> > Alpha AXPpci, Multia, SGI Indy, Indigo=B2, matching Challenges,
> > IBM RS6000
> > 7006 and other machines of the era and most(?) pc's. No kind
> > of EDO ram
> > works.
> >
> > > I might be totaly wrong here, in those days (a former job)
> > I was using
> > > both SunSparc stations and HP 712 machines.
> >
> > Sparcstations mostly use weird rams like JEDEC DIMM's apart from the
> > very old ones that use 36-pin simm's that seem regular.
>
> Sun Sparc ELC and SunSparcClassic (and similar Sparc 4C architecture?) ca=
n
> use the same memory modules as 486-PC's. Those are NOT edo ram as in
> pentium-pc's, however they do fit... It might not be what Sun tells, it i=
s
> wat is currently running at home...

Sun SPARCstation LX/ZX also use 36bit (true parity) FP-RAM. The
ones you find in old 486 will just do fine, if they have ECC.

> > This is what I remember. No guarantees either.
>
> I've tried EDO ram in a SParc Classic but it does not show up. After a sh=
ort
> test (15 minutes power on and try to use it) I experienced no damage on b=
oth
> processorboard or memory. Then, again: no guarantees...

EDO Ram is not supported on SPARCstation classics/IPC/IPX (sun4c) and
SPARCstation LX/ZX (sun4m). You NEED FastPage mode (aka "normal", pre-EDO) =
RAM.
IMHO that's strange, since EDO RAM is supposed to be backwards compatible
IIRC. Or was this just a feature of 386/486 Motherboards?

greetings max
