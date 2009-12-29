From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Tue, 29 Dec 2009 14:47:53 +0100
Message-ID: <4B3A0889.7030701@gmx.de>
References: <20091223221856.3E76F4E77@hiauly1.hia.nrc.ca> <119aab440912231822m4b2a9c30ja5e17404210e7e50@mail.gmail.com> <20091228185916.GA13912@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091228185916.GA13912@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/28/2009 07:59 PM, John David Anglin wrote:
> On Wed, 23 Dec 2009, Carlos O'Donell wrote:
>
>> We are just like every other architecture... with the exception that
>> we currently have more bugs :-)
>
> I have been looking at the lws implementation.  I've attached a patch
> with a couple of tweaks:

The patch looks good.

> 1) I changed the unconditional branch at the entry point to a gate.
> Didn't think it was a good idea to execute code at user priveledge.

Can you explain that?
The branch might get interrupted, before the process get privileged?

> This seems to have improved things (got through a complete testsuite
> run on gsyprf11 without a deadlock).

Good. I'll test too.

>However, I hit a slightly different lockup on c3750.

Any info?

> 2) Change return space register to sr7.  sr3 is not set correctly
> if the entry number is invalid.

Yep.

> Have nasty suspicion that sr3 is getting hit...

Helge
