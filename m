From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] 64bit LWS CAS
Date: Fri, 18 Jul 2014 18:12:30 -0400
Message-ID: <BLU436-SMTP1308F81AF14D15C0659D6D997F50@phx.gbl>
References: <20140717220000.555b2bec@dellete.lux.tuxicoman.be> <BLU436-SMTP218A41974C191160FBF5D1097F50@phx.gbl> <CAE2sS1hGVBucXU+34APoWWLRVpmP9RDA0GOOUMiGSKXGhioYsA@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1hGVBucXU+34APoWWLRVpmP9RDA0GOOUMiGSKXGhioYsA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 18-Jul-14, at 5:55 PM, Carlos O'Donell wrote:

>> This discussion has got me thinking that the char and short  
>> implementations
>> may be broken (i.e,
>> the CAS operation may clobber data adjacent to location being  
>> operated on).
>> I'm thinking we need
>> separate LWS calls for them.  Thoughts?
>
> Yes, you need masking or short load variants. How did you test the
> char and short implementations? ;-)

There is no testing beyond the general testing of atomics in GCC.   
There is masking
in the GCC code but I think this is racy.  Another thread might modify  
the masked data
during the CAS operation and this might be lost.  I've never seen it  
in the real world though.

The implementation was originally copied from arm.

Dave
--
John David Anglin	dave.anglin@bell.net



