Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep02-app.kolumbus.fi (fep02-0.kolumbus.fi [193.229.0.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A87A482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Dec 2002 08:00:37 -0700 (MST)
Received: from suorakulmio ([80.186.65.123]) by fep02-app.kolumbus.fi
          with SMTP
          id <20021215150030.HEVW4145.fep02-app.kolumbus.fi@suorakulmio>
          for <parisc-linux@lists.parisc-linux.org>;
          Sun, 15 Dec 2002 17:00:30 +0200
Date: Sun, 15 Dec 2002 16:59:20 +0200
To: parisc-linux@lists.parisc-linux.org
From: Jussi Sallinen <jzu@lowfidelity.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Message-Id: <20021215150030.HEVW4145.fep02-app.kolumbus.fi@suorakulmio>
Subject: [parisc-linux] HP 712/80, LASI Harmony Audio and 16-bit's
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

I have HP 712/80, with LASI-chip - So soundcard is Harmony audio.
I just compiled kernel, PA Harmony audio driver included into kernel,
but without any kind of OSS sound modules. 
mikmod gives this: 
MikMod initialisation error : This driver supports uLaw output (8 bit mono, 8 kHz) only
Do i need to have OSS sound modules to be able to play 16bit stereo?
And if so, as modules or into kernel?
And what kind of OSS sound modules do i need :o
