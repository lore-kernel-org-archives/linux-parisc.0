Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2C584858
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Jul 2003 10:10:44 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19hAaB-0003CN-2A; Mon, 28 Jul 2003 17:10:43 +0100
Date: Mon, 28 Jul 2003 17:10:43 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] k-2.6.0-test2-pa0: __canonicalize_f_f_c patch
Message-ID: <20030728161043.GB3840@parcelfarce.linux.theplanet.co.uk>
References: <3F056E95000057BB@ocpmta4.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F056E95000057BB@ocpmta4.freegates.net>
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

On Mon, Jul 28, 2003 at 04:30:14PM +0200, Joel Soete wrote:
> diff -NaurX dontdiff linux-2.6.0-test2-pa0/arch/parisc/kernel/parisc_ksyms.c
> linux-2.6.0-test2-pax/arch/parisc/kernel/parisc_ksyms.c
> --- linux-2.6.0-test2-pa0/arch/parisc/kernel/parisc_ksyms.c	2003-06-10 07:34:05.000000000
> +0200
> +++ linux-2.6.0-test2-pax/arch/parisc/kernel/parisc_ksyms.c	2003-07-28 13:22:48.000000000
> +0200
> @@ -122,10 +122,12 @@
>  extern off_t sys_lseek(int, off_t, int);
>  extern int sys_read(int, char *, int);
>  extern int sys_write(int, const char *, int);
> +asmlinkage long sys_wait4(pid_t ,unsigned int *, int, struct rusage *);
>  EXPORT_SYMBOL(sys_open);
>  EXPORT_SYMBOL(sys_lseek);
>  EXPORT_SYMBOL(sys_read);
>  EXPORT_SYMBOL(sys_write);
> +EXPORT_SYMBOL(sys_wait4);
>  
>  #include <asm/semaphore.h>
>  EXPORT_SYMBOL(__up);

this bit seems unrelated; why do we need it?

> And also uaccess patch to avoid to obtain a wronb executable k (as for other
> platform):
> diff -NaurX dontdiff linux-2.6.0-test2-pa0/include/asm-parisc/uaccess.h linux-2.6.0-test2-pax/include/asm-parisc/uaccess.h
> --- linux-2.6.0-test2-pa0/include/asm-parisc/uaccess.h	2003-01-13 08:42:40.000000000
> +0100
> +++ linux-2.6.0-test2-pax/include/asm-parisc/uaccess.h	2003-07-28 15:18:12.000000000
> +0200
> @@ -28,6 +28,11 @@
>   * that put_user is the same as __put_user, etc.
>   */
>  
> +extern int __get_kernel_bad(void);
> +extern int __get_user_bad(void);
> +extern int __put_kernel_bad(void);
> +extern int __put_user_bad(void);
> +
>  #define access_ok(type,addr,size)   (1)
>  #define verify_area(type,addr,size) (0)
>  
> @@ -35,8 +40,8 @@
>  #define get_user __get_user
>  
>  #if BITS_PER_LONG == 32
> -#define LDD_KERNEL(ptr)		BUG()
> -#define LDD_USER(ptr)		BUG()
> +#define LDD_KERNEL(ptr) __get_kernel_bad();
> +#define LDD_USER(ptr) __get_user_bad();
>  #define STD_KERNEL(x, ptr) __put_kernel_asm64((u32)x,ptr)
>  #define STD_USER(x, ptr) __put_user_asm64((u32)x,ptr)
>  #else
> @@ -72,7 +77,7 @@
>  	    case 2: __get_kernel_asm("ldh",ptr); break; \
>  	    case 4: __get_kernel_asm("ldw",ptr); break; \
>  	    case 8: LDD_KERNEL(ptr); break;		\
> -	    default: BUG(); break;                      \
> +	    default: __get_kernel_bad(); break;         \
>  	    }                                           \
>  	}                                               \
>  	else {                                          \
> @@ -81,7 +86,7 @@
>  	    case 2: __get_user_asm("ldh",ptr); break;   \
>  	    case 4: __get_user_asm("ldw",ptr); break;   \
>  	    case 8: LDD_USER(ptr);  break;		\
> -	    default: BUG(); break;                      \
> +	    default: __get_user_bad(); break;           \
>  	    }                                           \
>  	}                                               \
>  							\
> @@ -141,7 +146,7 @@
>  	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
>  	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
>  	    case 8: STD_KERNEL(x,ptr); break;			\
> -	    default: BUG(); break;                              \
> +	    default: __put_kernel_bad(); break;			\
>  	    }                                                   \
>  	}                                                       \
>  	else {                                                  \
> @@ -150,7 +155,7 @@
>  	    case 2: __put_user_asm("sth",x,ptr); break;         \
>  	    case 4: __put_user_asm("stw",x,ptr); break;         \
>  	    case 8: STD_USER(x,ptr); break;			\
> -	    default: BUG(); break;                              \
> +	    default: __put_user_bad(); break;			\
>  	    }                                                   \
>  	}                                                       \
>  								\

i like this one.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
