From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Thu, 17 Dec 2009 16:59:28 -0500
Message-ID: <119aab440912171359k2fff19feya6e1eb2b3e81c0ac@mail.gmail.com>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
	 <200912172240.22252.b.gunreben@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Berthold Gunreben <b.gunreben@web.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200912172240.22252.b.gunreben@web.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 17, 2009 at 4:40 PM, Berthold Gunreben <b.gunreben@web.de> wrote:
> Hi Carlos,
>
> On Sunday 06 December 2009 22:19:13 Carlos O'Donell wrote:
>> Kyle, James,
>>
>> I have constructed a vfork test case which shows some of the problems
>> I have using vfork reliably. This fails every time on my PA8700 system
>> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
>> being corrupted.
>
> this reminds me of a problem with vfork that I encountered some years ago. The
> problem as described in
> http://sourceware.org/ml/libc-alpha/2003-02/msg00042.html
> was fixed for many architectures, but not for hppa as far as I remember. See
> also
> http://sourceware.org/ml/libc-hacker/2003-02/msg00015.html
>
> I have no idea if this is related, but thought it won't hurt to mention this.

That has to do with the assembly not checking the pthread function
lookup table to determine if it should call vfork or pthread's vfork.

In my test case there are no pthread functions calls.

Thanks for the pointer, the fix you point out is no longer needed in nptl.

Cheers,
Carlos.
