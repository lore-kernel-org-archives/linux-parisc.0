From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Sun, 6 May 2012 13:24:13 +0100
Message-ID: <20120506132413.28499956@pyramind.ukuu.org.uk>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
	<20120505115851.1fecbe50@pyramind.ukuu.org.uk>
	<Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> What NO_IRQ problem do you mean? There is
> #define NO_IRQ          (-1)
> in arch/parisc/include/asm/irq.h.

It should be zero ready for us to get rid of it. Aa far as I can tell
pa-risc can just move to 0 without anything breaking. In fact some stuff
like serial port polling on 8250 ports will begin to work if it's done.

> And there are other NO_IRQ definitions in other architectures, some 
> defining it to ((unsigned int)(-1)), some to 0xffffffff, some to INT_MAX, 
> some to (-1) and some to (0).

Yes people are working on removing them all.

Alan
