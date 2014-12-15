From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix out-of-register compiler error in ldcw inline
 assembler function
Date: Mon, 15 Dec 2014 21:58:36 +0100
Message-ID: <548F4B7C.8060508@gmx.de>
References: <20141021194614.GA14418@ls3530.box> <A73C80F5-1200-437F-9199-2B916E3457B4@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <A73C80F5-1200-437F-9199-2B916E3457B4@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dave,

On 12/14/2014 04:49 PM, John David Anglin wrote:
> On 21-Oct-14, at 3:46 PM, Helge Deller wrote:
>> Sometimes we face this compiler error:
>>
>> arch/parisc/include/asm/ldcw.h:39:2: error: can't find a register in class 'R1_REGS' while reloading 'asm'
>>     __asm__ __volatile__(__LDCW " 0(%2),%0"...
>>     note: in expansion of macro '__ldcw'
>>     error: 'asm' operand has impossible constraints
>>
>
>
> Helge, could you test the attached patch.  Updated comment in change explains the "memory"
> clobber.  It's been lightly tested.

Your patch seems to do the right thing, and it's nicer.
I didn't faced any compiler issues with it, but still want to test it some more, but I think that's the best approach.
Do you mind sending a full patch to the list ?

Thanks,
Helge
