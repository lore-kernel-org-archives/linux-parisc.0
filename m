Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E191483E
	for <parisc-linux@parisc-linux.org>; Sun, 19 Oct 2003 13:49:14 -0600 (MDT)
Message-ID: <3F92EAB4.7070802@tiscali.be>
Date: Sun, 19 Oct 2003 19:49:08 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
References: <3F8A272E00000550@ocpmta3.freegates.net> <3F91ACEC.1010504@tiscali.be> <3F92AD98.3030104@tiscali.be>
In-Reply-To: <3F92AD98.3030104@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was: do_page_fault?]
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

Hi pa,

Please apologies, I forget to mentioned an important matter:
with 2.6.0-test-pa1 it is not anymore a do_page_fault() but:
evolution (pid 2454): Protection id trap (code 27) 
 
 
YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI 
                            PSW: 00000000000001000000000000001111 Not 
tainted                                                       r00-03 
00000000 ffffff9c 1016fadc 15207b60 
                         r04-07  00000001 0027f220 000000c9 15207b60 
                                                          r08-11 
00000000 0027f228 00000001 fffffff2 
                         r12-15  418db608 418db718 418215a8 418215a8 
                                                          r16-19 
418db608 418215a8 00000070 00000000 
                         r20-23  00000001 00000002 0027f226 15207b6e 
                                                          r24-27 
00000000 00000001 16253f60 10374010 
                         r28-31  00000000 00000005 16028140 1016f8c0 
                                                          sr0-3 
00000000 00000050 00000000 00000050 
                         sr4-7   00000000 00000000 00000000 00000000 
 
 
                    IASQ: 00000000 00000000 IAOQ: 1016fbac 1016fbb0 
                                                      IIR: 0ed3d240 
ISR: 00000050  IOR: 0027f226 
                CPU:        0   CR30: 16028000 CR31: 103cd000 
                                                 ORIG_R28: 418215a8 
 
           IAOQ[0]: sys_poll+0x1f4/0x214 
                                            IAOQ[1]: 
sys_poll+0x1f8/0x214 
                        RP(r2): sys_poll+0x124/0x214 


as well as for 2.4:
evolution (pid 1045): Protection id trap (code 27) 
 
 
YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI 
                            PSW: 00000000000011101111111100001111 Not 
tainted                                                       r00-03 
00000000 00000000 1010e01c 12b1f244 
                         r04-07  faf02700 15310268 00000000 12b1f244 
                                                          r08-11 
00000000 15310460 faf02710 0000000b 
                         r12-15  00000000 418db718 418db608 00142980 
                                                          r16-19 
15310268 faf01e20 00000022 00000000 
                         r20-23  00000000 000000b0 00000001 15310460 
                                                          r24-27 
0000007f 15310509 faf02710 10330010 
                         r28-31  0000000b 00000001 15310740 10136da4 
                                                          sr0-3 
00000088 00000088 00000000 00000088 
                         sr4-7   00000000 00000000 00000000 00000000 
 
 
                    IASQ: 00000000 00000000 IAOQ: 102ec738 102ec730 
                                                      IIR: 0f415222 
ISR: 00000088  IOR: faf02710 
                CPU:        0   CR30: 15310000 CR31: 103d8000 
                                                 ORIG_R28: 00000000 
 


Sorry,
	Joel


Joel Soete wrote:
> Too bad,
> 
> The pb re-occurs also with 2.4.21-32 but this time during two kernels 
> (2.4.22 && 2.6) was build at the same time. When 2.6 was finished, I can 
> re-launch evolution without pb. Could it be a pb of swap? How may check 
> if its limits were reach at this moment?
> 
> Thanks,
>     Joel
> 
> 
> Joel Soete wrote:
> 
>> Carlos,
>>
>> I just reboot my C110 but with a kernel 2.4.21-32 and evolution works 
>> fine. OTC with k2.6 still failled. I will try to see later what is 
>> wrong :(
>>
>> Thanks again,
>>     Joel
>>
>>
>> Joel Soete wrote:
>>
>>> Hi Carlos,
>>>
>>> I just haven't such hw at my office where otc i can do some other 
>>> check on
>>> the b2k model.
>>>
>>> On this b2k (also installed with unstable debian) run fine the same 
>>> release
>>> of evolution (otc what i said).
>>> But it is booted with last 2.4 (a merge of 23-pre7 and 22-pa12) with 
>>> 256M
>>> of ram (only 128k for c110) and without mozilla-psm (a recommended or 
>>> suggested
>>> additional pkg added on c110).
>>>
>>> So a lot of test to figure out the present pb :)
>>>
>>> Thanks a lot ( I will advise you :) )
>>>     Joel
>>>
>>>
>>>> -- Original Message --
>>>> From: Carlos O'Donell <carlos@baldric.uwo.ca>
>>>> To: Joel Soete <soete.joel@tiscali.be>
>>>> Cc: parisc-linux@parisc-linux.org
>>>> Date: Sun, 12 Oct 2003 16:02:02 -0400
>>>> Subject: Re: [parisc-linux] evolution (1.4.5-1) do_page_fault?
>>>>
>>>>
>>>> On Sun, Oct 12, 2003 at 06:42:55PM +0000, Joel Soete wrote:
>>>> Hello Carlos,
>>>>
>>>> I launch 'gbd evolution'
>>>> (gdb) run
>>>> to determine the new address in this env but failed before with 
>>>> message:
>>>> Program received signal SIG37, Real-time event 37.
>>>
>>>
>>>
>>>
>>>>> 0x4193c574 in malloc_set_state () from /lib/libc.so.6
>>>>
>>>>
>>>>
>>>> what's your opinion?
>>>
>>>
>>>
>>>
>>> That's libpthreads realtime singal mechanism working.
>>> You need to set "handle all nostop" and "handle all pass" in gdb.
>>>
>>> Then you can do the math with /proc/<pid>
>>>
>>>> maps and the dying address to
>>>
>>>
>>>
>>> calculate the _real_ library offset and function symbolic name.
>>>
>>> c.
>>> _______________________________________________
>>> parisc-linux mailing list
>>> parisc-linux@lists.parisc-linux.org
>>> http://lists.parisc-linux.org/mailman
>>>
>>>> listinfo/parisc-linux
>>>
>>>
>>>
>>>
>>>
>>>
>>> ------------------------------------------------------------------------- 
>>>
>>> L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
>>> pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr
>>>
>>> _______________________________________________
>>> parisc-linux mailing list
>>> parisc-linux@lists.parisc-linux.org
>>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>>
>>
>>
>> _______________________________________________
>> parisc-linux mailing list
>> parisc-linux@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
