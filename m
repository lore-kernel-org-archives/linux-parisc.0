Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0B9C483C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 11:24:00 -0700 (MST)
Date: Wed, 24 Mar 2004 19:23:53 +0100
Message-ID: <40561E9500006A53@ocpmta3.freegates.net>
In-Reply-To: <20040324173903.GB32052@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux only see 2Gb of ram of N4k
To: "Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


> > PS: May I risk to play with CONFIG_DISCONTIGMEM?
>
> Isn't this open source? of course you can.

:))

I just didn't see any way to select it with 'make menuconfig' as there are
no Kconfig entry for parisc. I so conclude that anybody had never tested
this code (even in 2.4).

But ok when I will recover the availability of this server for my linux test,
I will try to build a kernel with this stuff.

Thanks a lot,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
