From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Build regressions/improvements in v4.18-rc3
Date: Tue, 03 Jul 2018 11:09:17 +1000
Message-ID: <87601xgm6a.fsf@concordia.ellerman.id.au>
References: <20180702140050.1660-1-geert@linux-m68k.org> <CAMuHMdUHkShW5dT41x06Jz9DUJHim6=Wg6pspgTBJpsoVNphwA@mail.gmail.com> <1fa6b973-33e7-53f8-75bb-92d1e8932813@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1fa6b973-33e7-53f8-75bb-92d1e8932813@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller <deller@gmx.de> writes:

> On 02.07.2018 16:09, Geert Uytterhoeven wrote:
>> On Mon, Jul 2, 2018 at 4:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> JFYI, when comparing v4.18-rc3[1] to v4.18-rc2[3], the summaries are:
>> ...
>
> Both of the following are simply happening because of old compiler which is being used:
>
>>> [Deleted 26903 lines about "warning: ... [-Wpointer-sign]" on parisc-allmodconfig]

It's GCC 4.6.3. Are you saying that's not supported anymore?

I can update to 8.1.0 if that's more useful.

cheers
