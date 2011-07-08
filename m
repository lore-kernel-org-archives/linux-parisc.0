From: John David Anglin <dave.anglin@bell.net>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Fri, 08 Jul 2011 11:18:33 -0400
Message-ID: <4E171FC9.3070505@bell.net>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com> <201107051951.16931.eike@sf-mail.de> <CADZpyiyi8=FY-2ihDq0RnXt5BZ3H09pSN1bYCHvQuFTvroCyrQ@mail.gmail.com> <201107081700.19668.eike-kernel@sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201107081700.19668.eike-kernel@sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/8/2011 11:00 AM, Rolf Eike Beer wrote:
> Am Mittwoch 06 Juli 2011, 00:17:03 schrieben Sie:
>> On Tue, Jul 5, 2011 at 1:51 PM, Rolf Eike Beer<eike@sf-mail.de>  wrote:
>>> Am Dienstag 05 Juli 2011, 19:28:35 schrieben Sie:
>>>> On Mon, Jul 4, 2011 at 2:59 PM, Carlos O'Donell
>>>> <carlos@systemhalted.org>
>>> wrote:
>>>>> On Mon, Jul 4, 2011 at 2:50 PM, John David Anglin
>>>>> <dave.anglin@bell.net>
>>> wrote:
>>>>>> The Linux man page says the mprotect addr must be a valid pointer or
>>>>>> a multiple of PAGESIZE.
>>>>>> It's not clear what the mprotect call is trying to protect but it is
>>>>>> definitely not page aligned.
>>>>> It's trying to protect the new stack for the thread, which is
>>>>> obviously in the wrong spot.
>>>> Good news.
>>>>
>>>> I have fixed tst-cputimer1.
>>> You also wrote "OK, fixed the kernel." So where an when will these fixes
>>> show up?
>> Unfortunately I hosed my setup and I didn't have git installed to make
>> a proper diff so here's a diff versus a somewhat recent tree.
>>
>>   WIP patch: http://www.parisc-linux.org/~carlos/futex.diff
> Half of your diff (e.g. the int->u32 conversion) is already in upstream. I've
> rediffed it against Linus tree and fixed some of the whitespace damage.
>
> Eike

+	if (!ret)
+		if (val == oldval)
+			ret = put_user(newval, uaddr);

This bit is ugly.

Dave

-- 
John David Anglin    dave.anglin@bell.net

