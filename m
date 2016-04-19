From: Helge Deller <deller@gmx.de>
Subject: Re: Build regressions/improvements in v4.6-rc4 (parisc warnings)
Date: Tue, 19 Apr 2016 15:31:59 +0200
Message-ID: <5716334F.6020602@gmx.de>
References: <1461048813-28712-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdUqJ0dj25oXhC4MgqSk0SaOHvT262ew+sBs7eV2SCwyUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUqJ0dj25oXhC4MgqSk0SaOHvT262ew+sBs7eV2SCwyUA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Geert,

On 19.04.2016 08:57, Geert Uytterhoeven wrote:
> On Tue, Apr 19, 2016 at 8:53 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> Below is the list of build error/warning regressions/improvements in
>> v4.6-rc4[1] compared to v4.5[2].
>>
>> Summarized:
>>   - build errors: +11/-7
>>   - build warnings: +16376/-165 <tel:+16376165>
> 
> Sorry for the delay, initially I didn't realize why my first report didn't make
> it to the list. It was too big, due to 16211 warnings in parisc-allmodconfig
> about "-ffunction-sections disabled; it makes profiling impossible [enabled by
> default]".

I checked the parisc warnings, and looking at http://kisskb.ellerman.id.au/kisskb/buildresult/12665382/
it seems a gcc-4.6 (/opt/cross/gcc-4.6.3-nolibc/hppa-linux/bin/hppa-linux-gcc) compiler
is still being used.
I tend to think, that gcc-4.6 wasn't able to generate function sections
which is why we see those warnings now (there was a FTRACE patch from me 
included before v4.6-rc4). 
Anyway, I can't reproduce those warnings with gcc-4.8 and higher.
Given the fact, that we even switched on debian now to use gcc-5 for the kernel, can
someone please update the 32- and 64-bit parisc compilers on the kiss
infrastructure to at least gcc-4.8 (gcc-4.9 or gcc-5 being preferred).

Thanks,
Helge
