From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Sort output dynamic relocations.
Date: Thu, 7 Jul 2011 19:13:13 -0400
Message-ID: <CADZpyixAMSZaNY_cU09MEz+bbH4yUvyGxcmZxbiAqJU4hK-7WQ@mail.gmail.com>
References: <CADZpyiyS2m9cc=RuUg+DOc3xfEMFOAfdYWwFLbjDTUmgqtnDsQ@mail.gmail.com>
	<4E15F06E.8040601@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E15F06E.8040601@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 7, 2011 at 1:44 PM, John David Anglin <dave.anglin@bell.net> wrote:
> On 7/7/2011 11:29 AM, Carlos O'Donell wrote:
>>
>> Dave,
>>
>> FYI.
>>
>> PA should be sorting relocations in .rlea.dyn such that realtive
>> relocations (DIR32) are listed first before opd relocs (PLABEL32).
>
> I imagine that this shouldn't be too hard to implement.
>>
>> This is required for the dynamic linker in glibc to operate correctly.
>
> Is this related to the initfini_array issue?

No. It's an internal glibc issues. The OPD relocation code has a
relative relocation in it, and it crashes because the OPD relocs are
*before* the relative relocs, and it should be the other way around.
We've just gotten lucky.

I have not seen any initfini_array issues, perhaps because I'm using
glibc git head which might have a generic fix for that, I saw some
related patches go into head.

Cheers,
Carlos.
