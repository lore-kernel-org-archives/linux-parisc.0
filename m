From: Helge Deller <deller@gmx.de>
Subject: Re: Build regressions/improvements in v4.18-rc3
Date: Mon, 2 Jul 2018 17:13:33 +0200
Message-ID: <1fa6b973-33e7-53f8-75bb-92d1e8932813@gmx.de>
References: <20180702140050.1660-1-geert@linux-m68k.org>
 <CAMuHMdUHkShW5dT41x06Jz9DUJHim6=Wg6pspgTBJpsoVNphwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUHkShW5dT41x06Jz9DUJHim6=Wg6pspgTBJpsoVNphwA@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 02.07.2018 16:09, Geert Uytterhoeven wrote:
> On Mon, Jul 2, 2018 at 4:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> JFYI, when comparing v4.18-rc3[1] to v4.18-rc2[3], the summaries are:
> ...

Both of the following are simply happening because of old compiler which is being used:

>> [Deleted 26903 lines about "warning: ... [-Wpointer-sign]" on parisc-allmodconfig]

?

>> [Deleted 19308 lines about "warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]" on parisc-allmodconfig]

I dropped function-sections:
http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24b6c22504a27210a8377e54d24d425ae414f2c1
Still need to see if this gives problems (haven't seen any yet).

Helge
