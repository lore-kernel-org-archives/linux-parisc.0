Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailg.telia.com (mailg.telia.com [194.22.194.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22F36482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 16:05:17 -0700 (MST)
Received: from d1o999.telia.com (d1o999.telia.com [195.67.201.241])
	by mailg.telia.com (8.11.6/8.11.6) with ESMTP id g0KN5Ej12297
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 00:05:14 +0100 (CET)
Received: from finkel (h186n1fls20o999.telia.com [213.64.112.186])
	by d1o999.telia.com (8.10.2/8.10.1) with SMTP id g0KN58r17539
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 00:05:08 +0100 (CET)
From: =?iso-8859-1?Q?Bj=F6rn_Bylander?= <bjorn.bylander@telia.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Booting to ISL with Linux installed
Date: Mon, 21 Jan 2002 00:05:06 +0100
Message-ID: <DLEJJFGDAJICFFBHFNCDGEBBCEAA.bjorn.bylander@telia.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <3C4AED62.F3914545@gmx.at>
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

Ok, is there no way to do the equivalent of "conspath" under Linux, =
through /dev/nvram perhaps?
If not, is there any way I can get the "uxbootlf" image without buying a =
license for the appropriate HPUX version?

Best regards,
Bj=F6rn
> -----Original Message-----
> From: parisc-linux-admin@lists.parisc-linux.org
> [mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of =
Christoph
> Plattner
> Sent: Sunday, January 20, 2002 5:17 PM
> To: Bj=F6rn Bylander
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Booting to ISL with Linux installed
>=20
>=20
> The problem you have, is that you may have activated the `autoboot'
> mode.
> Try to interrupt the autoboot mode by pressing <ESC>. Then you can
> disable
> autoboot.
>=20
> But this is not your major problem. The "ISL" prompt after booting a
> LIF-IMAGE was a tool inside the LIF-IMAGE. The boot load PALO works
> in a different way. PALO together with a recovery kernel is also in
> a LIF-IMAGE but there are no tools, as you know from HP-UX to boot
> a HP-UX kernel with the command "hpux" or "boot" and there are also
> not tools like "IODC" or whatever they were called (I am no HP=20
> specialist, but I want to learn more and more ...).
>=20
> So you need to have a LIF-IMAGE stored on a different place or
> loaded from net including those HP-UX basic tools. Such a LIF
> image canbe found on the HP-UX itself, called "uxbootlf" (AFAIK).
>=20
> By the way: I am also interetsed in setting my 712/60 to serial=20
> console. But I heard, it is a problem to setup wrong values here,
> as no device may fanctioning then. What have I to do, to restore
> the machine to let's say "factory setups" ?
>=20
> With friendly regards
> Christoph
>=20
>=20

<original text removed>

>=20
> --=20
> -------------------------------------------------------
> private:	christoph.plattner@gmx.at
> company:	christoph.plattner@alcatel.at
