From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Sort output dynamic relocations.
Date: Sat, 9 Jul 2011 11:08:12 -0400
Message-ID: <6957FCF8-0667-4DEF-8134-EACB33D47A13@bell.net>
References: <CADZpyiyS2m9cc=RuUg+DOc3xfEMFOAfdYWwFLbjDTUmgqtnDsQ@mail.gmail.com> <4E15F06E.8040601@bell.net> <CADZpyixAMSZaNY_cU09MEz+bbH4yUvyGxcmZxbiAqJU4hK-7WQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Cc: John David Anglin <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyixAMSZaNY_cU09MEz+bbH4yUvyGxcmZxbiAqJU4hK-7WQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 7-Jul-11, at 7:13 PM, Carlos O'Donell wrote:

> On Thu, Jul 7, 2011 at 1:44 PM, John David Anglin <dave.anglin@bell.net 
> > wrote:
>> On 7/7/2011 11:29 AM, Carlos O'Donell wrote:
>>>
>>> Dave,
>>>
>>> FYI.
>>>
>>> PA should be sorting relocations in .rlea.dyn such that realtive
>>> relocations (DIR32) are listed first before opd relocs (PLABEL32).
>>
>> I imagine that this shouldn't be too hard to implement.


As far as I can tell, most targets don't sort dynamic relocations.   
The exceptions
that I see are mips and score.  Doing this will increase link time, so  
I tend to think
it should be avoided if possible.  Isn't the dynamic loader a special  
case?

Have you tried the ld "-z combreloc" option to see if that works?  It  
combines
reloc sections and sorts them.

If "-z combreloc" doesn't produce the right order, then we will need  
something
similar to elf_hppa_sort_unwind().  elfxx-mips.c has a compare function
sort_dynamic_relocs.

Dave
--
John David Anglin	dave.anglin@bell.net



