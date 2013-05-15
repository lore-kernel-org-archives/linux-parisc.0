From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc boot crash on 3.10-rc1+git
Date: Wed, 15 May 2013 18:32:34 -0400
Message-ID: <BLU0-SMTP17357AC6F8AF968964CF7297A20@phx.gbl>
References: <alpine.SOC.1.00.1305141432120.9094@math.ut.ee> <alpine.SOC.1.00.1305150957460.29631@math.ut.ee> <5193D0F5.4060706@gmx.de> <1536577.0f4jSevITp@eto>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1536577.0f4jSevITp@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15-May-13, at 3:34 PM, Rolf Eike Beer wrote:

> Am Mittwoch 15 Mai 2013, 20:16:21 schrieb Helge Deller:
>> Hi Meelis,
>>
>> On 05/15/2013 08:59 AM, Meelis Roos wrote:
>>>>> It did not work - first a __schedule_bug,
>>>>
>>>> I assume you have CONFIG_PREEMPT enabled? We know it's currently  
>>>> broken.
>>>
>>> It is already disabled:
>>>
>>> CONFIG_PREEMPT_NONE=y
>>> # CONFIG_PREEMPT_VOLUNTARY is not set
>>> # CONFIG_PREEMPT is not set
>>> CONFIG_PREEMPT_COUNT=y
>>>
>>> I just enabled the new irqstacks...
>>
>> Ok, the good thing is, that I got today a rp5470 with which I could
>> reproduce your problems.
>>
>> The bad thing is:
>> Beside CONFIG_PREEMPT, CONFIG_DISCONTIGMEM is broken too.
>
> My C8000 runs 3.7.3 happily, so it must have happened after that.


I suspect that you actually have to have discontiguous memory to  
trigger the bug.

Dave
--
John David Anglin	dave.anglin@bell.net



