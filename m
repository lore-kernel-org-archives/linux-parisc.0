Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1BF8B488A
	for <parisc-linux@parisc-linux.org>;
	Sat, 24 Jan 2004 13:50:19 -0700 (MST)
Message-ID: <4012DB06.5010600@tiscali.be>
Date: Sat, 24 Jan 2004 20:52:22 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [parisc-linux] missing barrier in _raw_spin_lock?
References: <200401231609.56800.arnd@arndb.de>
In-Reply-To: <200401231609.56800.arnd@arndb.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Arnd Bergmann wrote:
> We stumbled over a problem on s390 that can cause random memory corruption
> under high load on SMP. It turned out to be a missing on :"memory" clobber
> on the _raw_spin_lock primitive.
> 
> As far as I can see, the same problem is in the parisc spinlock definition
> in linux-2.6.1, but none of the other architectures.
> 
> The code below demonstrates the problem. With the broken spinlock, the
> compiler does not emit code for the second "if" or for the assignment.
> Similar code can be found in mempool_free().
> 
> 	Arnd <><
> 
> ----
> #include <linux/spinlock.h>
> 
hmm yet another stupid question of mine: what would we have to use _linux_/spinlock.h or _asm_/spinlock.h

Thanks in advance,
	Joel


> static int x;
> static spinlock_t lock;
> 
> void test(void)
> {
>         if (x) {
>                 spin_lock(&lock);
>                 if (!x)
>                         x = 0x1234;
>                 spin_unlock(&lock);
>         }
> }
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
