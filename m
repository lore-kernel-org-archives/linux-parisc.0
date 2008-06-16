From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: ldcw inline assembler patch
Date: Mon, 16 Jun 2008 17:54:24 -0400
Message-ID: <119aab440806161454v49c15f47k75dbf27215d4a978@mail.gmail.com>
References: <4853E587.9020802@gmx.de>
	 <119aab440806161350w4d15c14ex735377b78f697fd8@mail.gmail.com>
	 <4856D5E4.7090206@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	"John David Anglin" <dave.anglin@nrc.ca>
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4856D5E4.7090206@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 16, 2008 at 5:06 PM, Helge Deller <deller@gmx.de> wrote:
> So, your proposal is (copy-and-pasted in here) the following ?
>
> diff --git a/include/asm-parisc/system.h b/include/asm-parisc/system.h
> index ee80c92..daeae39 100644
> --- a/include/asm-parisc/system.h
> +++ b/include/asm-parisc/system.h
> @@ -169,7 +169,7 @@ static inline void set_eiem(unsigned long val)
>  #define __ldcw(a) ({                                           \
>        unsigned __ret;                                         \
>        __asm__ __volatile__(__LDCW " 0(%1),%0"                 \
> -               : "=r" (__ret) : "r" (a));                      \
> +               : "=r" (__ret) : "r" (a) : "memory" );          \
>        __ret;                                                  \
>  })

Yes. The asm should clobber memory thus forcing the compiler to avoid
memory temporaries.

Dave may have other opinions.

I think this solution is the safest.

Cheers,
Carlos.
