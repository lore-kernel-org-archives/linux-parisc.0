From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Wed, 9 May 2012 13:01:11 +0100
Message-ID: <20120509130111.458b1660@pyramind.ukuu.org.uk>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
	<20120505115851.1fecbe50@pyramind.ukuu.org.uk>
	<Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
	<CA+55aFy2O8KcLC-yGCG2ZRpCpAdZ_T7z-sSme4fMrXG=YNAAhA@mail.gmail.com>
	<Pine.LNX.4.64.1205082259350.16707@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205082259350.16707@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> And what about x86? --- irq 0 is used for timer and there is
> void __init setup_default_timer_irq(void)
> {
>         setup_irq(0, &irq0);
> }

That's an internal curio not exposed outside (or at least not in a way
that matters).

Alan
