Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from netlx010.civ.utwente.nl (netlx010.civ.utwente.nl [130.89.1.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE540487A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Dec 2002 10:31:08 -0700 (MST)
Message-ID: <003401c2a45f$a4d89160$28f15982@timkemna>
From: "Tim Kemna" <t.kemna@student.utwente.nl>
To: <parisc-linux@lists.parisc-linux.org>,
	"Jussi Sallinen" <jzu@lowfidelity.org>
References: <20021215150030.HEVW4145.fep02-app.kolumbus.fi@suorakulmio>
Subject: Re: [parisc-linux] HP 712/80, LASI Harmony Audio and 16-bit's
Date: Sun, 15 Dec 2002 18:30:19 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> I have HP 712/80, with LASI-chip - So soundcard is Harmony audio.
> I just compiled kernel, PA Harmony audio driver included into kernel,
> but without any kind of OSS sound modules.
> mikmod gives this:
> MikMod initialisation error : This driver supports uLaw output (8 bit
mono, 8 kHz) only
> Do i need to have OSS sound modules to be able to play 16bit stereo?

I also have a 712/80. I could do a 'cat foo.au > /dev/audio' without the OSS
modules compiled into the kernel or as module.

> And if so, as modules or into kernel?

Probably doesn't matter.

Greetings,
Tim
