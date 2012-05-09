From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Wed, 9 May 2012 10:38:30 -0700
Message-ID: <CAP6odjhVK0PjXQ_vLbK2dWs4CnnxJwmhcDPDV=qLJmxBMBBDJQ@mail.gmail.com>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
	<20120505115851.1fecbe50@pyramind.ukuu.org.uk>
	<Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
	<20120506132413.28499956@pyramind.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120506132413.28499956@pyramind.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, May 6, 2012 at 5:24 AM, Alan Cox <alan@lxorguk.ukuu.org.uk> wro=
te:
>> What NO_IRQ problem do you mean? There is
>> #define NO_IRQ =A0 =A0 =A0 =A0 =A0(-1)
>> in arch/parisc/include/asm/irq.h.
>
> It should be zero ready for us to get rid of it. Aa far as I can tell
> pa-risc can just move to 0 without anything breaking. In fact some st=
uff
> like serial port polling on 8250 ports will begin to work if it's don=
e.

Alan,
Didn't this patch of yours go in?
    http://www.spinics.net/lists/linux-parisc/msg03894.html

And it's amusing to read linus' previous rants on this issue from 2005:
    http://lkml.indiana.edu/hypermail/linux/kernel/0511.2/1720.html
    http://lkml.indiana.edu/hypermail/linux/kernel/0511.2/1741.html
    http://lkml.indiana.edu/hypermail/linux/kernel/0511.2/1845.html

cheers,
grant
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
