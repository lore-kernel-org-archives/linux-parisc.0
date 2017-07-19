From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: parisc:generic-64bit_defconfig build failures due to 'kbuild:
 handle   libs-y archives separately...'
Date: Wed, 19 Jul 2017 10:10:18 +0800
Message-ID: <20170719021018.d7rqvtdpy7m4m5cz@wfg-t540p.sh.intel.com>
References: <2eee9t3p9qmqow3xr998vi1a.1500415087874@email.android.com>
 <20170719120106.54d6ad1f@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Helge Deller <helge.deller@steuerkanzlei-deller.de>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Philip Li <philip.li@intel.com>,
        Ye Xiaolong <xiaolong.ye@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719120106.54d6ad1f@roar.ozlabs.ibm.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 19, 2017 at 12:01:06PM +1000, Nicholas Piggin wrote:
>On Tue, 18 Jul 2017 23:58:07 +0200
>Helge Deller <helge.deller@steuerkanzlei-deller.de> wrote:
>
>>
>> This outstanding patch will fix it:
>> https://patchwork.kernel.org/patch/9832033/
>> Helge 
>> Von meinem Samsung Gerät gesendet.
>
>Thanks for the quick fix. I'm not sure why 0day didn't catch it.
>Does it build test parisc/generic-64bit_defconfig, I wonder?

We do test that config. I guess it's because the build servers are
under pressure recently. Philip/Xiaolong are looking at this issue.

Thanks,
Fengguang

>> -------- Ursprüngliche Nachricht --------
>> Von: Guenter Roeck <linux@roeck-us.net>
>> Datum: 18.07.17  17:21  (GMT+01:00)
>> An: Nicholas Piggin <npiggin@gmail.com>
>> Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
>> Betreff: parisc:generic-64bit_defconfig build failures due to 'kbuild: handle
>  libs-y archives separately...'
>>
>> Hi,
>>
>> parisc64 builds, specifically generic-64bit_defconfig, fail to build
>> in mainline as follows.
>>
>> hppa64-linux-ld:
>> hppa64-linux/bin/../lib/gcc/hppa64-linux/4.9.0/libgcc.a(_divdi3.o)(.text+0xec):
>> cannot reach $$divU
>> hppa64-linux/bin/../lib/gcc/hppa64-linux/4.9.0/libgcc.a(_divdi3.o):
>> In function `__divdi3':
>> libgcc2.c:(.text+0xec): relocation truncated to fit: R_PARISC_PCREL22F against
>> symbol `$$divU' defined in .text.div section in
>> hppa64-linux/bin/../lib/gcc/hppa64-linux/4.9.0/libgcc.a(_divU.o)
>> hppa64-linux-ld:
>> hppa64-linux/bin/../lib/gcc/hppa64-linux/4.9.0/libgcc.a(_divdi3.o)(.text+0x150):
>> cannot reach $$divU
>>
>> [ and many more ]
>>
>> This is after enabling CONFIG_MLONGCALLS; otherwise build failures are
>> more severe.
>>
>> Building with gcc 6.3.0 fails as well with the same error.
>>
>> Bisect points to commit 3a166fc2d4ef ("kbuild: handle libs-y archives
>> separately from built-in.o archives") as the culprit. Bisect log is
>> attached.
