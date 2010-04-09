From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Fri, 9 Apr 2010 10:14:33 -0400
Message-ID: <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca>
	 <20100408224446.96F294FA3@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 8, 2010 at 6:44 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> On Thu, 08 Apr 2010, Helge Deller wrote:
>
>> > I tested your patch today on one of my machines with plain kernel =
2.6.33 (32bit, SMP, B2000 I think).
>> > Sadly I still did see the minifail bug.
>> >
>> > Are you sure, that the patch fixed this bug for you?
>>
>> Seemed to, but I have a bunch of other changes installed. =A0Possibl=
y,
>> the change to cacheflush.h is important. =A0It affects all PA8000.
>
> I also think the change suggested by James
>
> + =A0 =A0 =A0 if (pte_dirty(old_pte))
>
> is important for SMP. =A0With the patch set that I sent, my rp3440 an=
d
> gsyprf11 seem reasonably stable running 2.6.33.2 SMP. =A0I doubt all
> problems are solved but things are a lot better than before.

I have trimmed the CC a bit.

We need to start splitting up your giant "stability" patch into
manageable chunks.

=46or example, are the futex fixes anywhere for Kyle to pickup?

I could test those independently and submit to Kyle after testing.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
