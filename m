Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2F3D483E
	for <parisc-linux@parisc-linux.org>; Sun, 19 Oct 2003 09:28:25 -0600 (MDT)
Message-ID: <3F92AD98.3030104@tiscali.be>
Date: Sun, 19 Oct 2003 15:28:24 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) do_page_fault?
References: <3F8A272E00000550@ocpmta3.freegates.net> <3F91ACEC.1010504@tiscali.be>
In-Reply-To: <3F91ACEC.1010504@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Too bad,

The pb re-occurs also with 2.4.21-32 but this time during two kernels 
(2.4.22 && 2.6) was build at the same time. When 2.6 was finished, I can 
re-launch evolution without pb. Could it be a pb of swap? How may check 
if its limits were reach at this moment?

Thanks,
	Joel


Joel Soete wrote:
> Carlos,
> 
> I just reboot my C110 but with a kernel 2.4.21-32 and evolution works 
> fine. OTC with k2.6 still failled. I will try to see later what is wrong :(
> 
> Thanks again,
>     Joel
> 
> 
> Joel Soete wrote:
> 
>> Hi Carlos,
>>
>> I just haven't such hw at my office where otc i can do some other 
>> check on
>> the b2k model.
>>
>> On this b2k (also installed with unstable debian) run fine the same 
>> release
>> of evolution (otc what i said).
>> But it is booted with last 2.4 (a merge of 23-pre7 and 22-pa12) with 256M
>> of ram (only 128k for c110) and without mozilla-psm (a recommended or 
>> suggested
>> additional pkg added on c110).
>>
>> So a lot of test to figure out the present pb :)
>>
>> Thanks a lot ( I will advise you :) )
>>     Joel
>>
>>
>>> -- Original Message --
>>> From: Carlos O'Donell <carlos@baldric.uwo.ca>
>>> To: Joel Soete <soete.joel@tiscali.be>
>>> Cc: parisc-linux@parisc-linux.org
>>> Date: Sun, 12 Oct 2003 16:02:02 -0400
>>> Subject: Re: [parisc-linux] evolution (1.4.5-1) do_page_fault?
>>>
>>>
>>> On Sun, Oct 12, 2003 at 06:42:55PM +0000, Joel Soete wrote:
>>> Hello Carlos,
>>>
>>> I launch 'gbd evolution'
>>> (gdb) run
>>> to determine the new address in this env but failed before with message:
>>> Program received signal SIG37, Real-time event 37.
>>
>>
>>
>>>> 0x4193c574 in malloc_set_state () from /lib/libc.so.6
>>>
>>>
>>> what's your opinion?
>>
>>
>>
>> That's libpthreads realtime singal mechanism working.
>> You need to set "handle all nostop" and "handle all pass" in gdb.
>>
>> Then you can do the math with /proc/<pid>
>>
>>> maps and the dying address to
>>
>>
>> calculate the _real_ library offset and function symbolic name.
>>
>> c.
>> _______________________________________________
>> parisc-linux mailing list
>> parisc-linux@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman
>>
>>> listinfo/parisc-linux
>>
>>
>>
>>
>>
>> -------------------------------------------------------------------------
>> L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
>> pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr
>>
>> _______________________________________________
>> parisc-linux mailing list
>> parisc-linux@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
