Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC1E64A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Feb 2001 09:49:41 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 646D7B005; Wed, 14 Feb 2001 16:49:25 +0000 (GMT)
Date: Wed, 14 Feb 2001 16:49:25 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Helge Deller <deller@gmx.de>, "M. Grabert" <xam@deathsdoor.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730
Message-ID: <20010214164925.U1374@linuxcare.com>
References: <20010212155919.B7969@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0102130007220.13741-100000@sgate.charlysworld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102130007220.13741-100000@sgate.charlysworld.de>; from xam@deathsdoor.com on Tue, Feb 13, 2001 at 12:18:11AM +0100
List-ID: <linux-parisc.vger.kernel.org>

I can reproduce this on a 715/75.  When it crashes I get:

  ASP version 1 at 0xf0800000 found.
  LED (ASP-style) display at f0800020 registered
  Found HIL at 0xf0821000, IRQ 94
  HIL: keyboard found at id 3
  parport_init_chip: initialize bidirectional-mode.
  Dumping Stack from c5ff0000 to c5ff0980:


IAOQ = _gsc_readb + 0x0c
r2 = parport_PS2_supported + 0x64
r26 = 0xf0824800

r26 corresponds to

  Scorpio Sr. Core Centronics (10) at 0xf0824000, versions 0x19, 0x0, 0x74, 0x0, 0x0
