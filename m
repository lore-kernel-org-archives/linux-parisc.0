From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: Fix compile breakage with kref.h
Date: Tue, 17 Jan 2012 17:09:10 -0500
Message-ID: <CAP=VYLpsdy5ws6PA-DREx-Z6MQP-7djcB3d31kRhR+KT-a74CQ@mail.gmail.com>
References: <1326834845.3020.36.camel@dabdike>
	<20120117212639.GA17297@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <jbottomley@parallels.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Greg Kroah-Hartman <greg@kroah.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120117212639.GA17297@kroah.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jan 17, 2012 at 4:26 PM, Greg Kroah-Hartman <greg@kroah.com> wr=
ote:
> On Tue, Jan 17, 2012 at 09:14:05PM +0000, James Bottomley wrote:
>> This set of build failures just started appearing on parisc:
>>
>> In file included from drivers/input/serio/serio_raw.c:12:
>> include/linux/kref.h: In function 'kref_get':
>> include/linux/kref.h:40: error: 'TAINT_WARN' undeclared (first use i=
n this function)
>> include/linux/kref.h:40: error: (Each undeclared identifier is repor=
ted only once
>> include/linux/kref.h:40: error: for each function it appears in.)
>> include/linux/kref.h: In function 'kref_sub':
>> include/linux/kref.h:65: error: 'TAINT_WARN' undeclared (first use i=
n this function)
>>
>> It happens because TAINT_WARN is defined in kernel.h and this partic=
ular
>> compile doesn't seem to include it (no idea why it's just
>> manifesting ... probably some #include file untangling exposed it). =
=A0Fix
>> by adding #include <linux/kernel.h> to linux/kref.h
>
> Does adding <linux/bug.h> fix it instead? =A0We are using WARN_ON() h=
ere.
> Hm, but that needs kernel.h as well, ugh, what a mess.

I've got some work done already towards cleaning this up; aiming for
getting it done and in linux-next for the 3.4 cycle.

https://lkml.org/lkml/2012/1/4/455

Paul.
---

>
>> Signed-off-by: James Bottomley <JBottomley@Parallels.com>
>
> Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
