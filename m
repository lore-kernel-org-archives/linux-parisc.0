Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA03765
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 02:58:23 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 22 Nov 1999 10:00:06 -0000
Subject: Re: [parisc-linux] Progress
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Mon, 22 Nov 1999 09:59:55 +0000 (GMT)
Cc: dave@hiauly1.hia.nrc.ca, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991122092412.C1310@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 22, 99 09:24:12 am
Content-Type: text
Message-Id: <E11pqGK-0003IA-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Now picture the page boundary happes between the two addibs.  This loop will
> execute at about a third of the speed of a normal delay loop.  The code is
> inlined, so only one loop gives you bogus results - if it is the BogoMIPS
> calibration loop, udelay(N) will actually only delay for N/3 us, which can
> have unexpected effects on hardware we use udelay() for.

On x86 things like this, and execution timing differences caused by cache
line alignment and other phase-of-moon issues eventually lead us to not inline
the function. Even then we had to land it on a 32 byte boundary
