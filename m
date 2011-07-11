From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: Sort output dynamic relocations.
Date: Mon, 11 Jul 2011 09:55:26 -0400
Message-ID: <4E1B00CE.9030707@systemhalted.org>
References: <CADZpyiyS2m9cc=RuUg+DOc3xfEMFOAfdYWwFLbjDTUmgqtnDsQ@mail.gmail.com>	<4E15F06E.8040601@bell.net>	<CADZpyixAMSZaNY_cU09MEz+bbH4yUvyGxcmZxbiAqJU4hK-7WQ@mail.gmail.com>	<6957FCF8-0667-4DEF-8134-EACB33D47A13@bell.net> <CADZpyiwLzQmQRHM0VOgfc7hxT3ZdXBuchb64O3v2poYMTC93oA@mail.gmail.com> <4E1AFB99.5090402@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E1AFB99.5090402@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/11/2011 9:33 AM, John David Anglin wrote:
> On 7/10/2011 9:27 PM, Carlos O'Donell wrote:
>> On Sat, Jul 9, 2011 at 11:08 AM, John David
>> Anglin<dave.anglin@bell.net>  wrote:
>>> As far as I can tell, most targets don't sort dynamic
>>> relocations.  The exceptions that I see are mips and score.
>>> Doing this will increase link time, so I tend to think it should
>>> be avoided if possible.  Isn't the dynamic loader a special
>>> case?
>> Ulrich Drepper says that relative relocations must *always* be
>> first, it doesn't require a complete sort.
>> 
> I'm not knowledgeable about x86 but I don't believe it has a
> relocation equivalent to the PLABEL32 reloc.  Everything in .rel.dyn
> may be relative.  However, R_386_RELATIVE seems to occur before
> R_386_GLOB_DATA.  I'm not sure how this is done.

It might just be a happy accident of the input order.
 
> If we need to sort, combreloc may need to be disabled because it
> might do an incompatible sort.

OK.
 
>> The dynamic loader is a special case, but there are some
>> requirements.
>> 
>>> Have you tried the ld "-z combreloc" option to see if that works?
>>> It combines reloc sections and sorts them.
>> I haven't tried that yet, are you saying we should change binutils
>> to *default* to "-z combreloc?"
> No.  I was just thinking of trying to link the dynamic loader with
> this option.  Didn't notice any other targets making it the default.

Right! That's a good idea, I'll give this a try.

Yes, the dynamic linker is the only thing that has this requirement.

Cheers,
Carlos.

