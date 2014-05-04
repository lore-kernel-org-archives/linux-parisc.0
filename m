From: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] parisc,metag: Do not hardcode maximum userspace stack
 size
Date: Sun, 04 May 2014 09:28:05 +0200
Message-ID: <5365EC05.5080900@gmx.de>
References: <20140430212602.GA20601@p100.fritz.box>		 <53622DBA.807@imgtec.com> <1398966636.2174.21.camel@dabdike>	 <5363876A.2030709@imgtec.com> <1399042116.2202.1.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	John David Anglin <dave.anglin-CzeTG9NwML0@public.gmane.org>,
	linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Bottomley <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>,
	James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399042116.2202.1.camel@dabdike>
List-ID: <linux-metag.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/02/2014 04:48 PM, James Bottomley wrote:
> On Fri, 2014-05-02 at 12:54 +0100, James Hogan wrote:
>> On 01/05/14 18:50, James Bottomley wrote:
>>>
>>>> +
>>>> +config MAX_STACK_SIZE_MB
>>>> +	int "Maximum user stack size (MB)"
>>>> +	default 80
>>>> +	range 8 256 if METAG
>>>> +	range 8 2048
>>>> +	depends on STACK_GROWSUP
>>>> +	help
>>>> +	  This is the maximum stack size in Megabytes in the VM layout of user
>>>> +	  processes when the stack grows upwards (currently only on parisc and
>>>> +	  metag arch). The stack will be located at the highest memory address
>>>> +	  minus the given value, unless the RLIMIT_STACK hard limit is changed
>>>> +	  to a smaller value in which case that is used.
>>>> +
>>>> +	  A sane initial value is 80 MB.
>>>
>>> There's one final issue with this: placement of the stack only really
>>> matters on 32 bits.  We have three expanding memory areas: stack, heap
>>> and maps.  On 64 bits these are placed well separated from each other on
>>> 64 bits, so an artificial limit like this doesn't matter.
>>
>> Does the following fixup diff look reasonable? It forces
>> MAX_STACK_SIZE_MB to 1024 and hides the Kconfig option for 64BIT,
>> effectively leaving the behaviour unchanged in that case.
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index e80075979530..b0307f737bd7 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -583,7 +583,8 @@ config GENERIC_EARLY_IOREMAP
>>  	bool
>>
>>  config MAX_STACK_SIZE_MB
>> -	int "Maximum user stack size (MB)"
>> +	int "Maximum user stack size (MB)" if !64BIT
>> +	default 1024 if 64BIT
>>  	default 80
>>  	range 8 256 if METAG
>>  	range 8 2048
> 
> Yes, I think that's probably correct ... 

No, it's not correct.
It will then choose then a 1GB stack for compat tasks on 64bit kernel.

Helge

> parisc doesn't actually have
> anything other than a testbed 64 bit userspace, so this is a bit
> theoretical for us.




--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
