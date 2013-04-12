From: John David Anglin <dave.anglin-CzeTG9NwML0@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Thu, 11 Apr 2013 22:34:43 -0400
Message-ID: <BLU0-SMTP62F4273B01E0328ADCD7BE97C10@phx.gbl>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304071439.15297.vapier@gentoo.org> <BLU0-SMTP986B123D17DB8B88214F797C40@phx.gbl> <201304112155.46349.vapier@gentoo.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>,
	"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	"linux-man" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	Kyle McMartin <kyle-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>,
	Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>,
	"James E.J. Bottomley" <jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org>,
	linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304112155.46349.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-ID: <linux-man.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11-Apr-13, at 9:55 PM, Mike Frysinger wrote:

> On Sunday 07 April 2013 14:48:42 John David Anglin wrote:
>> On 7-Apr-13, at 2:39 PM, Mike Frysinger wrote:
>>> just to be clear, the only insn you need is:
>>> 	ble 0x100(%sr2, %r0);
>>>
>>> the kernel docs say sr2 holds the kernel gateway page (so i guess
>>> 0x100 is a
>>> known offset into that).  the docs don't mention r0 that i can see,
>>> so i'm
>>> guessing it's one of those "always 0" registers ?
>>
>> Yes.  There is also an entry at offset 0xb0 for light-weight-
>> syscalls.  Currently,
>> this implements an atomic CAS operation used for pthread support.
>
> interesting.  sounds like a poor man's vDSO.  i'll document this the  
> new
> vdso(7) man page.

Not exactly, the code runs on the gateway page which is in kernel space.
The main reason for doing the operation in kernel space is to prevent
processes from being preempted while executing in the lock region.  In  
general,
parisc processes are not preempted on the gateway page.  There are
some subtleties regarding fault handling.

There is support in glibc and libgcc for these calls.  The libgcc  
implementation
in linux-atomic.c is very similar to that on arm.

Dave
--
John David Anglin	dave.anglin-CzeTG9NwML0@public.gmane.org



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
