From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] 64bit LWS CAS
Date: Fri, 18 Jul 2014 20:42:17 -0400
Message-ID: <BLU436-SMTP175ABE53FF395269670B9A097F20@phx.gbl>
References: <20140717220000.555b2bec@dellete.lux.tuxicoman.be> <BLU436-SMTP218A41974C191160FBF5D1097F50@phx.gbl> <CAE2sS1hGVBucXU+34APoWWLRVpmP9RDA0GOOUMiGSKXGhioYsA@mail.gmail.com> <BLU436-SMTP1308F81AF14D15C0659D6D997F50@phx.gbl> <CAE2sS1jCtgrQKReKsdYj4Of+0pR0p+gw+RwqzncEyT=mMbQMLQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1jCtgrQKReKsdYj4Of+0pR0p+gw+RwqzncEyT=mMbQMLQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 18-Jul-14, at 8:38 PM, Carlos O'Donell wrote:

> On Fri, Jul 18, 2014 at 6:12 PM, John David Anglin <dave.anglin@bell.net 
> > wrote:
>> There is no testing beyond the general testing of atomics in GCC.   
>> There is
>> masking
>> in the GCC code but I think this is racy.  Another thread might  
>> modify the
>> masked data
>> during the CAS operation and this might be lost.  I've never seen  
>> it in the
>> real world though.
>
> The race is real IMO, but you're right that it might be hard to  
> trigger.
>
> My opinion is that the only way you can do this is to write new LWS
> CAS variants that do half-word or byte loads, compares and stores. You
> can't touch the surrounding data safely.

I totally agree.

Dave
--
John David Anglin	dave.anglin@bell.net



