From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: Re: [PATCH v3] arch: Kconfig: Let all architectures set endian explicitly
Date: Fri, 15 Aug 2014 06:22:35 +0800
Message-ID: <53ED36AB.8020703@gmail.com>
References: <53ECE9DD.80004@gmail.com> <C2D7FE5348E1B147BCA15975FBA230753C4BA528@IN01WEMBXA.internal.synopsys.com> <CAF0htA6qfhyVXEuLbruiz+dfxnieF-309NdxSDhoEYHM=aBhQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "rth@twiddle.net" <rth@twiddle.net>,
        "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
        "mattst88@gmail.com" <mattst88@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jean Delvare <jdelvare@suse.de>,
        "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will.deacon@arm.com" <will.deacon@arm.com>,
        "hskinnemoen@gmail.com" <hskinnemoen@gmail.com>,
        "egtvedt@samfundet.no" <egtvedt@samfundet.no>,
        "realmz6@gmail.com" <realmz6@gmail.com>,
        "msalter@redhat.com" <msalter@redhat.com>,
        "a-jacquiot@ti.com" <a-jacquiot@ti.com>,
        "starvik@axis.com" <starvik@axis.com>,
        "jesper.n
To: Lennox Wu <lennox.wu@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAF0htA6qfhyVXEuLbruiz+dfxnieF-309NdxSDhoEYHM=aBhQA@mail.gmail.com>
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: linux-mips <linux-mips.eddie.linux-mips.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>

On 08/15/2014 02:27 AM, Lennox Wu wrote:
> I don't think it's necessary, what's the benfit?
> 
> 2014-08-15 2:21 GMT+08:00 Vineet Gupta <Vineet.Gupta1@synopsys.com>:
> 
>> On Thursday 14 August 2014 09:55 AM, Chen Gang wrote:
[...]
>>> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
>>> index 9596b0a..e939abd 100644
>>> --- a/arch/arc/Kconfig
>>> +++ b/arch/arc/Kconfig
>>> @@ -35,6 +35,7 @@ config ARC
>>>       select OF_EARLY_FLATTREE
>>>       select PERF_USE_VMALLOC
>>>       select HAVE_DEBUG_STACKOVERFLOW
>>> +     select CPU_LITTLE_ENDIAN if !CPU_BIG_ENDIAN
>>
>> It is not clear what exactly are you trying to fix. What doesn't work w/o
>> this
>> patch !
>>

For many individual modules may need check CPU_LITTLE_ENDIAN or
CPU_BIG_ENDIAN, which is an architecture's attribute.

Or they have to list many architectures which they support, which they
don't support. And still, it is not precise.

For architecture API, endian is a main architecture's attribute which
may be used by outside, so every architecture need let outside know
about it, explicitly.


Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed
