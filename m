From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] fix ldcw inline assembler
Date: Fri, 1 May 2009 14:18:22 -0400
Message-ID: <119aab440905011118lbc3bcectfd5862477c2598a8@mail.gmail.com>
References: <49FA1AA1.3060104@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Thibaut VARENE <varenet@debian.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49FA1AA1.3060104@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 30, 2009 at 5:39 PM, Helge Deller <deller@gmx.de> wrote:
> diff --git a/arch/parisc/include/asm/system.h b/arch/parisc/include/a=
sm/system.h
> index ee80c92..d91357b 100644
> --- a/arch/parisc/include/asm/system.h
> +++ b/arch/parisc/include/asm/system.h
> @@ -168,8 +168,8 @@ static inline void set_eiem(unsigned long val)
> =A0/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.=
 =A0*/
> =A0#define __ldcw(a) ({ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0unsigned __ret; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> - =A0 =A0 =A0 __asm__ __volatile__(__LDCW " 0(%1),%0" =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 : "=3Dr" (__ret) : "r" (a)); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 __asm__ __volatile__(__LDCW " 0(%2),%0" =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 : "=3Dr" (__ret), "+m" (*(a)) : "r" (a)=
); =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0__ret; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0})

Historical note...

We clobber all of memory in userspace, like this:
~~~
#define __ldcw(a) \
({                                                                     =
 \
  unsigned int __ret;                                                  =
 \
  __asm__ __volatile__("ldcw 0(%1),%0"                                 =
 \
                       : "=3Dr" (__ret) : "r" (a) : "memory");         =
   \
  __ret;                                                               =
 \
})
~~~
I wonder if I should change that to match the kernel?

This is currently used in the Linuxthreads->NPTL compat code, and in
the old Linuxthreads code.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
