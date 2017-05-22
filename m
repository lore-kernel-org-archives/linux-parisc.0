From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Build regressions/improvements in v4.12-rc2
Date: Mon, 22 May 2017 23:08:08 +0200
Message-ID: <CAK8P3a39qS2Z315FwJi2R7ThZVsmZrnAa45CG9yWu0rxu2CdXg@mail.gmail.com>
References: <1495445700-32631-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVc2Ds3Uj4n87sq+-nXFGKPwA37Zq4B7pc8SLaJoRxKQw@mail.gmail.com> <1DB2BE11-27B3-4E33-BD6C-539493145081@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1DB2BE11-27B3-4E33-BD6C-539493145081@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 22, 2017 at 8:46 PM, John David Anglin <dave.anglin@bell.net> wrote:
> On 2017-05-22, at 5:49 AM, Geert Uytterhoeven wrote:
>
>>> [Deleted 1166 lines about "warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]" on parisc-allmodconfig]
>
> Although this issue may be fixed in gcc, do we really want to enable profiling by default?

This is ftrace, which uses the same compiler flag as gprof, and the option
is only enabled in allmodconfig, which seems reasonable.

       Arnd
