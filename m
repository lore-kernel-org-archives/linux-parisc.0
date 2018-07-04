From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Build regressions/improvements in v4.18-rc3
Date: Wed, 04 Jul 2018 14:56:57 +1000
Message-ID: <87sh4zlht2.fsf@concordia.ellerman.id.au>
References: <20180702140050.1660-1-geert@linux-m68k.org> <CAMuHMdUHkShW5dT41x06Jz9DUJHim6=Wg6pspgTBJpsoVNphwA@mail.gmail.com> <1fa6b973-33e7-53f8-75bb-92d1e8932813@gmx.de> <87601xgm6a.fsf@concordia.ellerman.id.au> <74980be1-0684-09ef-9e31-cb8f0db13139@bell.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74980be1-0684-09ef-9e31-cb8f0db13139@bell.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin <dave.anglin@bell.net> writes:

> On 2018-07-02 9:09 PM, Michael Ellerman wrote:
>> It's GCC 4.6.3. Are you saying that's not supported anymore?
> See <https://gcc.gnu.org/> for supported releases.

Thanks, but I mean "supported by the parisc Linux port".

Allegedly the kernel builds with GCC 3.2:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/changes.rst#n32


But in reality each arch has a different minimum version they actually
care about.

cheers
