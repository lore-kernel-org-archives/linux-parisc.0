From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: [PATCH] parisc: fix serial ports on C8000 workstation
Date: Mon, 10 Jun 2013 10:27:09 +0200 (CEST)
Message-ID: <trinity-3fb7467d-4d50-4362-8003-6bdc2d184770-1370852828916@3capp-gmx-bs02>
References: <20130609210021.GA1009@p100.box>,
 <3684361.ciEK0E58Qm@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
	"James Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
To: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3684361.ciEK0E58Qm@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > The C8000 workstation (64 bit kernel only) has a somewhat different
> > serial port configuration that other models.
> > Thonmas Bogendoerfers sent a patch to fix this in September 2010, w=
hich
> > was now minimally modified by me.

I shouldn't send patches that late... too many typos and not very good =
patch description :-)

> Cool, that explains why it doesn't work for me. And it saves me the t=
ime to
> debug what _I_ did wrong ;)

Rolf, the original patch from Thomas Bogend=C3=B6rfer including his com=
ments is here:
http://comments.gmane.org/gmane.linux.ports.parisc/3258
(if you need the patch only, go here: https://patchwork.kernel.org/patc=
h/357572/raw/)

Maybe you want to clean up the other parts, e.g. impmi or pci_mmap?

Helge
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
