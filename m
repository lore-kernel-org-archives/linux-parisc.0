Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 309384829
	for <parisc-linux@parisc-linux.org>; Fri,  4 Oct 2002 10:05:15 -0600 (MDT)
Date: Fri, 4 Oct 2002 09:08:33 -0700
From: Randolph Chung <randolph@tausq.org>
To: Joel.soete@freebel.net
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Need help to improve uaccess.h patch
Message-ID: <20021004160833.GB5602@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3D8EED0B00001557@ocpmta5.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D8EED0B00001557@ocpmta5.be.tiscali.com>
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

Note: i haven't tested the patch, just some first-pass comments:

>  #else
>  #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
>  #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
> @@ -68,27 +73,28 @@
>  ({                                                      \
>  	register long __gu_err __asm__ ("r8") = 0;      \
>  	register long __gu_val __asm__ ("r9") = 0;      \
> +                                                        \
> +        unsigned int __tmp = 0;                         \
>  							\
>  	if (segment_eq(get_fs(),KERNEL_DS)) {           \
>  	    switch (sizeof(*(ptr))) {                   \
> -	    case 1: __get_kernel_asm("ldb",ptr); break; \
> -	    case 2: __get_kernel_asm("ldh",ptr); break; \
> -	    case 4: __get_kernel_asm("ldw",ptr); break; \
> -	    case 8: LDD_KERNEL(ptr); break;		\
> +	    case 1: __get_kernel_asm("ldb",x, ptr); break; \
> +	    case 2: __get_kernel_asm("ldh",x, ptr); break; \
> +	    case 4: __get_kernel_asm("ldw",x, ptr); break; \
> +	    case 8: LDD_KERNEL(x, ptr); break;		\
>  	    default: BUG(); break;                      \
>  	    }                                           \
>  	}                                               \
>  	else {                                          \
>  	    switch (sizeof(*(ptr))) {                   \
> -	    case 1: __get_user_asm("ldb",ptr); break;   \
> -	    case 2: __get_user_asm("ldh",ptr); break;   \
> -	    case 4: __get_user_asm("ldw",ptr); break;   \
> -	    case 8: LDD_USER(ptr);  break;		\
> +	    case 1: __get_user_asm("ldb",x, ptr); break;   \
> +	    case 2: __get_user_asm("ldh",x, ptr); break;   \
> +	    case 4: __get_user_asm("ldw",x, ptr); break;   \
> +	    case 8: LDD_USER(x, ptr);  break;		\
>  	    default: BUG(); break;                      \
>  	    }                                           \
>  	}                                               \
>  							\
> -	(x) = (__typeof__(*(ptr))) __gu_val;            \
>  	__gu_err;                                       \
>  })

why did you push the cast into the asm functions?

> -#define __get_user_asm(ldx,ptr)                         \
> +#define __get_kernel_asm_64(x, ptr)                         \
> +        __asm__ ("\n\tldw\t4(%1),%3\n"                      \
> +                 "1:\tstw\t%3,4(%2)\n"                      \
> +                 "\tldw\t0(%1),%3\n"                        \
> +                 "2:\tstw\t%3,0(%2)\n"                      \
> +                "3:\n"                                      \
> +                "\t.section __ex_table,\"a\"\n"             \
> +                 "\t.word\t1b\n"                            \
> +                 "\t.word\t(3b-1b)+1\n"                     \
> +                 "\t.word\t2b\n"                            \
> +                 "\t.word\t(3b-2b)+1\n"                     \

what's with the +1?

>  #define __put_user(x,ptr)                                       \
>  ({								\
>  	register long __pu_err __asm__ ("r8") = 0;		\
> +        unsigned long long X = (unsigned long long) x;          \

why do you need this cast?

> +        unsigned long long * __tmp = 0;                         \

if __tmp is only used in the STD macro, you should eiter pass it to the
macro or define it inside that macro.

>  	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
>  	    switch (sizeof(*(ptr))) {                           \
>  	    case 1: __put_kernel_asm("stb",x,ptr); break;       \
>  	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
>  	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
> -	    case 8: STD_KERNEL(x,ptr); break;			\
> +	    case 8: STD_KERNEL(X,ptr); break;			\
>  	    default: BUG(); break;                              \
>  	    }                                                   \
>  	}                                                       \
> @@ -152,7 +193,7 @@
>  	    case 1: __put_user_asm("stb",x,ptr); break;         \
>  	    case 2: __put_user_asm("sth",x,ptr); break;         \
>  	    case 4: __put_user_asm("stw",x,ptr); break;         \
> -	    case 8: STD_USER(x,ptr); break;			\
> +	    case 8: STD_USER(X,ptr); break;			\
>  	    default: BUG(); break;                              \
>  	    }                                                   \
>  	}                                                       \
> @@ -200,6 +241,22 @@
>  		: "=r"(__pu_err)                            \
>  		: "r"(ptr), "r"(x), "0"(__pu_err))
>  
> +#define __put_kernel_asm_64(X, ptr)                           \
> +	__asm__ __volatile__ (                              \
> +		"\n\tldw\t0(%2),%3\n"                       \
> +		"1:\tstw\t%3,0(%1)\n"                 \
> +		"\tldw\t4(%2),%3\n"		            \
> +		"2:\tstw\t%3,4(%1)\n"                 \
> +		"3:\n"					    \
> +		"\t.section __ex_table,\"a\"\n"             \
> +		 "\t.word\t1b\n"                            \
> +		 "\t.word\t(3b-1b)+1\n"                     \
> +		 "\t.word\t2b\n"                            \
> +		 "\t.word\t(3b-2b)+1\n"                     \

as above, why +1?

> +		 "\t.previous"                              \
> +		: "=r"(__pu_err)                            \
> +		: "r"(ptr), "r"(&(X)), "r"(__tmp), "0"(__pu_err))
> +
>  #define __put_user_asm(stx,x,ptr)                           \
>  	__asm__ __volatile__ (                              \
>  		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
> @@ -210,6 +267,23 @@
>  		 "\t.previous"                              \
>  		: "=r"(__pu_err)                            \
>  		: "r"(ptr), "r"(x), "0"(__pu_err))
> +
> +#define __put_user_asm_64(X, ptr)                           \
> +	__asm__ __volatile__ (                              \
> +		"\n\tldw\t0(%2),%3\n"                       \
> +		"1:\tstw\t%3,0(%%sr3,%1)\n"                 \
> +		"\tldw\t4(%2),%3\n"		            \
> +		"2:\tstw\t%3,4(%%sr3,%1)\n"                 \
> +		"3:\n"					    \
> +		"\t.section __ex_table,\"a\"\n"             \
> +		 "\t.word\t1b\n"                            \
> +		 "\t.word\t(3b-1b)+1\n"                     \
> +		 "\t.word\t2b\n"                            \
> +		 "\t.word\t(3b-2b)+1\n"                     \

ditto, this probably should be +3 to indicate a userspace address.

your code also creates an artifact that may or may not be ok -- if you
do a 64-bit put_user or get_user on a 32-bit aligned address, this will
work with a 32-bit kernel but will trap on a 64-bit kernel. i guess
that's ok, but just something to keep in mind.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
