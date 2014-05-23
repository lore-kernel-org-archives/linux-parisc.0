From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 3.15-rc6
Date: Thu, 22 May 2014 18:27:20 -0700
Message-ID: <CA+55aFzk3Xw8VsYMmiGvXxzrkh7zenFUrpyobaK_q+17PSh=ww@mail.gmail.com>
References: <CA+55aFzwqPh+WUAxi2CY8D6k+LkDbUb__G98qVFrE-DHNMSPUw@mail.gmail.com>
	<20140522172032.GA20975@roeck-us.net>
	<CA+55aFw_kOE1Y4qkLW4rWfB_NaYYDwFeU=t5swsJCTMq-3J6nA@mail.gmail.com>
	<537E9F47.5020809@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Miklos Szeredi <miklos@szeredi.hu>, Helge Deller <deller@gmx.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Guenter Roeck <linux@roeck-us.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <537E9F47.5020809@roeck-us.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 22, 2014 at 6:07 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 05/22/2014 05:43 PM, Linus Torvalds wrote:
>>
>>
>> only s390 seems to need a compat wrapper, and s390 is kind of odd in
>> many respects, so I suspect renameat2 should just use ENTRY_SAME() on
>> parisc, but without any way to *test* it I won't apply the patch.
>>
>> Guenter, I assume that changing the
>>
>>          ENTRY_COMP(renameat2)
>>
>> line in arch/parisc/kernel/syscall_table.S to use ENTRY_SAME() at
>> least fixes the compile error?
>
> Yes, it fixes the build error for parisc64, and parisc (32 bit) still
> builds.

Ok. I'd like to get some kind of confirmation that it is expected to
work too. Miklos/Helge?

               Linus
