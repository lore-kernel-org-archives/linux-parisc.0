Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA29076
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 05:03:18 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 16 Nov 1999 12:04:52 -0000
Subject: Re: [parisc-linux] depi?
To: phi@hpfrcu03.france.hp.com (Philippe Benard)
Date: Tue, 16 Nov 1999 12:58:20 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk, frowand@cup.hp.com,
        Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com, adevries@thepuffingroup.com
In-Reply-To: <383145A5.C2AF5857@hpfrcu03.france.hp.com> from "Philippe Benard" at Nov 16, 99 12:53:09 pm
Content-Type: text
Message-Id: <E11niBh-0002cv-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> For now I have the feeling (hoping I completly wrong) that the user space is
> confined into the low 2Gb and the kernel space is located into the high 2Gb,
> well I bet I'm wrong here, I will try to find this mm.c code you spoke about,
> I was more hoping de design document even very thin, there is no need for a
> big book to describe how a VAS is implemented.

How it does now now on Linux/hppa32 and how it ends up looking are two 
different questions altogether.
