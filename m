From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Ftrace broken on parisc
Date: Wed, 29 Jan 2014 16:09:24 -0500
Message-ID: <BLU0-SMTP5322CCBAB0E88E9E147CB597AC0@phx.gbl>
References: <20140129205944.4f71ca1c@dellete> <52E96811.7000403@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
To: Helge Deller <deller@gmx.de>, Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52E96811.7000403@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/29/2014 3:44 PM, Helge Deller wrote:
> Hi Guy,
>
> On 01/29/2014 08:59 PM, Guy Martin wrote:
>> It seems that the ftrace subsystem has not been maintained for a few
>> years.
> Yes.
>   
>> So far I have the diff at the bottom that attempts to fix it bug there
>> is still an issue while linking :
> I'm not sure I tested 64bit at that time.
>
>> arch/parisc/kernel/built-in.o: In function `return_to_handler':
>> (.text+0xb2a8): undefined reference to `ftrace_return_to_handler'
>> hppa64-linux-ld: arch/parisc/kernel/built-in.o(.text+0xllx): cannot
>> reach (null)
>> arch/parisc/kernel/built-in.o: In function `return_to_handler':
>> (.text+0xb2a8): relocation truncated to fit: R_PARISC_PCREL17F against
>> undefined symbol `ftrace_return_to_handler'
>> make: *** [vmlinux] Error 1
>>
>> I'm not sure how this can be fixed, the problems comes from the
>> assembly in entry.S, it uses a 'b' to jump to ftrace_return_to_handler.
>> I guess 'be' needs to be used but not sure how that'd works with the
>> linker.
> Can you try
> BL ftrace_return_to_handler, %r0
> (I'm not good in hppa assembly - as you can see if you take a look at this assembly code section :-)).
>
BL might not reach on PA 1.1.  The PA 2.0 b,l instruction is only "long" 
when the link
register is %rp and it is used for the return_trampoline.

I would say replace "b" with the following as it will always reach target:
         load32  ftrace_return_to_handler, %r20
         bv      %r0(%r20)

%r1 is another register alternative.

Dave

-- 
John David Anglin    dave.anglin@bell.net

