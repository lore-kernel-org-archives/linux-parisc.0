From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Thu, 10 May 2012 12:40:16 +0100
Message-ID: <20120510124016.0fe9a2a1@pyramind.ukuu.org.uk>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
	<20120505115851.1fecbe50@pyramind.ukuu.org.uk>
	<Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
	<20120506132413.28499956@pyramind.ukuu.org.uk>
	<CAP6odjhVK0PjXQ_vLbK2dWs4CnnxJwmhcDPDV=qLJmxBMBBDJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Grant Grundler <grantgrundler@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAP6odjhVK0PjXQ_vLbK2dWs4CnnxJwmhcDPDV=qLJmxBMBBDJQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 9 May 2012 10:38:30 -0700
Grant Grundler <grantgrundler@gmail.com> wrote:

> On Sun, May 6, 2012 at 5:24 AM, Alan Cox <alan@lxorguk.ukuu.org.uk> w=
rote:
> >> What NO_IRQ problem do you mean? There is
> >> #define NO_IRQ =A0 =A0 =A0 =A0 =A0(-1)
> >> in arch/parisc/include/asm/irq.h.
> >
> > It should be zero ready for us to get rid of it. Aa far as I can te=
ll
> > pa-risc can just move to 0 without anything breaking. In fact some =
stuff
> > like serial port polling on 8250 ports will begin to work if it's d=
one.
>=20
> Alan,
> Didn't this patch of yours go in?
>     http://www.spinics.net/lists/linux-parisc/msg03894.html

Last I checked it hadn't - hence the request to test it when I saw
someone actually running parisc.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
