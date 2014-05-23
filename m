From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Linux 3.15-rc6
Date: Thu, 22 May 2014 18:07:19 -0700
Message-ID: <537E9F47.5020809@roeck-us.net>
References: <CA+55aFzwqPh+WUAxi2CY8D6k+LkDbUb__G98qVFrE-DHNMSPUw@mail.gmail.com>	<20140522172032.GA20975@roeck-us.net> <CA+55aFw_kOE1Y4qkLW4rWfB_NaYYDwFeU=t5swsJCTMq-3J6nA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+55aFw_kOE1Y4qkLW4rWfB_NaYYDwFeU=t5swsJCTMq-3J6nA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/22/2014 05:43 PM, Linus Torvalds wrote:
> Miklos,
>
> this is from your commit 18e480aa07f78 ("parisc: add renameat2
> syscall") which was acked by Helge Deller:
>
> On Thu, May 22, 2014 at 10:20 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Unfortunately it appears that the parisc changes cause build failures
>> with parisc 64 bit builds.
>>
>> Building parisc:a500_defconfig ... failed
>> Building parisc:generic-64bit_defconfig ... failed
>>
>> Error log:
>> arch/parisc/kernel/built-in.o: In function `sys_call_table':
>> (.rodata+0xad0): undefined reference to `compat_sys_renameat2'
>> make: *** [vmlinux] Error 1
>
> only s390 seems to need a compat wrapper, and s390 is kind of odd in
> many respects, so I suspect renameat2 should just use ENTRY_SAME() on
> parisc, but without any way to *test* it I won't apply the patch.
>
> Guenter, I assume that changing the
>
>          ENTRY_COMP(renameat2)
>
> line in arch/parisc/kernel/syscall_table.S to use ENTRY_SAME() at
> least fixes the compile error?
>

Yes, it fixes the build error for parisc64, and parisc (32 bit) still builds.

Guenter

