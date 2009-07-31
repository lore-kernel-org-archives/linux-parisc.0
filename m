From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Fri, 31 Jul 2009 17:14:35 -0400
Message-ID: <119aab440907311414u7afb2247u584437bfb7a2a973@mail.gmail.com>
References: <20090731190304.C7BF55161@hiauly1.hia.nrc.ca>
	 <4A735D9B.30200@gmx.de>
	 <119aab440907311413s2e5ef1ebl690fff1bc4f0daea@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, elendil@planet.nl,
	539378@bugs.debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, randolph@tausq.org,
	submit@bugs.debian.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907311413s2e5ef1ebl690fff1bc4f0daea@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 31, 2009 at 5:13 PM, Carlos O'Donell<carlos@systemhalted.org> wrote:
> On Fri, Jul 31, 2009 at 5:09 PM, Helge Deller<deller@gmx.de> wrote:
>> On 07/31/2009 09:03 PM, John David Anglin wrote:
>>>>
>>>> Only 32-bit targets have the 14-bit signed immediate offset (0x3fff),
>>>> which becomes a 13-bit limit when loading positive offsets e.g.
>>>> +0x1fff or 1023 GOT slots.
>>>
>>> Can't we offset the table and double the number of entries?
>>
>> Dave,
>> Can you explain this idea a little more?
>
> I would also like a little more details.
>
> However, this is similar to the DT_PLTGOT issue in dynamic libraries.
> The value chosen for %dp is arbitrary, and if we made it point into
> the middle of the GOT table, then you would reference the GOT using
> both positive and negative offsets.
>
> For example, this code:
> fdesc->gp = (Elf_Addr)me->module_core + me->arch.got_offset;
>
> Arbitrary chooses the module %dp to point at the start of got_offset,
> why not make that got_offset + <half way>.

Let me be clearer, the value of "(Elf_Addr)me->module_core +
me->arch.got_offset" is the start of the GOT table for the module.

Cheers,
Carlos.
