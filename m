From: Helge Deller <deller@gmx.de>
Subject: Re: [RFC PATCHv2] 64bit LWS CAS
Date: Tue, 29 Jul 2014 23:24:11 +0200
Message-ID: <53D810FB.9010406@gmx.de>
References: <20140729211334.02d2b5e2@borg.lux.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Guy Martin <gmsoft@tuxicoman.be>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140729211334.02d2b5e2@borg.lux.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Guy,

Very nice work !

On 07/29/2014 09:13 PM, Guy Martin wrote:
> Following the discussion about broken CAS for size != 4, I took a new 
> approach and implemented in a different way.
> 
> The new ABI takes the oldval, newval and mem as pointers plus a size 
> parameter. This means that a single LWS can now handle all types of 
> variable size.
> Note that the 32bit CAS for 64bit size has not been tested (not even
> compiled) since I can't compile a 32bit kernel a the moment.

I compile-tested it...(but didn't runtime tested it yet):

  AS      arch/parisc/kernel/syscall.o
/home/cvs/LINUX/git-kernel/linux-2.6/arch/parisc/kernel/syscall.S: Assembler messages:
/home/cvs/LINUX/git-kernel/linux-2.6/arch/parisc/kernel/syscall.S:866: Error: Invalid operands 
/home/cvs/LINUX/git-kernel/linux-2.6/arch/parisc/kernel/syscall.S:870: Error: Invalid operands 

Line 866 is the jump label 18:
18:     ldd,ma  0(%sr3,%r26), %r29

Line 870 is 19:
19:     ldd,ma  4(%sr3,%r26), %r29

I think both should be ldw ?

An idea:
Maybe the config option CONFIG_PA8X00 (which enables -march=2.0) can be used in
some places to use the 64bit assembler even on 32bit kernel (instead of using CONFIG_64BIT) ?

> My approach for 64bit CAS on 32bit is be the following :
>   - Load old into 2 registers
>   - Compare low and high part and bail out if different
>   - Load new into a FPU register
>   - Store the content of the FPU register to the memory
> 
> The point here being to do the store in the last step in a single 
> instruction.
> I think the same approach can be used for 128bit CAS as well but I
> don't think it's needed at the moment.

Since the 64bit CAS on 32bit currently uses 9 asms, it can't be added as is right now anyway.
Maybe it makes sense to pull out the "flddx 0(%sr3,%r24), %fr4" from this content and to preload
it to where you set up r22/r23-high/low ?

> Regading the GCC counterpart of the implementation, I'm not sure about 
> the way to proceed.
> 
> Should I try to detect the presence of the new LWS and use it for all 
> CAS operations at init time ?

I leave this up to Dave & Carlos to answer. 

> So far I only used the new LWS for 64bit CAS.

+       /***************************************************
+               New CAS implementation which uses pointers and variable size information.
+               The value pointed by old and new MUST NOT change while performing CAS.
+               The lock only protect the value at %r26.
+
+               %r26 - Address to examine
+               %r25 - Pointer to the value to check (old)
+               %r24 - Pointer to the value to set (new)
+               %r23 - Size of the variable (8bit = 0, 16bit = 1, 32bit = 2, 64bit = 4)

Since you shift %r23 in your code, I think the comment above is wrong for 64bit which should be 3 instead of 4 ?

You use nop's in your code to align to 32 bytes to be able to jump.
Does it make sense to use .align 32 instead ? I'm not sure myself about that...

Should we maybe drop the whole ENABLE_LWS_DEBUG thing? Was it ever used/enabled?

> I guess that using the new LWS unconditionally for all CAS operations 
> isn't an option since it will break for newer gcc on old kernels.

Up to now we only had the 32bit CAS working correctly, so we shouldn't care much
about the other CAS anyway. 
And if we get it backported into all relevant kernels before we change gcc
I would prefer this hard break...

Helge
