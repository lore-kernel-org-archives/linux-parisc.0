From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Sat, 5 May 2012 11:55:03 -0700
Message-ID: <CA+55aFy2O8KcLC-yGCG2ZRpCpAdZ_T7z-sSme4fMrXG=YNAAhA@mail.gmail.com>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
 <20120505115851.1fecbe50@pyramind.ukuu.org.uk> <Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 5, 2012 at 11:53 AM, Mikulas Patocka <mpatocka@redhat.com> =
wrote:
>
> What NO_IRQ problem do you mean? There is
> #define NO_IRQ =A0 =A0 =A0 =A0 =A0(-1)
> in arch/parisc/include/asm/irq.h.

That's the one he means.

Switching it to zero and testing that things still work would be apprec=
iated.

Much code already knows that NO_IRQ is supposed to be zero, and
there's tons of drivers that just do the (correct!) "if (!dev->irq)"
kind of thing.

Any architecture that has a non-zero NO_IRQ is basically broken.
Always has been.

                    Linus
