From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: ldcw inline assembler patch
Date: Mon, 16 Jun 2008 16:50:23 -0400
Message-ID: <119aab440806161350w4d15c14ex735377b78f697fd8@mail.gmail.com>
References: <4853E587.9020802@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	"John David Anglin" <dave.anglin@nrc.ca>
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4853E587.9020802@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 14, 2008 at 11:36 AM, Helge Deller <deller@gmx.de> wrote:
> I'm wondering if this patch might help people who are seeing locking
> problems on SMP boxes ?
> Helge
>
> diff --git a/include/asm-parisc/system.h b/include/asm-parisc/system.h
> index ee80c92..4752684 100644
> --- a/include/asm-parisc/system.h
> +++ b/include/asm-parisc/system.h
> @@ -168,8 +168,9 @@ static inline void set_eiem(unsigned long val)
>  /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
>  #define __ldcw(a) ({                                           \
>        unsigned __ret;                                         \
> -       __asm__ __volatile__(__LDCW " 0(%1),%0"                 \
> -               : "=r" (__ret) : "r" (a));                      \
> +       __asm__ __volatile__(__LDCW " 0(%2),%0"                 \
> +                       : "=r" (__ret), "=m" (*(a))             \
> +                       : "r" (a), "m" (*(a))   );              \
>        __ret;                                                  \
>  })

You don't want to do that, the compiler might hold "=m" (*(a)) in a
temporary memory location.

e.g.
temp_mem = *a;
reg2 = &temp_mem;
... operation ...
*a = temp_mem;

You would be atomic with regards to the store to temp_mem, but not a.
Infact this could always be the case.

I'm now of the opinion that we need a "memory" clobber in the original
expression to prevent this from ever happening.

Cheers,
Carlos.
