Received: from garm.bart.nl (garm.bart.nl [194.158.170.13])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id AAA18410
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 00:36:07 -0700
Message-ID: <009201c05445$ab994880$0401a8c0@paardvantroje>
From: "Bas Valkema" <bvalkema@knowhowww.nl>
To: "Alex deVries" <adevries@linuxcare.com>,
        "Grant Grundler" <grundler@cup.hp.com>
Cc: "Alexandru Pirvulescu" <Pirvulescu_Alexandru@telemobil.ro>,
        <parisc-linux@puffin.external.hp.com>
References: <200011211855.KAA20167@milano.cup.hp.com> <3A1B2F27.D08EC2AF@linuxcare.com>
Subject: Re: [parisc-linux] case LEDs
Date: Wed, 22 Nov 2000 06:32:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> Grant Grundler wrote:
> > Yes.
> > I was already asked this weekend to dig up technical info on LED
> > and soft power control. I guess this is my reminder to do that. :^)
>
> Isn't there a PDC call (pdc_chassis?) to do this?  Or is the heartbeat
> LED done by hardware?
>
> - Alex

A couple of months ago, I asked the same question, got answer to look in the
mkLinux sources. I did, and I think it was a register (outb(0xblabla);).

Wrote a driver (and for WAX, got a Intel Flash 32 EISA running), can't
release it now, because of some copyright issues...

Bas
