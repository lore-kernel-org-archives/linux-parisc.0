From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] New debian libc6 2.3.5: glibc bug or kernel bug???
Date: Thu, 11 Aug 2005 12:14:03 -0400
Message-ID: <20050811161403.GJ18837@roadwarrior.mcmartin.ca>
References: <IL2FAI$E2431D04B8D36037CE9372A0DCCE240D@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IL2FAI$E2431D04B8D36037CE9372A0DCCE240D@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 11, 2005 at 06:03:54PM +0200, Joel Soete wrote:
> mmm, I am looking to the diff between 2.6.11 and 2.6.12 in p-l field only
> (i.e. arch/parisc and include/asm-parisc) and find a few related to threads
> excepted those hunks:

This should only effect unaligned traps, and only if the process has
flags set with prctl.

> --- linux-2.6.11.12-pa4-050316-gcc40/arch/parisc/kernel/unaligned.c
> 2004-10-04 21:12:49.000000000 +0200
> +++ linux-2.6.12.2-pa2-050626/arch/parisc/kernel/unaligned.c    2005-07-12
> 18:04:51.000000000 +0200
> @@ -513,15 +513,18 @@
>         register int flop=0;    /* true if this is a flop */
> 
>         /* log a message with pacing */
> -       if (user_mode(regs))
> -       {
> -               if (unaligned_count > 5 && jiffies - last_time > 5*HZ)
> -               {
> +       if (user_mode(regs)) {
> +                if (current->thread.flags & PARISC_UAC_SIGBUS) {
> +                        goto force_sigbus;
> +                }
> +
> +               if (unaligned_count > 5 && jiffies - last_time > 5*HZ) {
>                         unaligned_count = 0;
>                         last_time = jiffies;
>                 }
> -               if (++unaligned_count < 5)
> -               {
> +
> +               if (!(current->thread.flags & PARISC_UAC_NOPRINT)
> +                    && ++unaligned_count < 5) {
>                         char buf[256];
>                         sprintf(buf, "%s(%d): unaligned access to 0x" RFMT "
> at ip=0x" RFMT "\n",
>                                 current->comm, current->pid, regs->ior,
> regs->iaoq[0]);
> ====<>====
> --- linux-2.6.11.12-pa4-050316-gcc40/include/asm-parisc/processor.h
> 2005-01-13 08:53:35.000000000 +0100
> +++ linux-2.6.12.2-pa2-050626/include/asm-parisc/processor.h    2005-05-20
> 07:47:27.000000000 +0200
> @@ -121,8 +121,27 @@
>  };
> 
>  /* Thread struct flags. */
> +#define PARISC_UAC_NOPRINT     (1UL << 0)      /* see prctl and unaligned.c */
> +#define PARISC_UAC_SIGBUS      (1UL << 1)
>  #define PARISC_KERNEL_DEATH    (1UL << 31)     /* see die_if_kernel()... */
> 
> +#define PARISC_UAC_SHIFT       0
> +#define PARISC_UAC_MASK                (PARISC_UAC_NOPRINT|PARISC_UAC_SIGBUS)
> +
> +#define SET_UNALIGN_CTL(task,value)                                       \
> +        ({                                                                \
> +        (task)->thread.flags = (((task)->thread.flags & ~PARISC_UAC_MASK) \
> +                                | (((value) << PARISC_UAC_SHIFT) &        \
> +                                   PARISC_UAC_MASK));                     \
> +        0;                                                                \
> +        })
> +
> +#define GET_UNALIGN_CTL(task,addr)                                        \
> +        ({                                                                \
> +        put_user(((task)->thread.flags & PARISC_UAC_MASK)                 \
> +                 >> PARISC_UAC_SHIFT, (int __user *) (addr));             \
> +        })
> +
>  #define INIT_THREAD { \
>         regs:   {       gr: { 0, }, \
>                         fr: { 0, }, \
> 
> ====<>====
> 
> Sorry no more time today for me to check but may be could you have a look with
> tausq, patoferio and al ;-)
> 
> Thanks,
>     Joel
> 
> 
> -------------------------------------------------------
> NOTE! My email address is changing to ... @scarlet.be
> Please make the necessary changes in your address book. 
> 
> 
> 

-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
