From: Helge Deller <deller@gmx.de>
Subject: Re: Build regressions/improvements in v4.18-rc3
Date: Tue, 3 Jul 2018 08:18:13 +0200
Message-ID: <b7c41645-f694-4763-4cc3-f7abb0c2432b@gmx.de>
References: <20180702140050.1660-1-geert@linux-m68k.org>
 <CAMuHMdUHkShW5dT41x06Jz9DUJHim6=Wg6pspgTBJpsoVNphwA@mail.gmail.com>
 <1fa6b973-33e7-53f8-75bb-92d1e8932813@gmx.de>
 <87601xgm6a.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87601xgm6a.fsf@concordia.ellerman.id.au>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03.07.2018 03:09, Michael Ellerman wrote:
> Helge Deller <deller@gmx.de> writes:
> 
>> On 02.07.2018 16:09, Geert Uytterhoeven wrote:
>>> On Mon, Jul 2, 2018 at 4:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>> JFYI, when comparing v4.18-rc3[1] to v4.18-rc2[3], the summaries are:
>>> ...
>>
>> Both of the following are simply happening because of old compiler which is being used:
>>
>>>> [Deleted 26903 lines about "warning: ... [-Wpointer-sign]" on parisc-allmodconfig]
> 
> It's GCC 4.6.3. Are you saying that's not supported anymore?
> 
> I can update to 8.1.0 if that's more useful.

Yes, please.
Any version >= 7.2.1 should be better.

Helge
