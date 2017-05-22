From: Helge Deller <deller@gmx.de>
Subject: Re: Build regressions/improvements in v4.12-rc2
Date: Mon, 22 May 2017 17:49:34 +0200
Message-ID: <59c0628c-523a-6307-febd-bd15329a62a0@gmx.de>
References: <1495445700-32631-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVc2Ds3Uj4n87sq+-nXFGKPwA37Zq4B7pc8SLaJoRxKQw@mail.gmail.com>
 <CAK8P3a3Qm_5bWEeLA+NZR4yU051J_vDbHgNziAGF5X2sGK1v2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3Qm_5bWEeLA+NZR4yU051J_vDbHgNziAGF5X2sGK1v2A@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 22.05.2017 16:19, Arnd Bergmann wrote:
> On Mon, May 22, 2017 at 11:49 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> Hi Arnd, Helge,
>>
>> On Mon, May 22, 2017 at 11:35 AM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>> Below is the list of build error/warning regressions/improvements in
>>> v4.12-rc2[1] compared to v4.11[2].
>>>
>>> Summarized:
>>>   - build errors: +2/-3
>>>   - build warnings: +27717/-896
>>
>>> [1] http://kisskb.ellerman.id.au/kisskb/head/08332893e37af6ae779367e78e444f8f9571511d/ (267 out of 270 configs)
>>
>>> 27717 warning regressions:
>>>
>>> [Deleted 26393 lines about "warning: ... [-Wpointer-sign]" on parisc-allmodconfig]
>>
>> Do you know where these are coming from? They appeared in v4.12-rc1.

No idea.

>> The toolchain on kisskb hasn't changed (still gcc-4.6.3-nolibc).

Ok.

>>> [Deleted 1166 lines about "warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]" on parisc-allmodconfig]
>>
>> This has been introduced a while ago.  Would be good to get it fixed, too.
>> I guess the "cflags-y += -ffunction-sections" still needs some CONFIG check,
>> despite commit 366dd4ea9d5f0eb7 ("parisc: Fix ftrace function tracer")?
> 
> I found this mailing list discussion:
> 
> https://gcc.gnu.org/ml/gcc-help/2008-11/msg00141.html
> https://gcc.gnu.org/ml/gcc-help/2008-11/msg00139.html
> 
> This patch was merged into gcc-4.8:
> 
> https://patchwork.ozlabs.org/patch/197134/
> 
> As the -ffunction-sections is a workaround for another problem, we could
> use make it conditional on having a more recent compiler here.

Yes, please update the compiler. I suggested that last time already.
I'm using gcc-6.1.1-cross from Fedora:
hppa-linux-gnu-gcc (GCC) 6.1.1 20160621 (Red Hat Cross 6.1.1-2)
downloaded the given parisc-allmodconfig and it does not show any of those warnings.  

Helge
