From: Helge Deller <deller@gmx.de>
Subject: Re: Aw: Re: parisc-linux.org losing hw hosting after this month
Date: Tue, 05 Nov 2013 22:35:38 +0100
Message-ID: <527964AA.10601@gmx.de>
References: <20131105003509.GA19864@dannf.org> <1383612962.2150.4.camel@dabdike> <BLU0-SMTP219421FBE297D4BFF757F897F10@phx.gbl>, <20131105022209.GC22393@dannf.org> <trinity-7edb2a57-bc89-4ebf-9eb7-ebedef0ee7fd-1383648675665@3capp-gmx-bs06> <BLU0-SMTP1014D1D4D244BA55746CED297F10@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>,
	dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP1014D1D4D244BA55746CED297F10@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/05/2013 07:28 PM, John David Anglin wrote:
> On 11/5/2013 5:51 AM, Helge Deller wrote:
>>>> Is there any possibility that HP might continue to host parisc-linux.org
>>>> on some other subnet/machine?
>>> I've asked before if they had other systems/VMs they could host it on
>>> and the answer was no. I'll ask again to make sure that hasn't changed
>>> for some reason, but I'd recommend looking for other options in the
>>> meantime. Perhaps osuosl.org?
>> I would really prefer if it could go to some place where we e.g. could
>> use it as build/hosting server (e.g. osuosl.org). If that's not possible
>> I would be happy to get it privately for development, since a A500 is something
>> which I don't have yet, and which is not that easy to get here in germany.
>>
> osuosl.org might well be a good alternative.  Helge, would you fill in application?

I will do.

 
> If osuosl doesn't work out, I would support Helge receiving the machine.  I have an A500.
> 
> Regarding the website and wiki, there may be ways to handle that as the bandwidth requirements
> aren't large.

We have a new wiki at 
	https://parisc.wiki.kernel.org/
which I thought to be used as replacement for the website.
I've already started to migrate some pages over.
Anyone is welcome to help with this wiki.

Our regular Wiki (http://wiki.parisc-linux.org/) is hosted at servers from ESIEE and are not affected (AFAICS).
Nevertheless, maybe it would make sense to merge those over to the wiki at kernel.org too? 

> Regarding the unstable archive, Helge and I were recently given accounts on debian-ports and
> now can do package uploads.  I upload the first yesterday.  We need an unstable archive from which
> it's possible to  debootstrap to help with this migration.  Will have to look at setting this up locally.

If the archive at debian-ports works out, why do you want an additional debootstrap location?

Helge
