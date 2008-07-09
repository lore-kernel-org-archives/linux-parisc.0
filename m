From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] drop superfluous .align 16
Date: Wed, 09 Jul 2008 21:50:56 +0200
Message-ID: <487516A0.6090601@gmx.de>
References: <200807082206.36288.deller@gmx.de> <119aab440807090514o282301a9g6ef05149dbca3efb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Randolph Chung <tausq@parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440807090514o282301a9g6ef05149dbca3efb@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos O'Donell wrote:
> On Tue, Jul 8, 2008 at 4:06 PM, Helge Deller <deller@gmx.de> wrote:
>> This .align 16 is misplaced and should be in front of the ENTRY(lws_lock_start).
>> Works because of pure luck since we have a .align PAGE_SIZE before it instead.
> 
> This is not true, the .align 16 aligns almost any object in the
> subsection including .word.

Sure, but it does not take care of lws_lock_start itself.

> However, it is superfluous since we have a .align PAGE_SIZE, but I was
> probably being safe in the event that someone put an object before
> lws_lock_start.

What I mean is, that the lws_lock_start label should start at 16byte 
boundary, right? (it is due to the .align PAGE_SIZE).
Now, if e.g. the .word555 (see below) would be in there, then
lws_lock_start would be at PAGE_SIZE+4, while the .word1 would start at 
PAGE_SIZE+16, which is wrong for accessing the lws_lock_start variables, 
where the first entry should be "1".

Example:
        .align  PAGE_SIZE
        .word 5555  <<<- think this would be here.
ENTRY(lws_lock_start)
       /* lws locks */
      .align 16
      .rept 16
      /* Keep locks aligned at 16-bytes */
      .word 1

So, I still think it would be better to remove the .align16, or 
alternatively to move it in front of ENTRY(lws_lock_start) [to be on the 
safe side].

Am I really that wrong?

Helge

>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> --- a/arch/parisc/kernel/syscall.S
>> +++ b/arch/parisc/kernel/syscall.S
>> @@ -640,7 +640,6 @@ END(sys_call_table64)
>>        .align  PAGE_SIZE
>>  ENTRY(lws_lock_start)
>>        /* lws locks */
>> -       .align 16
>>        .rept 16
>>        /* Keep locks aligned at 16-bytes */
>>        .word 1
> 
> Cheers,
> Carlos.
