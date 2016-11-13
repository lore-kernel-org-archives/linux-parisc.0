From: Jeff Law <law@redhat.com>
Subject: Re: Change call ABI on PA-RISC
Date: Sun, 13 Nov 2016 11:56:43 -0700
Message-ID: <93610ddc-78d3-f456-9ca0-59362ac7b355@redhat.com>
References: <0E3ABDFC-D082-4DA8-9D5B-12FC7E95335F@bell.net>
 <bf499ea2-6148-9cf8-eba3-b0f6de5cf309@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <bf499ea2-6148-9cf8-eba3-b0f6de5cf309@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/13/2016 11:37 AM, Helge Deller wrote:
> On 12.11.2016 19:00, John David Anglin wrote:
>> I'm thinking about adding a "-mabi=" option to change the call ABI.  Currently, objects larger than 64 bits
>> in the 32-bit runtime are passed by reference and the callee copies the object when necessary.  This is
>> opposite to x86 where the caller does the copies.  Most targets are caller copies.
>>
>> The problem with callee copies is that it doesn't work with openmp.  There are race problems and sometimes
>> we get internal compiler errors with openmp code due to this problem.  This became apparent when new testcases
>> were added to gcc-6.  It's tough to fix this problem in gcc.
>>
>> This is gcc PR:
>> <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68733>.
>>
>> This is fixed if we change abi to caller copies (maybe "-mabi=gnu" and "-mabi=hp").  The default could be set
>> by a configure options.  Probably, we would want the new gnu abi on linux as the default.  However, there is
>> the potential to break stuff during the migration to the new abi.
>>
>> Opinions?
>
> PA-RISC Linux is a niche platform. We always had problems with platform-specifics
> which were different to the more widely-used platforms (e.g. stack-grows-upwards,
> more signal numbers (>32) than other platforms, EWOULDBLOCK != EAGAIN, ...).
> That said, I like your proposal if we then gain openmp support and if it doesn't
> heavily breaks other stuff.
The motivation was to allow the callee to avoid the copy when it knew it 
wouldn't be changing the object.  And you could do that through a chain 
of calls avoiding lots of copies along the way.

This turned out to be a huge impact for co-locating the mach kernel and 
OS personality sever within a single address space.  We started that 
research with a pre-bugfix compiler.  During the research I fixed GCC's 
implementation to match the ABI (in response to a bug report I'm sure) 
and didn't think much of it.  When we finally got the co-located stuff 
working and compared it to separate address spaces baselines we'd 
gathered earlier the performance gains were huge and we were exceedingly 
happy.

Of course, I wanted to understand why -- so I dug deeper and eventually 
found that MIG would generate interface code which passed around things 
by-value all the time.  The compiler bugfix essentially allowed the 
compiler to avoid the copy in the callee because the callee didn't 
modify the object.  So we were avoiding a ton of memcpy traffic.

In the end the impact of the compiler bugfix was actually larger than 
the primary effect we were looking for (avoiding context switches, tlb 
flushing, caching effects, etc).

Anyway, as long as the world gets rebuilt and you never mix-match 
objects this should be safe.


> If you are going to change the ABI, maybe we can add more things as well?
> Which comes to my mind here is for example an optimized mcount() function
> which allows changing the return pointer (see -mmcount-ra-address on MIPS) ?
As in twiddling RP to return to a different point?  That's an 
exceedingly bad idea on PA8000 and beyond -- it totally hoses the branch 
predictors.  That's why we turned off the twiddle RP in the delay slot 
of a call to emulate a branch after returning from a call.


jeff
