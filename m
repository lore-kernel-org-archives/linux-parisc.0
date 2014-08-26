From: Helge Deller <deller@gmx.de>
Subject: Re: [RFC PATCHv2] 64bit LWS CAS
Date: Tue, 26 Aug 2014 22:11:43 +0200
Message-ID: <53FCE9FF.1080704@gmx.de>
References: <20140729211334.02d2b5e2@borg.lux.tuxicoman.be> <53D810FB.9010406@gmx.de> <f4954acbf0d2c11646341cb93efdd247@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <f4954acbf0d2c11646341cb93efdd247@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Guy,

should we try to do a last round of cleanup of this patch, since
I would like to include it in the next push to Linus...

On 07/30/2014 11:17 AM, Guy Martin wrote:
>>> Regading the GCC counterpart of the implementation, I'm not sure about
>>> the way to proceed.
>>>
>>> Should I try to detect the presence of the new LWS and use it for all
>>> CAS operations at init time ?
>>
>> I leave this up to Dave & Carlos to answer.

I think it's OK to stay using the existing 32bit implementation for 32bit CAS,
and just use the new one for 8/16/64 bit CAS.
And maybe: If the LWS fails, just crash the application.

>> Should we maybe drop the whole ENABLE_LWS_DEBUG thing? Was it ever used/enabled?
>
> Indeed, I have not tested it and I dropped it in this new patch.

Good.
In comments at the top still include info about the debug case:
-> "If debugging is DISabled:..."

>>> I guess that using the new LWS unconditionally for all CAS operations
>>> isn't an option since it will break for newer gcc on old kernels.
>>
>> Up to now we only had the 32bit CAS working correctly, so we shouldn't care much
>> about the other CAS anyway.
>> And if we get it backported into all relevant kernels before we change gcc
>> I would prefer this hard break...

I'm still thinking this is the right way.

Your patch had some whitespace errors too.
Please run it through the scripts/checkpatch tool in the kernel tree.

If you like I can take care of the suggested changes and send a revised patch for you?
Just let me know.

Helge
