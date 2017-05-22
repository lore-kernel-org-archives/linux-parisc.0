From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v4.12-rc2
Date: Mon, 22 May 2017 11:49:09 +0200
Message-ID: <CAMuHMdVc2Ds3Uj4n87sq+-nXFGKPwA37Zq4B7pc8SLaJoRxKQw@mail.gmail.com>
References: <1495445700-32631-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495445700-32631-1-git-send-email-geert@linux-m68k.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Arnd, Helge,

On Mon, May 22, 2017 at 11:35 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v4.12-rc2[1] compared to v4.11[2].
>
> Summarized:
>   - build errors: +2/-3
>   - build warnings: +27717/-896

> [1] http://kisskb.ellerman.id.au/kisskb/head/08332893e37af6ae779367e78e444f8f9571511d/ (267 out of 270 configs)

> 27717 warning regressions:
>
> [Deleted 26393 lines about "warning: ... [-Wpointer-sign]" on parisc-allmodconfig]

Do you know where these are coming from? They appeared in v4.12-rc1.
The toolchain on kisskb hasn't changed (still gcc-4.6.3-nolibc).

> [Deleted 1166 lines about "warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]" on parisc-allmodconfig]

This has been introduced a while ago.  Would be good to get it fixed, too.
I guess the "cflags-y += -ffunction-sections" still needs some CONFIG check,
despite commit 366dd4ea9d5f0eb7 ("parisc: Fix ftrace function tracer")?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
