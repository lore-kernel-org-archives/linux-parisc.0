From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Wed, 9 May 2012 10:51:06 -0700
Message-ID: <CA+55aFwiLp1z+2mzkrFsid1WZQ0TQkcn8F2E6NL_AVR+m1fZ2w@mail.gmail.com>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
 <20120505115851.1fecbe50@pyramind.ukuu.org.uk> <Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
 <CA+55aFy2O8KcLC-yGCG2ZRpCpAdZ_T7z-sSme4fMrXG=YNAAhA@mail.gmail.com> <Pine.LNX.4.64.1205082259350.16707@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205082259350.16707@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, May 8, 2012 at 8:20 PM, Mikulas Patocka <mpatocka@redhat.com> wrote:
>>
>> Switching it to zero and testing that things still work would be appreciated.
>
> It works, but there is plenty of interrupt controllers on PC-RISC and I
> can only test it on C8000 with IO-SAPIC. I don't know if irq 0 is used on
> some PA-RISC interrupt controller. It would be best if James Bottomley
> tests it on his set of machines.

Heh. It sounds like we have more PA-RISC machines than we have actual users.

> And what about x86? --- irq 0 is used for timer and there is
> void __init setup_default_timer_irq(void)
> {
>        setup_irq(0, &irq0);
> }
> in arch/x86/kernel/time.c.

That's fine. There's no "irq" variable associated with it that people
can test. No driver will ever see an irq number of zero, no dynamic
irq code will ever see the zero.

So x86 rules have always been that the way drivers etc test for irq
existence has always been "irq 0 means no irq". Despite the fact that
it internally uses irq0 for its own nefarious uses.

                    Linus
