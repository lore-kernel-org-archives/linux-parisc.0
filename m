From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Thu, 10 May 2012 11:24:32 +0200
Message-ID: <CAMuHMdX+TjGqeGVxb6_aw_B8=VUYF7jPaUow6H=p-XW5ZA-TPg@mail.gmail.com>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
	<20120505115851.1fecbe50@pyramind.ukuu.org.uk>
	<Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
	<CA+55aFy2O8KcLC-yGCG2ZRpCpAdZ_T7z-sSme4fMrXG=YNAAhA@mail.gmail.com>
	<Pine.LNX.4.64.1205082259350.16707@file.rdu.redhat.com>
	<CA+55aFwiLp1z+2mzkrFsid1WZQ0TQkcn8F2E6NL_AVR+m1fZ2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwiLp1z+2mzkrFsid1WZQ0TQkcn8F2E6NL_AVR+m1fZ2w@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 9, 2012 at 7:51 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, May 8, 2012 at 8:20 PM, Mikulas Patocka <mpatocka@redhat.com>=
 wrote:
>>> Switching it to zero and testing that things still work would be ap=
preciated.
>> It works, but there is plenty of interrupt controllers on PC-RISC an=
d I
>> can only test it on C8000 with IO-SAPIC. I don't know if irq 0 is us=
ed on
>> some PA-RISC interrupt controller. It would be best if James Bottoml=
ey
>> tests it on his set of machines.
>
> Heh. It sounds like we have more PA-RISC machines than we have actual=
 users.
>
>> And what about x86? --- irq 0 is used for timer and there is
>> void __init setup_default_timer_irq(void)
>> {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_irq(0, &irq0);
>> }
>> in arch/x86/kernel/time.c.
>
> That's fine. There's no "irq" variable associated with it that people
> can test. No driver will ever see an irq number of zero, no dynamic
> irq code will ever see the zero.
>
> So x86 rules have always been that the way drivers etc test for irq
> existence has always been "irq 0 means no irq". Despite the fact that
> it internally uses irq0 for its own nefarious uses.

So can x86 please show the purely internal irq0 in its arch_show_interr=
upts(),
and accept "[PATCH] /proc/interrupts: irq zero is invalid"
(http://lkml.indiana.edu/hypermail/linux/kernel/1112.0/02229.html)?

Also, the several for_each_irq*() macros still iterate over zero, e.g.

# define for_each_irq_desc(irq, desc)                                  =
 \
        for (irq =3D 0, desc =3D irq_to_desc(irq); irq < nr_irqs;      =
     \
             irq++, desc =3D irq_to_desc(irq))                         =
   \
                if (!desc)                                             =
 \
                        ;                                              =
 \
                else


# define for_each_irq_desc_reverse(irq, desc)                          =
 \
        for (irq =3D nr_irqs - 1, desc =3D irq_to_desc(irq); irq >=3D 0=
;      \
             irq--, desc =3D irq_to_desc(irq))                         =
   \
                if (!desc)                                             =
 \
                        ;                                              =
 \
                else

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
