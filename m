Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5D8B488D
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  1 Feb 2004 05:16:30 -0700 (MST)
Message-ID: <401CEEA9.3030500@tiscali.be>
Date: Sun, 01 Feb 2004 12:18:49 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] About 2.6 64bit on b2k?
References: <400CB8A1000070BA@ocpmta3.freegates.net>
	<401C4B13.3060906@tiscali.be>
	<20040201050043.GC3730@colo.lackof.org>
In-Reply-To: <20040201050043.GC3730@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

HI Grant,


Grant Grundler wrote:
> On Sun, Feb 01, 2004 at 12:40:51AM +0000, Joel Soete wrote:
> 
>>I don't understand why it works on c3k and not on b2k.
>>Could it be because by b2k has only 256k of physical ram?
> 
> 
> No. And you meant 256MB.
Oops yes :)

> But c3k and b2k both supported the same DIMMs originally (128 and 256MB
> DIMMS). Minimum mem possible was thus 128MB and I thought 256MB was
> the minimum shipped with each box.
> 
> Sorry - I don't know why reverting that diff matters.
> 
Not more, I will try to objdump the two head64.o and see what the diff?

> 
>>Also, I notice that in head64.S there aren't .import like:
>>[snip]
>>        .import init_thread_union,data
>>        .import $global$                /* forward declaration */
>>        .import fault_vector_11,code    /* IVA parisc 1.1 32 bit */
>>        .import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
>>[snip]
>>
>>as in its 32bit brother head.S
> 
> 
> head64.S only runs wide mode on PA20 HW.
> No need for any PA11 or narrow mode code.
I understand that but less '.import init_thread_union,data' when
[snip]
         /* And the stack pointer too */
         load32          PA(init_thread_union+THREAD_SZ_ALGN),%sp

[snip]
(never the less in the working 2.4 it was the same, so I trust that the problem is very well in the computed pointers?
But I don't have material right now to check ;) )
I am also curious to revert patch on the N (on which the patch works)?

> Look in the Makefile and see when head64.o is linked in.
> Then you'll *SMACK* yourself on the forehead and say "DOH!" :^)
> 
> 
> 
>>I don't yet find the meaning of '.import' but just in case ;)
> 
> 
> AFAIK, it's just telling the assembler where to expect global symbols.
> 
> grant
> 
Many thanks,
	Joel
