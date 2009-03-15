From: Matt Turner <mattst88@gmail.com>
Subject: Possible accelerated X on PA-RISC with kernel modesetting -- anyone
	investigating?
Date: Sat, 14 Mar 2009 21:02:45 -0400
Message-ID: <b4198de60903141802p14f3d7f8ra33ba382ae6b8d85@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

It hasn't been possible to use X on PA-RISC without unaccelerated
fbdev to my knowledge.

Evidently [*], there is a possibility of this changing relatively soon
via Radeon kernel modesetting.

Is anyone aware of this development? Is anyone interested in
accelerated X on PA-RISC? Is anyone investigating what it will take to
support PA-RISC?

R500 and R600 Radeon PCI cards are cheap, and will be supported. I
guess the C8000 has larger performance problems to worry about, but
the AGP slot it offers would open up the selection of graphics cards
to include much faster R600-series cards, and future cards if they
ever produce more AGP compatible ones.

I'd sure be nice to put an X1550 or 2400HD in my J6700 and have an
accelerated desktop.

Thanks,

Matt Turner

* http://lists.freedesktop.org/archives/xorg/2008-July/037059.html
