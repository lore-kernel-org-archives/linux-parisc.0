Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FC83482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jan 2002 01:06:41 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16RU2k-00055x-00; Fri, 18 Jan 2002 08:06:34 +0000
Date: Fri, 18 Jan 2002 08:06:34 +0000
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sched-O1-2.4.17-I3.patch, need help
Message-ID: <20020118080634.A7462@parcelfarce.linux.theplanet.co.uk>
References: <1011338378.3c47cc8a895dd@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1011338378.3c47cc8a895dd@webmail.tiscalinet.be>; from joel.soete@freebel.net on Fri, Jan 18, 2002 at 08:19:38AM +0100
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

On Fri, Jan 18, 2002 at 08:19:38AM +0100, joel.soete@freebel.net wrote:
> +
> +static __inline__ void __clear_bit(int nr, volatile void * addr)
> +{
> +       __asm__ __volatile__(
> +               "btrl %1,%0"
> +               :"=m" (ADDR)
> +               :"Ir" (nr));
> +}

__clear_bit is simply a lockless clear_bit.  it's the same difference
between __set_bit and set_bit.

>  /*
> + * Every architecture must define this function. It's the fastest
> + * way of searching a 168-bit bitmap where the first 128 bits are
> + * unlikely to be set. It's guaranteed that at least one of the 168
> + * bits is cleared.
> + */
> +#if MAX_RT_PRIO != 128 || MAX_PRIO != 168
> +# error update this function.
> +#endif
> +
> +static inline int sched_find_first_zero_bit(unsigned long *b)
> +{
> +       unsigned int rt;
> +
> +       rt = b[0] & b[1] & b[2] & b[3];
> +       if (unlikely(rt != 0xffffffff))
> +               return find_first_zero_bit(b, MAX_RT_PRIO);
> +
> +       if (b[4] != ~0)
> +               return ffz(b[4]) + MAX_RT_PRIO;
> +       return ffz(b[5]) + 32 + MAX_RT_PRIO;
> +}
> +/*

hrm -- actually a little tricky.  Yes, this function for 32-bit compiles,
but not for 64-bit compiles (long changes size, and of course that means
it can be done more quickly on 64-bit quantities instead of 32-bit).

> And what do you about this one (how to implement it on hppa?):
> 
> --- linux/arch/i386/kernel/process.c.orig       Sun Jan  6 13:55:47 2002
> +++ linux/arch/i386/kernel/process.c    Wed Jan 16 00:52:28 2002
> @@ -123,15 +123,12 @@
>  void cpu_idle (void)
>  {
>         /* endless idle loop with no priority at all */
> -       init_idle();
> -       current->nice = 20;
> -       current->counter = -100;

yup, delete these.

>         while (1) {
>                 void (*idle)(void) = pm_idle;
>                 if (!idle)
>                         idle = default_idle;
> -               while (!current->need_resched)
> +               if (!current->need_resched)
>                         idle();
>                 schedule();
>                 check_pgt_cache();

Dunno.

-- 
Revolutions do not require corporate support.
