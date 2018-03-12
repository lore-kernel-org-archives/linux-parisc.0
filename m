From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [PATCH v3 02/10] include: Move compat_timespec/ timeval to
 compat_time.h
Date: Mon, 12 Mar 2018 10:59:53 -0700
Message-ID: <CABeXuvo-D-NFhhx9KXDFy6bYjp0-XZvoky6ugQGdBZr8DjUzxw@mail.gmail.com>
References: <20180116021818.24791-1-deepa.kernel@gmail.com>
 <20180116021818.24791-3-deepa.kernel@gmail.com>
 <c6fb6676-a8d3-8893-660c-2b9899c5d5ab@de.ibm.com>
 <CAK8P3a0Gm1L70EaFzJBk0drRNKtX0FE22BHOSrXBgH1wNfKZ5A@mail.gmail.com>
 <d8480da9-afe9-8a43-9c47-50919215a2de@de.ibm.com>
 <CABeXuvrdPV0q4ufuxEnqT6T3b8pCT5RLUfuAZ_cwXr0it8gj0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 devel@driverdev.osuosl.org, linux-s390 <linux-s390@vger.kernel.org>,
 y2038 Mailman List <y2038@lists.linaro.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>, sebott@linux.vnet.ibm.com,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>,
 oprofile-list@lists.sf.net, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>,
 Robert Richter <rric@kernel.org>, Chris Metcalf <cmetcalf@mellanox.com>,
 Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>,
 Arnaldo Carvalho de Melo <acme@ke
To: Christian Borntraeger <borntraeger@de.ibm.com>
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CABeXuvrdPV0q4ufuxEnqT6T3b8pCT5RLUfuAZ_cwXr0it8gj0Q@mail.gmail.com>
List-Id: Linux Driver Project Developer List
 <driverdev-devel.linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org

I posted the updated series. I fixed up the order of include files
where I could find some order.
There have been other commits that used scripts to do such
replacements and have already stomped on the order.
For example:

commit 7c0f6ba682b9c7632072ffbedf8d328c8f3c42ba
Author: Linus Torvalds <torvalds@linux-foundation.org>
Replace <asm/uaccess.h> with <linux/uaccess.h> globally

-Deepa


On Tue, Mar 6, 2018 at 2:58 PM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> On Tue, Mar 6, 2018 at 4:48 AM, Christian Borntraeger
> <borntraeger@de.ibm.com> wrote:
>>
>>
>> On 03/06/2018 01:46 PM, Arnd Bergmann wrote:
>>> On Mon, Mar 5, 2018 at 10:30 AM, Christian Borntraeger
>>> <borntraeger@de.ibm.com> wrote:
>>>> On 01/16/2018 03:18 AM, Deepa Dinamani wrote:
>>>>> All the current architecture specific defines for these
>>>>> are the same. Refactor these common defines to a common
>>>>> header file.
>>>>>
>>>>> The new common linux/compat_time.h is also useful as it
>>>>> will eventually be used to hold all the defines that
>>>>> are needed for compat time types that support non y2038
>>>>> safe types. New architectures need not have to define these
>>>>> new types as they will only use new y2038 safe syscalls.
>>>>> This file can be deleted after y2038 when we stop supporting
>>>>> non y2038 safe syscalls.
>>>>
>>>> You are now include a <linux/*.h> from several asm files
>>>> (
>>>>  arch/arm64/include/asm/stat.h
>>>>  arch/s390/include/asm/elf.h
>>>>  arch/x86/include/asm/ftrace.h
>>>>  arch/x86/include/asm/sys_ia32.h
>>>> )
>>>> It works, and it is done in many places, but it looks somewhat weird.
>>>> Would it make sense to have an asm-generic/compate-time.h instead? Asking for
>>>> opinions here.
>>>
>>> I don't think we have such a rule. If a header file is common to all
>>> architectures (i.e. no architecture uses a different implementation),
>>> it should be in include/linux rather than include/asm-generic, regardless
>>> of whether it can be used by assembler files or not.
>>>
>>>>> --- a/drivers/s390/net/qeth_core_main.c
>>>>> +++ b/drivers/s390/net/qeth_core_main.c
>>>>> @@ -32,7 +32,7 @@
>>>>>  #include <asm/chpid.h>
>>>>>  #include <asm/io.h>
>>>>>  #include <asm/sysinfo.h>
>>>>> -#include <asm/compat.h>
>>>>> +#include <linux/compat.h>
>>>>>  #include <asm/diag.h>
>>>>>  #include <asm/cio.h>
>>>>>  #include <asm/ccwdev.h>
>>>>
>>>> Can you move that into the other includes (where all the other <linux/*> includes are.
>>>
>>> Good catch, this is definitely a rule we have ;-)
>>
>> FWIW, this was also broken for
>> arch/x86/include/asm/sys_ia32.h
>
> The reason that this was done this way is because of the sed script
> mentioned in the commit text.
> I was trying to make minimal change apart from the script so that we
> don't have other changes like moving the lines to keep the patch
> simpler.
> I will fix this by hand since this is preferred.
> I will post an update.
>
> -Deepa
