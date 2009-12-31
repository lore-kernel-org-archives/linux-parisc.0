From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Thu, 31 Dec 2009 20:11:18 +0100
Message-ID: <4B3CF756.7050702@gmx.de>
References: <20091223221856.3E76F4E77@hiauly1.hia.nrc.ca>	 <119aab440912231822m4b2a9c30ja5e17404210e7e50@mail.gmail.com>	 <20091228185916.GA13912@hiauly1.hia.nrc.ca> <4B3A0889.7030701@gmx.de> <119aab440912311014j276d8c29mc8d8b59c7c5cafd1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912311014j276d8c29mc8d8b59c7c5cafd1@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/31/2009 07:14 PM, Carlos O'Donell wrote:
> On Tue, Dec 29, 2009 at 8:47 AM, Helge Deller<deller@gmx.de>  wrote:
>>> 2) Change return space register to sr7.  sr3 is not set correctly
>>> if the entry number is invalid.
>>
>> Yep.
>>
>>> Have nasty suspicion that sr3 is getting hit...
>
> Is the thought here that we take an interrupt, and sr3 is not
> guaranteed saved/restored, while sr7 is guaranteed?
>
> I don't see anything wrong with moving the gate earlier (unless
> someone can come up with a case where an LWS may not want to gate).
>
> It has the benefit of making the fast path 1 instruction shorter,
> however I don't see that it makes the implementation more correct.

I tested the patch and the testcase in
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=561203
still segfaults.

Nevertheless, I think Dave's patch should be applied...

Helge
