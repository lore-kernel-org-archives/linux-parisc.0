Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mlbmx2.corp.harris.com (mlbmx2.corp.harris.com [137.237.90.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2BD1482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 09:11:57 -0600 (MDT)
Message-ID: <8D4C69676E66D511A1CB00508BBBB192162691@ranmx1.ran.harris.com>
From: "Pedot, Wolfgang" <wpedot@harris.com>
To: 'Grant Grundler' <grundler@puffin.external.hp.com>
Cc: 'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] HD not bootable after installation.... 
Date: Mon, 16 Jul 2001 11:11:53 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Thanks! My System now boots perfectly from HD and Network.
The only disturbing thing is that the new HD is making terrible noise =
:)

greetings
Wolfgang


> "Pedot, Wolfgang" wrote:
> > Well, the HD has a Jumper called "Auto Start" which is set. Without =
that
> > jumper set the HD doesn=B4t spin up. The only Jumpers set now are =
ID,
> > AutoStart and Termination Power. There are others to but I have no =
Idea
> > what they mean..
> >=20
> > Option Block Mode
> > Disable T.I. Sync Negotiations
> > Disable Unit Attention
> >=20
> > Any Ideas?
>=20
> sorry - forgot about TI Sync jumper - you want that disabled
> for workstations...I think servers are ok with having enabled (no =
jumper).
>=20
> "Target Initiated Synchronous Negotiations" is when the Target device
> (eg drive) realizes it doesn't have an agreement with the Initiator
> (eg host controller) about how fast to send "synchronous" data =
(SDTR).
> Even though the SCSI protocol allows this, older products didn't
> do this and the PDC didn't need to (and can't) handle it.
>=20
> grant
>=20
> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
