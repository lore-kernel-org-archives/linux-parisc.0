From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [RFC 1/4] mm: remove unused TASK_SIZE_OF()
Date: Mon, 2 Jan 2017 07:57:13 +0100
Message-ID: <20170102065713.GB4779@osiris>
References: <20161230155634.8692-1-dsafonov@virtuozzo.com>
 <20161230155634.8692-2-dsafonov@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, 0x7f454c46@gmail.com,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvi
To: Dmitry Safonov <dsafonov@virtuozzo.com>
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20161230155634.8692-2-dsafonov@virtuozzo.com>
List-ID: <sparclinux.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 30, 2016 at 06:56:31PM +0300, Dmitry Safonov wrote:
> All users of TASK_SIZE_OF(tsk) have migrated to mm->task_size or
> TASK_SIZE_MAX since:
> commit d696ca016d57 ("x86/fsgsbase/64: Use TASK_SIZE_MAX for
> FSBASE/GSBASE upper limits"),
> commit a06db751c321 ("pagemap: check permissions and capabilities at
> open time"),
> 
> Signed-off-by: Dmitry Safonov <dsafonov@virtuozzo.com>
> ---
...

> diff --git a/arch/s390/include/asm/processor.h b/arch/s390/include/asm/processor.h
> index 6bca916a5ba0..c53e8e2a51ac 100644
> --- a/arch/s390/include/asm/processor.h
> +++ b/arch/s390/include/asm/processor.h
> @@ -89,10 +89,9 @@ extern void execve_tail(void);
>   * User space process size: 2GB for 31 bit, 4TB or 8PT for 64 bit.
>   */
> 
> -#define TASK_SIZE_OF(tsk)	((tsk)->mm->context.asce_limit)
>  #define TASK_UNMAPPED_BASE	(test_thread_flag(TIF_31BIT) ? \
>  					(1UL << 30) : (1UL << 41))
> -#define TASK_SIZE		TASK_SIZE_OF(current)
> +#define TASK_SIZE		(current->mm->context.asce_limit)
>  #define TASK_MAX_SIZE		(1UL << 53)
> 
>  #define STACK_TOP		(1UL << (test_thread_flag(TIF_31BIT) ? 31:42))

FWIW, for the s390 part:

Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com>

