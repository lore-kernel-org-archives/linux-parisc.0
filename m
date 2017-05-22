From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Build regressions/improvements in v4.12-rc2
Date: Mon, 22 May 2017 14:46:27 -0400
Message-ID: <1DB2BE11-27B3-4E33-BD6C-539493145081@bell.net>
References: <1495445700-32631-1-git-send-email-geert@linux-m68k.org> <CAMuHMdVc2Ds3Uj4n87sq+-nXFGKPwA37Zq4B7pc8SLaJoRxKQw@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVc2Ds3Uj4n87sq+-nXFGKPwA37Zq4B7pc8SLaJoRxKQw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-05-22, at 5:49 AM, Geert Uytterhoeven wrote:

>> [Deleted 1166 lines about "warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]" on parisc-allmodconfig]

Although this issue may be fixed in gcc, do we really want to enable profiling by default?

Dave
--
John David Anglin	dave.anglin@bell.net



