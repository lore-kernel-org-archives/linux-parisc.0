Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail3-atl-R.bigfish.com (mail-orl.bigfish.com [63.161.60.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF0EE4840
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Oct 2003 08:38:57 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: RE: [parisc-linux]  HP FC A3591 aka Mombasa GS -- or A6684A?
Date: Mon, 6 Oct 2003 09:38:42 -0500
Message-ID: <1289146742B56546AE580DFC6B711A8301B1AF99@PKDWB07C.ad.sprint.com>
From: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
To: "Matthew Wilcox" <willy@debian.org>
Cc: <parisc-linux@lists.parisc-linux.org>
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

Good morning,

Does anyone know if the replacement for the A3591B is supported?

The replacement card is the A6684A HSC Tachlite card.

Thanks!

Pat Padgett

-----Original Message-----
From: Matthew Wilcox [mailto:willy@debian.org]=20
Sent: Thursday, October 02, 2003 9:08 PM
To: Padgett, Pat M [NTWK SVCS]
Cc: Matthew Wilcox; parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP HSC J3516A (2 port) ethernet card
(supported??) ... And HP FC A3591 aka Mombasa GS


On Thu, Oct 02, 2003 at 08:48:59PM -0500, Padgett, Pat M [NTWK SVCS]
wrote:
> Also, does anyone know which driver (if any) supports the follwing=20
> card (HP Fibre Channel A3591).
>=20
> The kernel reports them as :
>=20
> 2. Mombasa GS Add-on mass FC (A3591) (4) at 0xf1004000 [8/4], versions

> 0x18, 0x0, 0xa7 17. Mombasa GS Add-on mass FC (A3591) (4) at=20
> 0xf180c000 [10/12], versions 0x18, 0x0, 0xa7

As far as I can tell, these are Tachyon cards with a GSC interface. They
aren't supported by any driver at the moment.  drivers/scsi/cpqfcTS*
would be the driver that needs to be altered.  Unfortunately, it's one
of the canonical examples of badly written drivers, and these cards
aren't exactly common, so I'm not aware of anyone trying to make these
cards work.

--=20
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead
bodies. Do you think I want to have an academic debate on this subject?"
-- Robert Fisk
