From: Matt Turner <mattst88@gmail.com>
Subject: Re: C8000 cpu upgrade problem
Date: Sat, 23 Oct 2010 11:25:45 -0400
Message-ID: <AANLkTimhs8gyJOwh4eB9M8S3NHNO5KBm_DJZDc=3+=w6@mail.gmail.com>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>
 <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com>
 <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz> <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Oct 23, 2010 at 7:22 AM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> On Sat, Oct 23, 2010 at 5:21 AM, Mikulas Patocka
> <mikulas@artax.karlin.mff.cuni.cz> wrote:
>> On Fri, 22 Oct 2010, Carlos O'Donell wrote:
>>> AFAIK you can't add a second CPU without an HP technician enabling the
>>> firmware for a second CPU.
>>>
>>> The same goes for enabling additional PCI slots.
>>>
>>> Cheers,
>>> Carlos.
>>
>> And is there some hack that enables it?
>>
>> It looks quite dishonest to me when the machine is advertised as capable
>> of two dual-core CPUs, 32GB RAM, 4 PCI-X slots ... and you get this
>> advertised capability only if you buy expensive support contract :-(
>
> I know of no hack.
>
> It is not dishonest, the original purchase contract for the machine
> probably said "1 active CPU slot" and "1 active PCI-X slot."
>
> Cheers,
> Carlos.

It _is_ dishonest, and deceptive at that. When was the last time you
bought a multisocket system and couldn't add a second processor
because you needed a support contract? I've never encountered such a
thing and I've got multisocket x86, Alpha, and SPARC systems.

This whole license-to-use-hardware thing is bullshit. Mikulas bought
the hardware, and thus he should be able to use it. I'm struggling to
find any information about this problem online. I can't even find
anyone else who has reported that adding a second CPU doesn't just
work.

Are we absolutely sure you've got to jump through some licensing
bullshit to enable the CPU? Maybe it's just a missed setting in PDC?

> The same goes for enabling additional PCI slots.

You've got to be kidding me.

I'd been planning to grab a cheap C8000 and help Linux/PARISC. But no.
I'll never use hardware like this on principle.

Matt
