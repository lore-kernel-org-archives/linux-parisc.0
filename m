From: Helge Deller <deller@gmx.de>
Subject: Re: fs/select.c:991:1: warning: the frame size of 1032 bytes is
 larger than 1024 bytes
Date: Wed, 13 Sep 2017 00:12:14 +0200
Message-ID: <7eba246c-c2bd-4d47-41a8-93e43239bb02@gmx.de>
References: <alpine.LRH.2.21.1709111719310.23935@math.ut.ee>
 <20170911194143.GA17131@ls3530.fritz.box>
 <alpine.LRH.2.21.1709112315350.7844@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc@vger.kernel.org,
        Linux Kernel list <linux-kernel@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.21.1709112315350.7844@math.ut.ee>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11.09.2017 22:16, Meelis Roos wrote:
>> Meelis, this patch should fix both issues.
>> Can you test?
> 
> At least one of the warnings is still there - but I am on a 64-bit
> kernel on RP3440, RP3410 and A500 where I saw this.

Details?
The ones you sent were 32bit issues (with 1024 bytes frame-size-warning):
fs/select.c:991:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
arch/parisc/kernel/inventory.c:359:1: warning: the frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Helge


>>
>> Helge
>>
>> [PATCH] parisc: Fix too large frame size warnings
>>
>> The parisc architecture requires larger stack frames than most other
>> architectures on 32-bit kernels.
>> Increase the default to 1280 bytes for parisc to avoid warnings in
>> do_sys_poll() and pat_memconfig() functions.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>> index b19c491cbc4e..2689b7c50c52 100644
>> --- a/lib/Kconfig.debug
>> +++ b/lib/Kconfig.debug
>> @@ -219,7 +219,8 @@ config FRAME_WARN
>>   	range 0 8192
>>   	default 0 if KASAN
>>   	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>> -	default 1024 if !64BIT
>> +	default 1280 if (!64BIT && PARISC)
>> +	default 1024 if (!64BIT && !PARISC)
>>   	default 2048 if 64BIT
>>   	help
>>   	  Tell gcc to warn at build time for stack frames larger than this.
>>
> 
