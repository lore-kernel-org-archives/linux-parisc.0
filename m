Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABD2B488A
	for <parisc-linux@parisc-linux.org>;
	Sat, 24 Jan 2004 14:05:32 -0700 (MST)
Message-ID: <4012DE98.9090605@tiscali.be>
Date: Sat, 24 Jan 2004 21:07:36 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] missing barrier in _raw_spin_lock?
References: <200401231609.56800.arnd@arndb.de> <4012DB06.5010600@tiscali.be>
In-Reply-To: <4012DB06.5010600@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Arnd Bergmann <arnd@arndb.de>, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Joel Soete wrote:
> 
> 
> Arnd Bergmann wrote:
> 
>> We stumbled over a problem on s390 that can cause random memory 
>> corruption
>> under high load on SMP. It turned out to be a missing on :"memory" 
>> clobber
>> on the _raw_spin_lock primitive.
>>
>> As far as I can see, the same problem is in the parisc spinlock 
>> definition
>> in linux-2.6.1, but none of the other architectures.
>>
>> The code below demonstrates the problem. With the broken spinlock, the
>> compiler does not emit code for the second "if" or for the assignment.
>> Similar code can be found in mempool_free().
>>
>>     Arnd <><
>>
>> ----
>> #include <linux/spinlock.h>
>>
> hmm yet another stupid question of mine: what would we have to use 
> _linux_/spinlock.h or _asm_/spinlock.h
Oops appologies: the answer is in linux/spinlock (i was just confused because for my c110 I didn't configure SMP)

Thanks for your understand,
	Joel

> 
> Thanks in advance,
>     Joel
> 
> 
>> static int x;
>> static spinlock_t lock;
>>
>> void test(void)
>> {
>>         if (x) {
>>                 spin_lock(&lock);
>>                 if (!x)
>>                         x = 0x1234;
>>                 spin_unlock(&lock);
>>         }
>> }
>>
>> _______________________________________________
>> parisc-linux mailing list
>> parisc-linux@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
> 
